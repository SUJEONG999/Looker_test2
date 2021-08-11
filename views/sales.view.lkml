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
}
