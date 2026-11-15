# GDELT Project - R/RStudio visualization code
# Source: GDELT.docx
# Main package used: ggplot2

# RStudio environment
R.version.string
getwd()

# Creating directories
dir.create("results", showWarnings = FALSE)
dir.create("plots", showWarnings = FALSE)

# Graph 1 - Events by Year
events_by_year <- data.frame(
  Year = c(2016, 2025, 2026),
  Event_Count = c(89, 3722, 702832)
)
write.csv(events_by_year, "results/events_by_year.csv", row.names = FALSE)

library(ggplot2)

p1 <- ggplot(events_by_year, aes(x = factor(Year), y = Event_Count)) +
  geom_col() +
  labs(
    title = "GDELT Events by Year",
    x = "Year",
    y = "Number of Events"
  ) +
  theme_minimal()

p1

# Graph 2 - Event Category Distribution
event_categories <- read.csv(
  "D:/gdelt_project/results/event_categories.csv"
)
event_categories

category_map <- data.frame(
  eventrootcode = sprintf("%02d", 1:20),
  Category = c(
    "Make Public Statement",
    "Appeal",
    "Express Intent to Cooperate",
    "Consult",
    "Engage in Diplomatic Cooperation",
    "Engage in Material Cooperation",
    "Provide Aid",
    "Yield",
    "Investigate",
    "Demand",
    "Disapprove",
    "Reject",
    "Threaten",
    "Protest",
    "Exhibit Force Posture",
    "Reduce Relations",
    "Coerce",
    "Assault",
    "Fight",
    "Use Unconventional Mass Violence"
  )
)

event_categories <- merge(
  event_categories[event_categories$eventrootcode != "--", ],
  category_map,
  by = "eventrootcode"
)
event_categories

p2 <- ggplot(
  event_categories,
  aes(
    x = reorder(Category, event_count),
    y = event_count
  )
) +
  geom_col() +
  coord_flip() +
  labs(
    title = "GDELT Event Category Distribution",
    x = "Event Category",
    y = "Number of Events"
  ) +
  theme_minimal()

p2

# Graph 3 - Cooperation vs Conflict (QuadClass)
quadclass <- read.csv(
  "D:/gdelt_project/results/quadclass.csv"
)
quadclass

p3 <- ggplot(
  quadclass,
  aes(x = Category, y = event_count)
) +
  geom_col() +
  labs(
    title = "GDELT Events: Cooperation vs Conflict",
    x = "Event Type",
    y = "Number of Events"
  ) +
  theme_minimal()

p3

# Graph 4 - Goldstein Scale Analysis
goldstein <- read.csv(
  "D:/gdelt_project/results/goldstein_distribution.csv"
)
goldstein

p4 <- ggplot(
  goldstein,
  aes(x = goldstein_scale, y = event_count)
) +
  geom_col() +
  labs(
    title = "Distribution of Goldstein Scale",
    x = "Goldstein Scale",
    y = "Number of Events"
  ) +
  theme_minimal()

p4

# Graph 5 - Top 15 Countries by Number of Events
top_countries <- read.csv(
  "D:/gdelt_project/results/top_countries.csv"
)
top_countries

country_map <- data.frame(
  country_code = c(
    "US", "UK", "IN", "NI", "IS",
    "IR", "CH", "CA", "RS", "AS",
    "UP", "FR", "PK", "SF", "EI"
  ),
  country = c(
    "United States",
    "United Kingdom",
    "India",
    "Nigeria",
    "Israel",
    "Iran",
    "China",
    "Canada",
    "Russia",
    "Australia",
    "Ukraine",
    "France",
    "Pakistan",
    "South Africa",
    "Ireland"
  )
)

top_countries <- merge(
  top_countries,
  country_map,
  by = "country_code"
)

top_countries

p5 <- ggplot(
  top_countries,
  aes(
    x = reorder(country, event_count),
    y = event_count
  )
) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Top 15 Countries by Number of GDELT Events",
    x = "Country",
    y = "Number of Events"
  ) +
  theme_minimal()

p5

# Graph 6 - Top 15 Actors
top_actors <- read.csv(
  "D:/gdelt_project/results/top_actors.csv"
)
top_actors

p6 <- ggplot(
  top_actors,
  aes(
    x = reorder(actor, event_count),
    y = event_count
  )
) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Top 15 Actors in GDELT Events",
    x = "Actor",
    y = "Number of Events"
  ) +
  theme_minimal()

p6

# Graph 7 - Geographic Distribution
top_locations <- read.csv(
  "D:/gdelt_project/results/top_locations.csv"
)
top_locations

p7 <- ggplot(
  top_locations,
  aes(
    x = reorder(location, event_count),
    y = event_count
  )
) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Top 15 Geographic Locations of GDELT Events",
    x = "Location",
    y = "Number of Events"
  ) +
  theme_minimal()

p7

# Graph 8 - Media Attention / Event Intensity
media_attention <- data.frame(
  Metric = c(
    "Average Mentions",
    "Average Sources",
    "Average Articles"
  ),
  Value = c(
    11.99,
    2.43,
    11.63
  )
)

media_attention

p8 <- ggplot(
  media_attention,
  aes(
    x = Metric,
    y = Value
  )
) +
  geom_col() +
  labs(
    title = "Average Media Attention per GDELT Event",
    x = "Media Attention Metric",
    y = "Average Value"
  ) +
  theme_minimal()

p8
