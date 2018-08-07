connection: "wine_db"

# include all the views
include: "*.view"

# include all the dashboards


explore: winedb {
  persist_for: "24 hours"

  view_label: "Vintages"
  description: "Wine analysis across Burgundy/Napa/Bordeaux"
  group_label: "Wine Analysis"
  sql_always_where: ${grape} is not null ;;

  }
