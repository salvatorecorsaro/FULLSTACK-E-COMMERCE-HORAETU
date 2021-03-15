DROP SCHEMA IF EXISTS horae_catalogue;
CREATE SCHEMA horae_catalogue;
USE horae_catalogue;

DROP SCHEMA IF EXISTS horae_shop;
CREATE SCHEMA horae_shop;
USE horae_shop;

    DROP SCHEMA IF EXISTS horae_geo;
    CREATE SCHEMA horae_geo;
    USE horae_geo;



CREATE TABLE country
(
    id   int NOT NULL,
    code varchar(2)   DEFAULT NULL,
    name varchar(255) DEFAULT NULL,
    PRIMARY KEY (id)
);

INSERT INTO country
VALUES (1, 'ES', 'España'),
       (2, 'IT', 'Italia');

CREATE TABLE region
(
    id         int NOT NULL AUTO_INCREMENT,
    name       varchar(255) DEFAULT NULL,
    country_id int NOT NULL,
    PRIMARY KEY (id),
    KEY fk_country (country_id),
    CONSTRAINT fk_country FOREIGN KEY (country_id) REFERENCES country (id)
);

INSERT INTO region
VALUES (1, 'Andalusia', 1),
       (2, 'Catalonia', 1),
       (3, 'Community of Madrid', 1),
       (4, 'Valencian Community', 1),
       (5, 'Galicia', 1),
       (6, 'Castile and León', 1),
       (7, 'Basque Country', 1),
       (8, 'Castilla-La Mancha', 1),
       (9, 'Canary Islands', 1),
       (10, 'Region of Murcia', 1),
       (11, 'Aragon', 1),
       (12, 'Extremadura', 1),
       (13, 'Balearic Islands', 1),
       (14, 'Principality of Asturias', 1),
       (15, 'Chartered Community of Navarre', 1),
       (16, 'Cantabria', 1),
       (17, 'Sicily', 2),
       (18, 'Sardinia', 2);


CREATE TABLE address
(
    id       bigint NOT NULL AUTO_INCREMENT,
    city     varchar(255) DEFAULT NULL,
    country  varchar(255) DEFAULT NULL,
    region   varchar(255) DEFAULT NULL,
    street   varchar(255) DEFAULT NULL,
    zip_code varchar(255) DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE customer
(
    id         bigint NOT NULL AUTO_INCREMENT,
    first_name varchar(255) DEFAULT NULL,
    last_name  varchar(255) DEFAULT NULL,
    email      varchar(255) DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE orders
(
    id                    bigint NOT NULL AUTO_INCREMENT,
    order_tracking_number varchar(255)   DEFAULT NULL,
    total_price           decimal(19, 2) DEFAULT NULL,
    total_quantity        int            DEFAULT NULL,
    billing_address_id    bigint         DEFAULT NULL,
    customer_id           bigint         DEFAULT NULL,
    shipping_address_id   bigint         DEFAULT NULL,
    status                varchar(128)   DEFAULT NULL,
    date_created          datetime(6)    DEFAULT NULL,
    last_updated          datetime(6)    DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer (id),
    FOREIGN KEY (billing_address_id) REFERENCES address (id),
    FOREIGN KEY (shipping_address_id) REFERENCES address (id)
);
CREATE TABLE order_item
(
    id         bigint NOT NULL AUTO_INCREMENT,
    image_url  varchar(255)   DEFAULT NULL,
    quantity   int            DEFAULT NULL,
    unit_price decimal(19, 2) DEFAULT NULL,
    order_id   bigint         DEFAULT NULL,
    product_id bigint         DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES orders (id)
);

CREATE TABLE product
(
    id             BIGINT(20) NOT NULL AUTO_INCREMENT,
    sku            VARCHAR(255)   DEFAULT NULL,
    name           VARCHAR(255)   DEFAULT NULL,
    description    VARCHAR(1024)  DEFAULT NULL,
    unit_price     DECIMAL(13, 2) DEFAULT NULL,
    image_url      VARCHAR(255)   DEFAULT NULL,
    active         BIT            DEFAULT 1,
    units_in_stock INT(11)        DEFAULT NULL,
    date_created   DATETIME(6)    DEFAULT NULL,
    last_updated   DATETIME(6)    DEFAULT NULL,
    category_id    BIGINT(20) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES product_category (id)
);

CREATE TABLE IF NOT EXISTS product_category (
  id BIGINT(20) NOT NULL AUTO_INCREMENT,
  category_name VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (id));

INSERT INTO product_category()
VALUES (default, 'Health');
INSERT INTO product_category()
VALUES (default, 'Nutrition');
INSERT INTO product_category()
VALUES (default, 'Home');
INSERT INTO product_category()
VALUES (default, 'Beauty');

INSERT INTO product (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                     UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('h01', 'Apple Scented Candle',
        'Fruity scent of crisp apples and sweet cinnamon.The candle has the same beautiful colour during its entire burn time, because it is coloured through. The candle is paraffin wax, our premium plant based wax.Approx. burn time up to 35 hours.Never leave a burning candle unattended.',
        'assets/images/products/Candle_Apple.jpg'
           , 1, 100, 2.99, 3, NOW());

INSERT INTO product (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                     UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('h02', 'Orange and Chocolate Scented Candle',
        'A sweet, tasty fragrance blending accords of Cacao with juicy citrus top notes of Clementine, Blood Orange and Satsumae. The candle has the same beautiful colour during its entire burn time, because it is coloured through. The candle is paraffin wax, our premium plant based wax. Approx. burn time up to 35 hours. Never leave a burning candle unattended.  ',
        'assets/images/products/Candle_Orange.jpg'
           , 1, 100, 2.99, 3, NOW());

INSERT INTO product (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                     UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('h03', 'Special Edition Pine Cone Scented Candle',
        'A fresh, natural, vivifying scent of fresh pine cones, recognized for their air purifying properties. The candle is soy wax, our special edition deluxe plant based wax. Approx. burn time up to 35 hours.Never leave a burning candle unattended. ',
        'assets/images/products/Candle_PineCone.jpg'
           , 1, 100, 3.99, 3, NOW());

INSERT INTO product (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                     UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('h04', 'Candle_Sandalwood',
        'Rich woody base notes blended of Sandalwood. The candle is topped off with amber and herb scents on top. The candle is paraffin wax, our premium plant based wax.Approx. burn time up to 35 hours.Never leave a burning candle unattended.  ',
        'assets/images/products/Candle_Sandalwood.jpg'
           , 1, 100, 2.99, 3, NOW());

INSERT INTO product (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                     UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('h05', 'Special Edition Sea Salt Scented Candle',
        'When refreshing Eucalyptus and Peppermint muddled with rustic Cedarwood and Fir Balsam, this gratifying aroma is promised to offer full sensory experiences like strolling along the breezy coast. The candle is soy wax, our special edition deluxe plant based wax. Approx. burn time up to 35 hours.Never leave a burning candle unattended. ',
        'assets/images/products/Candle_SeaSalt.jpg'
           , 1, 100, 3.99, 3, NOW());

INSERT INTO product (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('h06', 'Special Edition Tahitian Vanilla Scented Candle',
        'Tahitian Vanilla has provides a sweet scent reminding you of vanilla ice cream and freshly baked waffles.
The candle is soy wax, our special edition deluxe plant based wax. Approx. burn time up to 35 hours.Never leave a burning candle unattended. ',
        'assets/images/products/Candle_Vanilla.jpg'
           , 1, 100, 3.99, 3, NOW());

INSERT INTO product (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('h08', 'Special Edition Candle Horaetu Scent',
        'Tahitian Vanilla has provides a sweet scent reminding you of vanilla ice cream and freshly baked waffles.
The candle is soy wax, our special edition deluxe plant based wax. Approx. burn time up to 35 hours.Never leave a burning candle unattended. ',
        'assets/images/products/Candle_SpecialEdition_HoraetuScent.jpg'
           , 1, 100, 3.99, 3, NOW());

INSERT INTO product (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('n01', 'Jasmine Tea',
        'This bottled tea is subtle and sweet, with hints of brown sugar and the unmistakable scent and flavour of jasmine. When you need to unwind, this is the tea for you.
A pick-me-up tea that’s great any time of day, the young green tea leaves in our jasmine green tea are flavoured with fresh jasmine blossoms for a beautiful taste.',
        'assets/images/products/Bottle_Jasmine.jpg'
           , 1, 100, 3.49, 2, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('n02', 'Organic Kombucha',
        'Our award winning Original kombucha is clean, zesty and crisp - it''s made with Chun-Mee Green Tea, Pure Spring Water, Raw Cane Sugar, and Kombucha Cultures. It''s a natural refreshment with vitality! We never use anything artificial, we don’t like our drinks to contain any nasties! So our kombucha is not only organic, but it''s also vegan and gluten free! We love our original kombucha best cold, but you can enjoy it in a mocktail! At Equinox we are dedicated to brewing the best organic artisan Kombucha you’ve ever tasted.',
        'assets/images/products/Bottle_Kombucha.jpg'
           , 1, 100, 5.49, 2, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('n03', 'Fresh Matcha',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/Bottle_Matcha.jpg'
           , 1, 100, 3.99, 2, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('n04', 'Rose Petal Water',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/Bottle_RoseWater.jpg'
           , 1, 100, 3.69, 2, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('n05', 'Protein Bar Blueberries and Jam',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/Bar_BlueBerries.jpg'
           , 1, 100, 3.39, 2, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('n06', 'Protein Bar Salted Caramel',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/Bar_Caramel.jpg'
           , 1, 100, 3.39, 2, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('n07', 'Protein Bar Dark Chocolate',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/Bar_DarkChocolate.jpg'
           , 1, 100, 3.39, 2, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('n08', 'Protein Bar Almonds and Chocolate',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/Bar_Chocolate.jpg'
           , 1, 100, 3.39, 2, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('n09', 'Protein Bar Matcha Tea',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/Bar_Matcha.jpg'
           , 1, 100, 3.39, 2, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('n10', 'Protein Bar Crunchy Peanut Butter',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/Bar_PeanutButter.jpg'
           , 1, 100, 3.39, 2, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('he01', 'Strengthen your Bones Supplement',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/Supplement_Bones.jpg'
           , 1, 100, 7.99, 1, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('he02', 'Immune Boost Supplement',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/Supplement_Immune.jpg'
           , 1, 100, 7.99, 1, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('he03', 'Goodnight Sleep Supplement',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/Supplement_Sleep.jpg'
           , 1, 100, 7.99, 1, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('he04', 'Tea Supplement',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/Supplement_Tea.jpg'
           , 1, 100, 7.99, 1, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('he05', 'Clear Protein Powder Mixed Wild Berries',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/Protein_Berries.jpg'
           , 1, 100, 7.99, 1, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('he06', 'Special Edition Clear Protein Powder Mixed Wild Berries',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/Protein_Berries2.jpg'
           , 1, 100, 9.99, 1, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('he07', 'Clear Protein Powder Lemon and Lime',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/Protein_LEMON.jpg'
           , 1, 100, 7.99, 1, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('he08', 'Clear Protein Powder Summer Peach',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/Protein_Peach.jpg'
           , 1, 100, 7.99, 1, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('he09', 'Special Edition Clear Protein Powder Summer Peach',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/Protein_Peach2.jpg'
           , 1, 100, 7.99, 1, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('n11', 'Organic Almond Butter',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/AlmondButter.jpg'
           , 1, 100, 7.99, 2, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('n12', 'Organic Cashew Butter',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/CashewButter.jpg'
           , 1, 100, 7.99, 2, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('n13', 'Organic Peanut Butter',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/PeanutButter.jpg'
           , 1, 100, 7.99, 2, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('he10', 'Pea Protein Powder Caramel',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/PeaProtein_Caramel.jpg'
           , 1, 100, 7.99, 1, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('he11', 'Pea Protein Powder Strawberry',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/PeaProtein_Strawberry.jpg'
           , 1, 100, 8.99, 1, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('he12', 'Pea Protein Powder Tumeric Milk',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/PeaProtein_Tumeric.jpg'
           , 1, 100, 8.99, 1, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('he13', 'Rice Protein Powder Apple and Cinnamon',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/RiceProtein_Apple.jpg'
           , 1, 100, 10.99, 1, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('he14', 'Rice Protein Powder Banana',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/RiceProtein_Banana.jpg'
           , 1, 100, 10.99, 1, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('he15', 'Rice Protein Powder Coffe Beans',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/RiceProtein_Coffe.jpg'
           , 1, 100, 10.99, 1, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('he16', 'Soy Protein Powder Blue Berry',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/SoyProtein_BlueBerry.jpg'
           , 1, 100, 11.99, 1, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('he17', 'Soy Protein Powder Chocolate',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/SoyProtein_Chocolate.jpg'
           , 1, 100, 11.99, 1, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('he18', 'Soy Protein Powder Vanilla',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/SoyProtein_Vanilla.jpg'
           , 1, 100, 11.99, 1, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('be01', 'Premium Eye Cream',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/Cream_Eye.jpg'
           , 1, 100, 12.99, 4, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('be02', 'Premium Face Cream',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/Cream_Face.jpg'
           , 1, 100, 12.99, 4, NOW());


Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('be03', 'Premium Hand Cream',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/Cream_Hand.jpg'
           , 1, 100, 9.99, 4, NOW());

Insert into product  (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('be04', 'Body Wash and Body Lotion Bundle',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/BodyWash_BodyLotion_Bundle.jpg'
           , 1, 100, 19.99, 4, NOW());

INSERT INTO product (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('h70', 'Black Horaetu Stationary Set',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/StationarySet_Black.jpg'
           , 1, 100, 15.99, 3, NOW());

INSERT INTO product (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('h71', 'White Horaetu Stationary Set',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/StationarySet_White.jpg'
           , 1, 100, 15.99, 3, NOW());

INSERT INTO product (SKU, NAME, DESCRIPTION, IMAGE_URL, ACTIVE, UNITS_IN_STOCK,
                           UNIT_PRICE, CATEGORY_ID, DATE_CREATED)
VALUES ('h99', 'Premium Horaetu Bottle Bundle',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate.',
        'assets/images/products/bottles.jpg'
           , 1, 100, 13.00, 3, NOW());


