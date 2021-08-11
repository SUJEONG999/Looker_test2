view: d_item {
  sql_table_name: `Looker_Training.d_item`
    ;;

  dimension: item_description {
    label: "아이템 설명"
    type: string
    sql: ${TABLE}.item_description ;;
  }

  dimension: item_number {
    label: "아이템 코드 값"
    type: string
    sql: ${TABLE}.item_number ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
