connection: "webinar_looker"

# include all the views
include: "/views/**/*.view"

datagroup: dataviz_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: dataviz_default_datagroup

explore: categories {}

explore: products {}

explore: orders {
  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
}

explore: items {
  join: products {
    type: left_outer
    sql_on: ${items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
}

explore: customers {}
