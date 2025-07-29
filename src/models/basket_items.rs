use bigdecimal::BigDecimal;
use chrono::prelude::*;
use serde::{Serialize, Deserialize};
use diesel::Queryable;

#[derive(Clone, Debug, PartialEq, Queryable, Serialize, Deserialize)]
pub struct BasketItem {
    pub id: i32,
    pub basket_id: i32,
    pub item_id: i32,
    pub last_accepted_price: BigDecimal,
    pub quantity: String,
    pub note_to_seller: Option<String>,
    pub created_at: Option<NaiveDateTime>,
    pub updated_at: Option<NaiveDateTime>,
    pub discount_code_id: Option<i32>,
    pub checkout_orderset_id: Option<i32>,
    pub customisation_options: Option<String>,
    pub universal_discount_code_id: Option<i32>,
}
