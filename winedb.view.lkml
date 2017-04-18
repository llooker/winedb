view: winedb {
  sql_table_name: public.winedb ;;

  dimension: grape {
    type: string
    sql: ${TABLE}.grape ;;
  }

  dimension: priceaverage {
    hidden: yes
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
    type: string
    sql: ${TABLE}.vintage ;;
    full_suggestions: yes
  }

  dimension: wine_region {
    type: string
    sql: initcap(${TABLE}.wine_region) ;;
  }

  dimension: winename {
    type: string
    sql: ${TABLE}."wine-name" ;;
    full_suggestions: yes
    link: {
      label: "Wine Searcher"
      url: "http://www.wine-searcher.com/find/{{value}}"
      icon_url: "https://lh3.ggpht.com/dBp9byeKspKdm_9BWmjSZPXxFFVv9FfvZNlZYEQxP8ro_rhtUhO741AiHUuDqbKuMVNp=w300"

    }
  }
  ##Filters##
#   filter: red_filter {
#     label: "Only Red"
#     type: yesno
#     sql: ${grape} in ('Bordeaux Blend Red','Cabernet Sauvignon','Cabernet Sauvignon - Merlot','Merlot','Pinot Noir')
#
#          ;;
#   }
  dimension: is_red {
    type: yesno
    sql: ${grape} in ('Bordeaux Blend Red','Cabernet Sauvignon','Cabernet Sauvignon - Merlot','Merlot','Pinot Noir') ;;
  }

  measure: count {
    type: count
    drill_fields: [wine_details*]
  }
  measure: Total_Price {
    type: sum
    value_format_name: usd
    sql: ${priceaverage} ;;

    drill_fields: [wine_details*]
  }
  measure: average_Price {
    type: average
    sql: ${priceaverage} ;;
    value_format_name: usd
    drill_fields: [wine_details*]
  }
  measure: average_Price_Max {
    type: average
    sql: ${pricemax} ;;
    value_format_name: usd
    drill_fields: [wine_details*]
  }
  measure: average_Price_Min {
    type: average
    sql: ${pricemin} ;;
    value_format_name: usd
    drill_fields: [wine_details*]
  }
  set: wine_details {
    fields: [winename,wine_region,vintage,pricemin,priceaverage,pricemax,grape]
  }
}
