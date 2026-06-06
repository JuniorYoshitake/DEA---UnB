library(dplyr)
library(car) 
library(MASS)
library(gmodels)

# EX 41 ########################################################################

embalagem <- factor(rep(c("Comercial", "Vacuo", "Mistura", "CO2"), each = 3))
contagem <- c(7.66, 6.98, 7.80, 5.26, 5.44, 5.80, 7.41, 7.33, 7.04, 3.51, 2.91, 3.66)

dados_carne <- data.frame(Tratamento = embalagem, LogContagem = contagem)

print(dados_carne)

tapply(dados_carne$LogContagem, dados_carne$Tratamento, mean)

# voltando os dados à forma original

dados_carne <- dados_carne %>%
    mutate(contagem_og = exp(LogContagem))


# modelo com log

mod_log <- aov(LogContagem ~ embalagem, data = dados_carne)

res_log <- residuals(mod_log)

# normalidade

shapiro.test(res_log)

# homocedasticidade

leveneTest(LogContagem ~ embalagem, data = dados_carne)

qqnorm(res_log)
qqline(res_log)

# independencia fica na casualização do experimento,
# podemos notar que ele é balanceado pelo menos.

# modelo og 

mod <- aov(contagem_og ~ embalagem, data = dados_carne)

res_og <- residuals(mod)

qqnorm(res_og)
qqline(res_og)

# verificar se outra transformacao é adequada

mod_boxcox <- boxcox(mod)

lambda <- mod_boxcox$x[which.max(mod_boxcox$y)]

# como o lambda inclui 0 (0.020202), log é de fato a melhor transformação
# olhe o grafico, há um intervalo nele

# EX 42 ########################################################################

meio_cultura <- factor(rep(c("Controle", "Glucose", "Frutose", "Sucrose"), each = 5))
crescimento <- c(45, 39, 40, 45, 42,  # Controle
                 25, 28, 30, 29, 33,  # Glucose
                 28, 31, 24, 28, 27,  # Frutose
                 31, 37, 35, 33, 34)  # Sucrose

dados_tomate <- data.frame(Tratamento = meio_cultura, Resposta = crescimento)

mod_tom <- aov(crescimento ~ meio_cultura, data = dados_tomate)

res_tom <- residuals(mod_tom)

# normalidade

shapiro.test(res_tom) # nao rejeita

# homocedasticidade

leveneTest(crescimento ~ meio_cultura, data = dados_tomate) # nao rejeita

# indepedencia suposta pela casualizacao

# nao violou nada, tudo ok

# EX 43 ########################################################################

dados_43 <- c(14.3, 16.0, 17.3, 17.5, 17.8, 18.7, 18.8, 18.9, 20.0, 20.8, 21.4, 22.7, 23.2, 25.6, 27.8)


qqnorm(dados_43)
qqline(dados_43)

shapiro.test(dados_43) # nao rejeita

# de fato razoavel supor

amostra_norm <- rnorm(80, mean = 5, sd = 2)
qqnorm(amostra_norm, main = "Normal (5,2)"); qqline(amostra_norm)

amostra_t5 <- rt(80, df = 5)
qqnorm(amostra_t5, main = "t (gl=5)"); qqline(amostra_t5)

amostra_t20 <- rt(80, df = 20)
qqnorm(amostra_t20, main = "t (gl=20)"); qqline(amostra_t20)

amostra_t40 <- rt(80, df = 40)
qqnorm(amostra_t5, main = "t (gl=40)"); qqline(amostra_t40)

amostra_cauchy <- rcauchy(80)
qqnorm(amostra_cauchy, main = "Cauchy"); qqline(amostra_cauchy)

amostra_chisq5 <- rchisq(80, df = 5)
qqnorm(amostra_chisq5, main = "Chi-sq (gl=5)"); qqline(amostra_chisq5)

amostra_chisq20 <- rchisq(80, df = 20)
qqnorm(amostra_chisq20, main = "Chi-sq (gl=20)"); qqline(amostra_chisq20)

amostra_chisq40 <- rchisq(80, df = 40)
qqnorm(amostra_chisq40, main = "Chi-sq (gl=40)"); qqline(amostra_chisq40)

# de fato os dados_43 parecem a normal, superficialmente

# EX 44 ########################################################################

fermento <- factor(rep(c("0.25", "0.50", "0.75", "1.00"), each = 4))
crescimento <- c(11.4, 11.0, 11.3, 9.5,   # 0.25 tsp
                 27.8, 29.2, 26.8, 26.0,  # 0.50 tsp
                 47.6, 47.0, 47.3, 45.5,  # 0.75 tsp
                 61.6, 62.4, 63.0, 63.9)  # 1.00 tsp

dados_biscoito <- data.frame(Nivel = fermento, Resposta = crescimento)

mod_bisc <- aov(crescimento ~ fermento, data = dados_biscoito)

# A) UE = cada lote massa biscoito + UO

# B) contrastes: niveis igualmente espacados, logo, contraste
# -3, -1, 1, 3
MSE <- summary(mod_bisc)[[1]]["Residuals", "Mean Sq"] # 1.1239

medias <- tapply(crescimento, fermento, mean)

c <- c(-3, -1, 1, 3)

L <- sum(c * medias)

r <- 4
SQ_L <- r * L^2 / sum(c^2)
SQ_L

Fobs <- SQ_L/MSE # 5460 rejeita HO, crescimento é proporcional a qtd de fermento

# C) MSe

MSE <- summary(mod_bisc)[[1]]["Residuals", "Mean Sq"] # 1.1239


# D) verificar suposicoes anova

res_bisc <- residuals(mod_bisc)

shapiro.test(res_bisc) # nao rejeita

qqnorm(res_bisc)
qqline(res_bisc) # esquisito

leveneTest(crescimento ~ fermento, data = dados_biscoito) # nao rejeita

# assume independencia da casualizacao, entao sem violacao de pressupostos

# EX 45 ########################################################################

# o problema é que a suposicao da homodecasticidade (variancia constante) foi 
# violada, é possível notar isso através dos SDs, que aumentam conforme a dose 
# aumenta. logo eles nao sao constantes. É necessario transformar os dados, por 
# meio de box cox etc

# EX 46 ########################################################################

# pegar os dados, fazer boxcox, aplicar transformacao adequada, verificar suposicoes
# fazer tukey

# EX 47 ########################################################################

trat <- factor(rep(c("a", "b", "c", "d"), each = 5))
rate <- c(17, 20, 15, 21, 28,
                 7, 11, 15, 10, 10, 
                 11, 9, 5, 12, 6,
                 5, 4, 3, 7, 6)  

dados_rate <- data.frame(Nivel = trat, Resposta = rate)

mod_rate <- aov(rate ~ trat, data = dados_rate)

mod_boxcox <- boxcox(mod_rate)

lambda_max <- mod_boxcox$x[which.max(mod_boxcox$y)]

limite <- max(mod_boxcox$y) - qchisq(0.95, 1)/2

ic_95 <- range(mod_boxcox$x[mod_boxcox$y > limite]) # -0.303 e 0.828

# EX 48 ########################################################################

# G1 apresenta dados que se iniciam abaixo de zero e depois ficam acima de zero
# evidencia da violacao da hipotese de independencia de erros

# G2 dados em formato de funil, violacao da homocedasticidade

# G3 ok

# G4 cauda pesada assimetria a direita - desvio da normalidade

# declaro fim da lista

