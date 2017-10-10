view: winedb {
  sql_table_name: public.winedb ;;

  dimension: grape {
    type: string
    sql: ${TABLE}.grape ;;
  }
  dimension: grape_html {
    type: string
    sql: ${grape} ;;
    html:
    <div >
    <table style="width:100%;border-left:none;border:none;font-size:16px;" >
    <tr style="border-left:none;padding-left:0px;">
    <td style="font-weight:800;padding-top:15px;color:#76678b;border:none;padding-left:0px;">Grape</td>
    <td style="font-weight:500;padding-top:15px;color:#76678b;border:none;">{{ grape._value}}</td>
    <td style="font-weight:800;padding-top:15px;color:#76678b;border:none;padding-left:0px;">Price</td>
    <td style="font-weight:500;padding-top:15px;color:#76678b;border:none;">{{ Total_Price._value}}</td>
    </tr>
    <tr>
    <td style="font-weight:800;padding-top:15px;color:#76678b;border:none;padding-left:0px;">Retail Price</td>
    <td style="font-weight:500;padding-top:15px;color:#76678b;border:none;">{{ priceaverage_tiers._value}}</td>
    </tr>
    </table>
    </div>;;
  }

  dimension: priceaverage {
    hidden: yes
    type: number
    sql: ${TABLE}."price-average" ;;
    value_format_name: usd_0
  }
  dimension: priceaverage_tiers {
    label: "Price Average Tiers"
    tiers: [100,500,1000]
    type: tier
    style: integer
    sql: ${TABLE}."price-average" ;;
  }

  dimension: pricemax {
    type: number
    sql: ${TABLE}."price-max" ;;
    value_format_name: usd_0
  }

  dimension: pricemin {
    type: number
    sql: ${TABLE}."price-min" ;;
    value_format_name: usd_0
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
    description: "Napa in California, Bordeaux in France, Burgundy in France"
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
    value_format_name: usd_0
    sql: ${priceaverage} ;;

    drill_fields: [wine_details*]
  }
  measure: average_Price {
    type: average
    sql: ${priceaverage} ;;
    value_format_name: usd_0
    drill_fields: [wine_details*]
  }
  measure: average_Price_Max {
    type: average
    sql: ${pricemax} ;;
    value_format_name: usd_0
    drill_fields: [wine_details*]
  }
  measure: average_Price_Min {
    type: average
    sql: ${pricemin} ;;
    value_format_name: usd_0
    drill_fields: [wine_details*]
  }
  set: wine_details {
    fields: [winename,wine_region,vintage,pricemin,priceaverage,pricemax,grape]
  }
}
