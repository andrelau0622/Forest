# 加载必要的库
library(ggplot2)
library(dplyr)

# 创建数据集
dataset <- data.frame(
  Varnames = c("ART","WBC","CPR","DTA","EPC","FFT","GEO","HBC","PTT","JOK"),
  OR = c(0.9, 2, 0.3, 0.4, 0.5, 1.3, 2.5, 1.6, 1.9, 1.1),
  Lower = c(0.75, 1.79, 0.18, 0.2, 0.38, 1.15, 2.41, 1.41, 1.66, 0.97),
  Upper = c(1.05, 2.21, 0.42, 0.6, 0.62, 1.45, 2.59, 1.79, 2.14, 1.23),
  Factor = c('Not sig.', 'Risk', 'Protective', 'Protective', 'Protective', 
             'Risk', 'Risk', 'Risk', 'Risk', 'Not sig.'),
  Sample = c(450, 420, 390, 400, 470, 390, 400, 388, 480, 460)
)

# 绘图
p <- ggplot(dataset, aes(x = Varnames, y = OR, color = Factor)) +
  geom_point(size = 3) +
  geom_errorbar(aes(ymin = Lower, ymax = Upper), width = 0.2) +
  geom_hline(yintercept = 1, linetype = "dashed", color = "black") +
  scale_color_manual(values = c("Not sig." = "#F1B656", "Risk" = "#397FC7", "Protective" = "#040676")) +
  labs(title = "Forest Plot",
       x = "Variable Names",
       y = "Odds Ratio (OR)") +
  theme_bw() +
  theme(legend.title = element_blank())

# 显示
print(p)
