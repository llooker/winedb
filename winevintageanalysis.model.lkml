connection: "wine_db"

# include all the views
include: "*.view"

# include all the dashboards


datagroup: caching_5hours{
 sql_trigger: SELECT CURRENT_DATE ;;
  max_cache_age: "5 hours"
}

explore: winedb {
  persist_for: "24 hours"
#   access_filter: {
#     field: wine_region
#     user_attribute: wine_region
#   }

  view_label: "Vintages"
  description: "Wine analysis across Burgundy/Napa/Bordeaux"
  group_label: "Wine Analysis"
  sql_always_where: ${grape} is not null ;;

  }
