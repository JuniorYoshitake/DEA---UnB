

################################################################################
# LISTA 5 
################################################################################

library(dplyr)
library(daewr)
library(emmeans)
library(car)
library(multcomp)
# EX 53 ########################################################################

# EX 54 Oehlert 8.1 ############################################################

# o Ex nao possibilita o o aov fazer nenhum teste F pois nao sobra graus de liberdade
# para o erro, mas como ele da o MSE podemos fazer por ele, caso nao desse, teriamos
# que seguir para o teste tukey de nao aditividade

dados <- WeightGain

mod_dieta <- aov(gain ~ source * calories, data = dados)

MSE_54 <- 8.75

ms_source <- 26.13
ms_calories <- 157.41
ms_interacao <- 34.34

f_source <- ms_source / MSE_54
f_calories <- ms_calories / MSE_54
f_interacao <- ms_interacao / MSE_54

p_source <- 1 - pf(f_source, 2, 9)
p_calories <- 1 - pf(f_calories, 2, 9)
p_interacao <- 1 - pf(f_interacao, 4, 9)

cat("P-valor Fonte:", p_source, "\nP-valor Calorias:", p_calories, "\nP-valor Interação:", p_interacao)

interaction.plot(dados$calories, dados$source, dados$gain, 
                 fixed = TRUE, col = 1:3, pch = 19, type = "b",
                 main = "Gráfico de Interação - Ex 8.1",
                 xlab = "Calorias", ylab = "Ganho de Peso Médio")

# ao observar o gráfico, a dieta bovina e suina, com o aumento de calorias, aumentam
# o ganho de peso medio consideravelmente, enquanto a de grãos não obtem beneficios
# com o aumento de calorias.


# EX 55 Oehlert 8.2 ############################################################

rm(list = ls())

load("C:\\Users\\Carlos Yoshitake Jr\\Desktop\\UnB\\DEA\\DEA---UnB\\cfcdae\\data\\RiceMalt.rda")

dados <- RiceMalt %>% select(-day.z, - temperature.z)

interaction.plot(dados$day, dados$temperature, dados$FAN, 
                 fixed = TRUE, col = 1:3, pch = 19, type = "b",
                 main = "Gráfico de Interação - Ex 8.2",
                 xlab = "dias", ylab = "FAN")

mod_55 <- aov(FAN ~ day * temperature, data = dados)

summary(mod_55)

# novamente os dados sao as medias, resultantes de 3 dias * 4 temperaturas, 12 
# combinacoes, com n=2, foram 24 originalmente, mas essa tabela que temos possui
# as medias apenas

# MAS o exercicio deu o SS total

SSto <- 8097

SSint <- 71
SStemp <- 1259
SSday <- 2590

SSmod <- SSint + SStemp + SSday

SSE <- SSto - SSmod

dias <- 3 
temperaturas <- 4
n <- 2

Erro_GL <- dias * temperaturas * n - dias * temperaturas

MSE <- SSE/Erro_GL


# F de cada topico

# interacao

MSint <- 11.8

Fint <- MSint/MSE

Int_gl <- (dias-1) * (temperaturas-1)

Fcrit_int <- qf(0.95, df1=Int_gl, df2=Erro_GL)

# Fint 0.03 < Fcrit_int 2.99

# temp

MStemp <- 419.7

Ftemp <- MStemp/MSE

temp_gl <- temperaturas-1

Fcrit_temp <- qf(0.95, df1=temp_gl, df2=Erro_GL)

# Ftemp 1.20 < Fcrit_temp 3.49

# day

MSday <- 1294.9

Fday <- MSday/MSE

day_gl <- dias-1

Fcrit_day <- qf(0.95, df1=day_gl, df2=Erro_GL)

# Fday 3.72 < Fcrit_day 3.885

# todos os testes nao rejeitaram a h0, com exceção do Fday que chegou perto do 
# Fcrit_day. Logo, os fatores agem de maneira independente ou aditiva, logo, o 
# proximo passo correto é analisar cada fator isolado.
# O grafico corrobora com essas ideias

# EX 56 Oehlert 8.8 ############################################################

rm(list = ls())

load("C:\\Users\\Carlos Yoshitake Jr\\Desktop\\UnB\\DEA\\DEA---UnB\\cfcdae\\data\\PopcornRatios.rda")

dados <- PopcornRatios

mod_pop <- aov(ratio ~ pType * pAmt *  oType * oAmt, data = dados)

summary(mod_pop)

interaction.plot(dados$oAmt, dados$pAmt, dados$ratio,
                 fixed = TRUE, col = c("darkgreen", "orange"),
                 type = "b", main = "Interação: Milho vs Óleo")

plot(mod_pop)

shapiro.test(residuals(mod_pop))

# há efeito de interação entre qtd de pipoca e qtd de oleo, a nivel de sig 0.05%
# ademais, o tipo de pipoca é o efeito mais significativo entre eles.

# EX 57 Oehlert 9.18 ###########################################################

rm(list = ls())

load("C:\\Users\\Carlos Yoshitake Jr\\Desktop\\UnB\\DEA\\DEA---UnB\\cfcdae\\data\\Cisplatin.rda")

dados <- Cisplatin %>% select(-Cisplatin.z)

mod_cis <- aov(count ~ Cisplatin * type, data = dados)

summary(mod_cis)

# sem gl para residuos pois há 6 em A e 2 em B, dando 12, e sao 12 linhas, n =1
# precisamos usar tukey para nao aditividade

interaction.plot(dados$Cisplatin, dados$type, dados$count,
                 fixed = TRUE, col = c("darkgreen", "orange"),
                 type = "b")

dados$Cisplatin <- factor(dados$Cisplatin)
dados$type <- factor(dados$type)

trans<- dados %>% mutate(count = log(count))

Tukey1df(dados[, c("count", "Cisplatin", "type")])

Tukey1df(trans[, c("count", "Cisplatin", "type")])

# como os dados transformados indicaram modelo aditivo, com pvalor >0.05 nao 
# rejeitamos h0 (h0 é que o modelo é aditivo, o teste, se o p valor fosse <0.05 
# rejeitaria h0 entendendo o modelo NAO aditivo) ENTAO

mod_novo <- aov(count ~ Cisplatin + type, data = trans)

summary(mod_novo)

# rejeitamos h0 (que aqui era igualdade de medias entre fatores, tipo, a media 
# de type1 =  type2) para ambos os fatores. Logo concluimos que diferentes
# quantidades de Cisplatina produzem o mesmo efeito médio na contagem das celulas
# e diferentes tipos de de contagem (convencional e corante) produzem medias
# iguais

# EX 58 Kuhel 6.1 ## ###########################################################

# A) Yij = media geral + efeito A + efeito B + efeito Interacao + erro exp aleatorio

rm(list = ls())

dados <- data.frame(
    Solvente = factor(rep(c(1, 2, 3), each = 8)),
    Base = factor(rep(rep(c(1, 2), each = 4), times = 3)),
    Reacao = c(
        # Solvente 1, Base 1
        91.3, 89.9, 90.7, 91.4,
        
        # Solvente 1, Base 2
        87.3, 89.4, 91.5, 88.3,
        
        # Solvente 2, Base 1
        89.3, 88.1, 90.4, 91.4,
        
        # Solvente 2, Base 2
        92.3, 91.5, 90.6, 94.7,
        
        # Solvente 3, Base 1
        89.5, 87.6, 88.3, 90.3,
        
        # Solvente 3, Base 2
        93.1, 90.7, 91.5, 89.8
    )
)

mod <- aov(Reacao ~ Solvente * Base, data = dados)
summary(mod)

# a um nivel de 0.05 de sig, rejeitamos h0 de que não há interacao. 
# Logo, há interacao significativa entre fatores Solvente:Base

model.tables(mod, type = "means")

interaction.plot(dados$Solvente, dados$Base, dados$Reacao, 
                 fixed = TRUE, col = c("blue", "red"), type = "b",
                 main = "Interação Solvente x Base",
                 xlab = "Solvente", ylab = "Percentual de Reação")


# concluimos que há diferenca significativa nos solventes 2 e 3 para as bases 1 e 2

print(comp_simples)

# EX 59 Kuhel 6.11 #############################################################

rm(list = ls())

dados <- data.frame(
    Solvente = factor(c(
        1,1,1,
        1,1,1,
        2,2,2,
        2,2,
        3,3,3,3,
        3,3,3
    )),
    
    Base = factor(c(
        1,1,1,
        2,2,2,
        1,1,1,
        2,2,
        1,1,1,1,
        2,2,2
    )),
    
    Reacao = c(
        # Solvente 1, Base 1
        90.7, 91.4, 90.4,
        
        # Solvente 1, Base 2
        87.3, 88.3, 91.5,
        
        # Solvente 2, Base 1
        89.3, 88.1, 90.4,
        
        # Solvente 2, Base 2
        94.7, 91.5,
        
        # Solvente 3, Base 1
        89.5, 87.6, 88.3, 90.3,
        
        # Solvente 3, Base 2
        93.1, 90.7, 91.5
    )
)

mod_ex59 <- aov(Reacao ~ Solvente * Base, data = dados, 
                contrasts = list(Solvente = contr.sum, Base = contr.sum))

Anova(mod_ex59, type = "III")

mod <- lm(Reacao ~ Solvente * Base, data = dados, contrasts = list(Solvente=contr.sum, Base=contr.sum))
Anova(mod, type = "III")

emmeans(mod, ~ Solvente * Base) # Médias das células
emmeans(mod, ~ Solvente)        # Médias marginais ajustadas

comp_simples <- emmeans(mod_ex59, pairwise ~ Base | Solvente)
comp_simples$contrasts

# EX 60 ########################################################################

rm(list = ls())

dados60 <- data.frame(
    Reacao = c(90.7, 89.3, 89.5,  # Base 10% nos Solventes 3%, 5%, 7%
               87.3, 85.7, 86.1), # Base 20% nos Solventes 3%, 5%, 7%
    Base = factor(c(10, 10, 10, 20, 20, 20)),
    Solvente = factor(c(3, 5, 7, 3, 5, 7))
)

Tukey1df(dados60) # p calor 0.5456 nao rejeita h0 de que o modelo é aditivo

dados60$Base <- factor(dados60$Base, ordered = TRUE)
dados60$Solvente <- factor(dados60$Solvente, ordered = TRUE)

Base.L <- contr.poly(2)[dados60$Base, ".L"]
Solvente.L <- contr.poly(3)[dados60$Solvente, ".L"]

mod_poly <- lm(Reacao ~ Base + Solvente + Base.L:Solvente.L, data = dados60)
anova(mod_poly)

# continuamos sem rejeitar h0 (h0 é nao existe interacao), apenas rejeitamos
# h0 para a quantidade de solvente, ou seja, a concentracao de solvente altera
# o percentual de reacao

# EX 61 KUEHL 6.3 Efeito da temp no encolhimento de 4 tipos de tecido ##########

rm(list = ls())

dados <- data.frame(
    Tela = factor(rep(1:4, each = 8)),
    Temperatura = factor(rep(c(210, 215, 220, 225), each = 2, times = 4), ordered = TRUE),
    Resposta = c(
        1.8, 2.1, 2.0, 2.1, 4.6, 5.0, 7.5, 7.9,
        2.2, 2.4, 4.2, 4.0, 5.4, 5.6, 9.8, 9.2,
        2.8, 3.2, 4.4, 4.8, 8.7, 8.4, 13.2, 13.0,
        3.2, 3.6, 3.3, 3.5, 5.7, 5.8, 10.9, 11.1
    )
)


# o modelo é Yij = Media geral + efeito fator A + efeitor fator B + efeito 
# interacao AB + erro experimental aleatorio

# a ANOVA é 

mod_61 <- aov(Resposta ~ Tela * Temperatura, data = dados)

summary(mod_61)

# a nivel de significancia de 0.05, a hipotese nula de que não há interacao 
# tela:temp é rejeitada. embora a hipotese seja rejeitada para todos as fontes
# de variacao

summary(mod_61, split = list(Temperatura = list(Linear = 1, Quadratico = 2)))

summary(mod_61, split = list(
    "Tela:Temperatura" = list(
        "Linear x Tela" = 1:3, 
        "Quadrático x Tela" = 4:6
    )
))


interaction.plot(x.factor = dados$Temperatura, 
                 trace.factor = dados$Tela, 
                 response = dados$Resposta,
                 type = "b", fixed = TRUE, pch = c(1,2,3,4),
                 col = c("blue", "red", "darkgreen", "black"),
                 main = "Perfil de Encolhimento: Tecido x Temperatura",
                 xlab = "Temperatura (°F)", 
                 ylab = "Encolhimento Médio (%)")

# EX 62 KUEHL 6.5 Efeito de Inseticida e herbicida no cresc e desenv de algodoeiro

rm(list = ls())

dados <- data.frame(
    Inseticida = factor(rep(c(0, 20, 40, 60, 80), each = 5), ordered = TRUE),
    Herbicida = factor(rep(c(0, 0.5, 1.0, 1.5, 2.0), each = 1, times = 5), ordered = TRUE),
    Resposta = c(
        122.0, 72.50, 52.00, 36.25, 29.25, 
        82.75, 84.75, 71.50, 80.50, 72.00,
        65.75, 68.75, 79.50, 65.75, 82.50,
        68.00, 70.00, 68.75, 77.25, 68.25, 
        57.50, 60.75, 63.00, 69.25, 73.25
        
    )
)

mod_65 <- aov(Resposta ~ Inseticida * Herbicida, data = dados)

summary(mod_65)

summary(mod_65, split = list(
    Inseticida = list(Lin = 1, Quad = 2, Cub = 3),
    Herbicida = list(Lin = 1, Quad = 2, Cub = 3),
    "Inseticida:Herbicida" = list(
        "I_Lin x H_Lin" = 1, 
        "I_Quad x H_Lin" = 5
    )
))


MSE <- 174 # 75 gl

# nao vou fazer essa merda

# EX 63 Miliken e Johnson 9.1

rm(list = ls())

dados63 <- data.frame(
    Escore = c(42, 44, 36, 13, 19, 22, 33, 26, 33, 21, 31, -3, 25, 24, # Droga 1 (D1, D2, D3)
               28, 23, 34, 42, 13, 34, 33, 31, 36, 3, 26, 28, 32, 4, 16, # Droga 2
               1, 24, 9, 22, -2, 15, 21, 1, 9, 3, 11, 9, 7, 1, -6, # Droga 3
               1, 29, 19, 22, 7, 25, 5, 12, 27, 12, -5, 16, 15, 12), # Droga 4
    Droga = factor(c(rep(1, 14), rep(2, 15), rep(3, 15), rep(4, 14))),
    Doenca = factor(c(rep(1,6), rep(2,4), rep(3,4),  # Droga 1
                      rep(1,5), rep(2,4), rep(3,6),  # Droga 2
                      rep(1,6), rep(2,4), rep(3,5),  # Droga 3
                      rep(1,3), rep(2,5), rep(3,6))) # Droga 4
)


#a)

mod_medias <- lm(Escore ~ 0 + Droga:Doenca, data = dados63)
summary(mod_medias)

#b)

# a 0.05 rejeita h0 (então há interacao) para os pares:

# Droga 1 Doenca 1
# Droga 2 Doenca 1
# Droga 3 Doenca 1
# Droga 4 Doenca 1
# Droga 1 Doenca 2
# Droga 1 Doenca 2
# Droga 2 Doenca 2
# Droga 4 Doenca 2
# Droga 1 Doenca 3
# Droga 2 Doenca 3
# Droga 4 Doenca 3

#c)


# EXEMPLO PROF

A <- rep(factor(c(1:2)), each = 8)
B <- rep(factor(c(1,1,1,2,2,3,3,3,1,1,2,2,2,3,3,3)))
Y <- c(19,20,21,24,26,22,25,25,25,27,21,24,24,31,32,33)

fnb <- data.frame(A,B,Y)

fnblm1 <- lm(Y ~ 0 + A:B, fnb)

anova(fnblm1)

coef(fnblm1)
