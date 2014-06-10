plot(jitter(child,4) ~ parent, galton)
regrline <- lm(child ~ parent, galton)
abline(regrline, lwd=3, col='red')