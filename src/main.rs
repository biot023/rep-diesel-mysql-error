use log;
use env_logger;
use diesel::{prelude::*, MysqlConnection, r2d2::ConnectionManager};
use std::time::Duration;
use std::env;
use rep_diesel_mysql_error::{
    schema::basket_items::dsl,
    models::BasketItem,
};

fn main() {
    env_logger::init();

    let conn_str = env::var("CONN_STR")
        .unwrap_or_else(|_| "mysql://root:supersecret@127.0.0.1:3306/test_db".to_string());

    log::debug!("Connecting with: {:?}...", &conn_str);
    let manager = ConnectionManager::<MysqlConnection>::new(&conn_str);
    log::debug!("Connected to DB with connection string {:?}...", &conn_str);

    let pool = r2d2::Pool::builder()
        .connection_timeout(Duration::from_secs(20))
        .build(manager)
        .expect("Failed to create connection pool");
    log::debug!("Created DB connection pool...");

    let mut conn = pool.get().expect("Failed to get connection");
    log::debug!("Got connection");

    let basket_items: Vec<BasketItem> = dsl::basket_items
        .load(&mut conn)
        .expect("Should have been able to get basket items");
    println!("Got basket items: {:?}", basket_items);

    println!("Done.");
}
