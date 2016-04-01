library(httr)

oauth_endpoints("github")
test_app <- oauth_app("github",
                      key = "37b74a90140eaedafd6a",
                      secret = "2a9139a744d4731873811d87a802c7c41d7af2ac")

github_token <- oauth2.0_token(oauth_endpoints("github"), test_app)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos",gtoken)
stop_for_status(req)
# content(req)


json <- fromJSON(toJSON(content(req)))
json[json$name=='datasharing',]$created_at