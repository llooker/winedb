connection: "winedb"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: winedb {
  persist_for: "24 hours"
  sql_always_where: ${region} is not null ;;


}
