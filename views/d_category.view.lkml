view: d_category {
  sql_table_name: `Looker_Training.d_category`
    ;;

  dimension: category {
    label: "카테고리 코드 값"
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: category_name {
    label: "카테고리 이름"
    type: string
    sql: ${TABLE}.category_name ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [category_name]
  }
}
