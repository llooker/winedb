view: winedb {
  sql_table_name: public.winedb ;;

  dimension: grape {
    type: string
    sql: ${TABLE}.grape ;;
  }

  dimension: priceaverage {
    type: number
    sql: ${TABLE}."price-average" ;;
  }

  dimension: pricemax {
    type: number
    sql: ${TABLE}."price-max" ;;
  }

  dimension: pricemin {
    type: number
    sql: ${TABLE}."price-min" ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: vintage {
    type: number
    sql: ${TABLE}.vintage ;;
  }

  dimension: wine_region {
    type: string
    sql: ${TABLE}.wine_region ;;
  }

  dimension: winename {
    type: string
    sql: ${TABLE}."wine-name" ;;
  }

  measure: count {
    type: count
    drill_fields: [winename]
  }
}
