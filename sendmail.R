library(mailR)
send.mail(from = "theofpa@gmail.com",
          to = c("theofilos@gmail.com", "theofpa@gmail.com"),
          subject = "Graph report",
          body = "<html><img src=\"unnamed-chunk-3.png\"><br/><img src=\"unnamed-chunk-4.png\"></html>",
          html = TRUE,
          inline=TRUE,
          smtp = list(host.name = "smtp.gmail.com", port = 465, user.name = "theofpa", passwd = "*", ssl = TRUE),
          attach.files = c("unnamed-chunk-3.png", "unnamed-chunk-4.png"),
          authenticate = TRUE,
          send = TRUE)