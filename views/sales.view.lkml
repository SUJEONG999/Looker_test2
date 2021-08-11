view: sales {
  sql_table_name: `Looker_Training.sales`
    ;;

  dimension: bottle_volume_ml {
    hidden: yes
    type: number
    sql: ${TABLE}.bottle_volume_ml ;;
  }

  dimension: bottles_sold {
    label: "판매 병 수"
    type: number
    sql: ${TABLE}.bottles_sold ;;
  }

  dimension: category {
    label: "카테고리 코드"
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: invoice_and_item_number {
    hidden: yes
    type: string
    sql: ${TABLE}.invoice_and_item_number ;;
  }

  dimension: item_number {
    label: "아이템 코드"
    type: string
    sql: ${TABLE}.item_number ;;
  }

  dimension_group: order {
    group_label: "주문 날짜"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.order_date ;;
  }

  dimension: pack {
    hidden: yes
    type: number
    sql: ${TABLE}.pack ;;
  }

  dimension: sale_dollars {
    label: "판매 금액"
    type: number
    sql: ${TABLE}.sale_dollars ;;
  }

  dimension: state_bottle_cost {
    hidden: yes
    type: number
    sql: ${TABLE}.state_bottle_cost ;;
  }

  dimension: state_bottle_retail {
    hidden: yes
    type: number
    sql: ${TABLE}.state_bottle_retail ;;
  }

  dimension: store_number {
    hidden: yes
    type: string
    sql: ${TABLE}.store_number ;;
  }

  dimension: vendor_number {
    hidden: yes
    type: string
    sql: ${TABLE}.vendor_number ;;
  }

  dimension: volume_sold_gallons {
    hidden: yes
    type: number
    sql: ${TABLE}.volume_sold_gallons ;;
  }

  dimension: volume_sold_liters {
    hidden: yes
    type: number
    sql: ${TABLE}.volume_sold_liters ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  #################

  measure: total_sale_dollars {
    label: "총 판매 금액"
    type: number
    sql: sum(${TABLE}.sale_dollars) ;;
  }

  measure: total_bottles_sold {
    label: "총 판매량"
    type: number
    sql: sum(${TABLE}.bottles_sold) ;;
  }

  measure: avg_sale_dollars {
    label: "평균 판매 금액"
    type: number
    sql: sum(${TABLE}.sale_dollars) / sum(${TABLE}.bottles_sold);;
  }

  measure: total_state_bottle_cost {
    type: number
    sql: sum(${TABLE}.state_bottle_cost) ;;
  }

  measure: total_state_bottle_retail {
    type: number
    sql: sum(${TABLE}.state_bottle_retail) ;;
  }

  # measure: profit {
  #   label: "이익"
  #   type: number
  #   sql: (sum(${TABLE}.state_bottle_retail) – sum(${TABLE}.state_bottle_cost)) * sum(${TABLE}.bottles_sold);;
  # }
  ##################### depth #######################################################

  parameter: p_depth {
    label: "DEPTH"
    type: string
    allowed_value: {label: "category_name" value: "category_name" }
    allowed_value: {label: "item_description" value: "item_description" }
    group_label: "필터용"
  }

  dimension: depth {
    group_label: "Choose depth"
    link: {
      label : "url-test"
      url:"https://megazonepartner.cloud.looker.com/looks/121"
    }
    type: string
    sql:
    {% if p_depth._parameter_value == "'category_name'"%}
      ${d_category_1.category_name}
    {% elsif p_depth._parameter_value == "'item_description'"%}
      ${d_item_1.item_description}
    {%endif%}
    ;;
  }


}
