// Import data

 import delimited "~/WC2018/WC2018_PLAYER_INFO.csv", clear

// Some basic prep for counts

sort player_club_country
by player_club_country: gen cc_total = _N
sort player_club
by player_club: gen club_total = _N

// Graph totals by country

graph hbar cc_total if cc_total > 3, over(player_club_country, sort(cc_total) desc label(labsize(vsmall))) ///
ylabel(0(25)150) ymtick(0(5)150) ///
title("Where National Team Players Play in Leagues", size(medsmall)) ///
subtitle("Players From the 2018 FIFA World Cup", size(small)) ///
ytitle("Total Number of Players") ///
note("* Only countries with more than 3 players" "  in domestic leagues are displayed", size(vsmall)) ///
scheme(s1mono)
graph export "/home/craig/local/WC2018/top_contributing_country_leagues_WC2018.png", replace

// Graph totals by club team

graph hbar club_total if club_total >= 6, over(player_club,  sort(club_total) desc label(labsize(vsmall))) ///
ylabel(0(5)20) ymtick(0(1)20) ///
title("Top 25 Club Teams Contributing Players to National Teams", size(medsmall)) ///
subtitle("Players From the 2018 FIFA World Cup", size(small)) ///
ytitle("Total Number of Players") ///
note("", size(vsmall)) ///
scheme(s1mono)
graph export "/home/craig/local/WC2018/top_contributing_clubs_WC2018.png", replace