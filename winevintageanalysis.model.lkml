connection: "wine_db"

# include all the views
include: "*.view"

# include all the dashboards


explore: winedb {

  view_label: "Vintages"
  description: "Wine analysis across Burgundy/Napa/Bordeaux"
  group_label: "Wine Analysis"

  }
