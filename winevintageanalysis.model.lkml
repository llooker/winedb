connection: "winedb"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: winedb {
  sql_always_where: ${region} is not null ;;
}
