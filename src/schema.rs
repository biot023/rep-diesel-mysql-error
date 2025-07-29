diesel::table! {
    basket_items (id) {
        id -> Integer,
        basket_id -> Integer,
        item_id -> Integer,
        last_accepted_price -> Decimal,
        #[max_length = 255]
        quantity -> Varchar,
        note_to_seller -> Nullable<Text>,
        created_at -> Nullable<Datetime>,
        updated_at -> Nullable<Datetime>,
        discount_code_id -> Nullable<Integer>,
        checkout_orderset_id -> Nullable<Integer>,
        customisation_options -> Nullable<Text>,
        universal_discount_code_id -> Nullable<Integer>,
    }
}

diesel::allow_tables_to_appear_in_same_query!(
    basket_items,
);
