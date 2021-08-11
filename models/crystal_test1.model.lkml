connection: "looker-training"

# include all the views
include: "/views/**/*.view"

datagroup: crystal_test1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: crystal_test1_default_datagroup

explore: d_category {}

explore: d_item {}

explore: sales {
  join: d_item_1 {
    from: d_item
    relationship: many_to_one
    sql_on: ${d_item_1.item_number} = ${sales.item_number};;
  }

  join: d_category_1 {
    from: d_category
    relationship: many_to_one
    sql_on: ${d_category_1.category} = ${sales.category};;
  }
}

explore: sales_exp {
  join: d_item_1 {
    from: d_item
    relationship: many_to_one
    sql_on: ${d_item_1.item_number} = ${sales_exp.item_number};;
  }

  join: d_category_1 {
    from: d_category
    relationship: many_to_one
    sql_on: ${d_category_1.category} = ${sales_exp.category};;
  }
  }
