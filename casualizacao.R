
set.seed(190620026)

comum <- paste("Comum", 1:5)
premium <- paste("Premium", 1:5)
spremium <- paste("S Premium", 1:5)
tipos <- c(comum, premium, spremium)
tempos <- c("4:00", "4:15", "4:30")
pessoas <- c("Carol", "Gabriel", "Priscila")

dados <- do.call(
    rbind,
    lapply(pessoas, function(pessoa) {
        expand.grid(
            Tempo = tempos,
            Categoria = c("Comum", "Premium", "S Premium")
        ) |>
            transform(
                Pessoa = pessoa,
                Tipo = c(
                    sample(comum, 3),
                    sample(premium, 3),
                    sample(spremium, 3)
                )
            ) |>
            subset(select = c(Pessoa, Tempo, Tipo))
    })
)

dados

write.csv(x = dados, file = "casualizacao.csv")
