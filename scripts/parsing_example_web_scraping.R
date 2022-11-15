library(rvest)
library(purrr)
library(xml2)
library(stringr)
library(dplyr)

#url <- "https://www.metacritic.com/browse/games/score/metascore/all/all/filtered"
games <- data.frame()
for(page_result in seq(from = 0, to = 4, by = 1)) {
  link <- paste0("https://www.metacritic.com/browse/games/score/metascore/all/all/filtered?page=", page_result)
  page <- read_html(link)
  title <- page %>%
    html_nodes(".title h3") %>%
    html_text()
  
  year <- page %>%
    html_nodes(".platform+ span") %>%
    html_text()
  
  metascore <- page %>%
    html_nodes(".clamp-score-wrap .positive")%>%
    html_text()
  
  userscore <- page %>%
    html_nodes(".user")%>%
    html_text()
  
  
  description <- page %>%
    html_nodes(".summary") %>%
    html_text()
  
  games <- rbind(games, data.frame(title, year, metascore, userscore, description))
  
  print(paste("Page:", page_result))
  
}

##############################

games$metascore <- as.numeric(games$metascore)
games$userscore <- as.numeric(games$userscore)



games$year <- gsub("[A-z]"," ",games$year)
games$year <- gsub('\\s+', "", games$year)

games$year <- substring(games$year, 10) #delete characters (10) from left
games$year <- str_trim(games$year, side = "both")
games$description <- trimws(games$description) #убираем пробелы по краям

##############################

games[, year:= as.integer(unlist(regmatches(year, gregexpr("\\d{4}", year))))]
View(games)
df[text == "", .N, by = year]
games[, .(percent = round(.SD[text == "", .N]/.N*100,2)), by = year]

##############################
page <- read_html(url)

View(page)

title <- page %>%
  html_nodes(".title h3") %>%
  html_text()

year <- page %>%
  html_nodes(".platform+ span") %>%
  html_text()

metascore <- page %>%
  html_nodes(".clamp-score-wrap .positive")%>%
  html_text()

userscore <- page %>%
  html_nodes(".user")%>%
  html_text()


description <- page %>%
  html_nodes(".summary") %>%
  html_text()

games <- as.data.frame(cbind(title, year, metascore, userscore, description))
write.csv(games, "games.csv")
#OR
saveRDS(games, "games.RData")

game_links <- page %>%
  html_nodes(".title h3") %>%
  html_attr(".title h3") %>%
  paste("https://www.metacritic.com", ., sep = "")
game_links
#WOW! mistake... what can we do??
#let's inspect

game_links <- page %>%
  html_nodes("a.title") %>%
  html_attr("href") %>%
  paste("https://www.metacritic.com", ., sep = "")
game_links

games = data.frame()

url_base <- "https://www.metacritic.com/browse/games/score/metascore/all/all/filtered?page=%d"


############# TABLES ###################

tab_page <- "https://ru.wikipedia.org/wiki/%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA_%D1%81%D1%82%D1%80%D0%B0%D0%BD_%D0%BF%D0%BE_%D0%BF%D0%BE%D0%BA%D0%B0%D0%B7%D0%B0%D1%82%D0%B5%D0%BB%D1%8F%D0%BC_%D0%BD%D0%B5%D1%80%D0%B0%D0%B2%D0%B5%D0%BD%D1%81%D1%82%D0%B2%D0%B0_%D0%B4%D0%BE%D1%85%D0%BE%D0%B4%D0%BE%D0%B2"
tab_link <- read_html(tab_page)

apple_table = tab_link %>% html_nodes("table") %>% .[2] %>% 
  html_table(fill = TRUE) %>% .[[1]]
