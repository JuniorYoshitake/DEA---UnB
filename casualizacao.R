
set.seed(123)

comum <- paste0("Comum_", 1:5)
premium <- paste0("Premium_", 1:5)

tempos <- c("04:00", "04:15", "04:30")

gerar_tempo <- function(t){
    
    data.frame(
        Tempo = t,
        Tipo = rep(c("Comum", "Premium"), each = 3),
        Pacote = c(
            sample(comum, 3),
            sample(premium, 3)
        )
    )
}

dados <- do.call(rbind, lapply(tempos, gerar_tempo))


dados <- dados[sample(nrow(dados)), ]

write.csv(x = dados, file = "casualizacao.csv")
