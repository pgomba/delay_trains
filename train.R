library(tidyverse)
library(scales)

train <- read.csv("train.csv")

train$Period <- ordered(train$Period, levels = c("Period 8 (16/10/2022 - 12/11/2022)",
                                                 "Period 9 (13/11/2022 - 10/12/2022)",
                                                 "Period 10 (11/12/2022 - 07/01/2023)",
                                                 "Period 11 (08/01/2023 - 04/02/2023)",
                                                 "Period 12 (05/02/2023 - 04/03/2023)",
                                                 "Period 13 (05/03/2023 - 31/03/2023)",
                                                 "Period 1 (01/04/2023 - 29/04/2023)",
                                                 "Period 2 (30/04/2023 - 27/05/2023)",
                                                 "Period 3 (28/05/2023 - 24/06/2023)",
                                                 "Period 4 (25/06/2023 - 22/07/2023)",
                                                 "Period 5 (23/07/2023 - 19/08/2023)",
                                                 "Period 6 (20/08/2023 - 16/09/2023)",
                                                 "Period 7 (17/09/2023 - 14/10/2023)"))


ggplot(train, aes(x=Period,`Volume of delay compensation claims received`,fill=Company))+
  geom_col(position = position_dodge())+
  scale_fill_manual(values = c("#dc0a1e","#80c242","#e9418b"))+
  scale_x_discrete(labels=scales::label_wrap(15))+
  theme_minimal()+
  labs(x="",y="Claims",subtitle="Volume of delay compensation claims received")

ggsave("claims.png",dpi="retina")

ggplot(train, aes(x=Period,`Value of total delay compensation paid`,fill=Company))+
  geom_col(position = position_dodge())+
  scale_fill_manual(values = c("#dc0a1e","#80c242","#e9418b"))+
  scale_y_continuous(labels = unit_format(unit = "k", scale = 1e-3))+
  scale_x_discrete(labels=scales::label_wrap(15))+
  theme_minimal()+
  labs(x="",y="£",subtitle="Value of total delay compensation paid")

ggsave("money.png",dpi="retina")



sum(train$`Volume of delay compensation claims approved`)
sum(train$`Value of total delay compensation paid`)

