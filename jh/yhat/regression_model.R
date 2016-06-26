df <- read.csv("~/Downloads/nfl_games.csv")

fit <- glm(score_diff ~ away_win_perc + home_win_perc, data=df)
summary(fit)

library(yhatr)

model.require <- function() {
  # we have no dependencies
}

model.transform  <- function(df) {
  df
}

model.predict <- function(df) {
  df$pred_score_diff <- predict(fit, newdata=df, type="response")
  df
}

yhat.config  <- c(
  username="theofilos@ieee.org",
  apikey="08b39c10ea501123a5f04f2b892a880",
  env="http://cloud.yhathq.com/"
)

yhat.deploy ("nflPredictor")


#fit <- glm(score_diff ~ away_win_perc * home_win_perc, data=df)
#summary(fit)

#yhat.deploy ("nflPredictor")