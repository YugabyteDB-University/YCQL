drop table if exists tbl_wishlists_by_user;
drop table if exists tbl_products_by_wishlist;
drop table if exists tbl_products_by_category;
drop table if exists tbl_products_by_brand;

-- search wishlists by user create table tbl_wishlists_by_user (
create table ks_ybu.tbl_wishlists_by_user (
  user_id text,
  wishlist_name text,
  wishlist_id uuid,
  is_public boolean,
  primary key ((user_id), wishlist_name)
) with transactions = { 'enabled': true }
and clustering
order by (name desc);



-- search for products in a wishlist 
create table ks_ybu.tbl_products_by_wishlist (
  wishlist_id uuid,
  product_id int,
  product_name text,
  wishlist_name text,
  quantity int,
  price decimal,
  description text,
  primary key ((wishlist_id), product_id, product_name)
) with clustering
order by (pproduct_id asc, product_name asc)
  and transactions = { 'enabled': true };


-- let assume just 1 price per product. product id is surogate key
-- search products by category 
create table ks_ybu.tbl_products_by_category (
  category text,
  product_name text,
  product_id int,
  brand text,
  price decimal,
  discount int,
  description text,
  gtin text,
  sku_details jsonb,
  primary key ( category, product_name, product_id)
) with clustering
order by (product_name asc, product_id asc)
  and transactions = { 'enabled': true };


-- search products by name
create table ks_ybu.tbl_products_by_brand (
  brand text,
  product_name text,
  product_id int,
  category text,
  price decimal,
  discount int,
  description text,
  gtin text,
  sku_details jsonb,
  primary key ( brand, product_name, product_id)
) with clustering
order by ( product_name asc, product_id asc)
  and transactions = { 'enabled': true };




