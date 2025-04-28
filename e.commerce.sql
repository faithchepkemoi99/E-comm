-- Create brand table
CREATE TABLE brand (
    brandID INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL
);

-- Create color table
CREATE TABLE color (
    colorID INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(50) NOT NULL
);

-- Create product_category table
CREATE TABLE product_category (
    categoryID INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Create size_category table
CREATE TABLE size_category (
    sizeCategoryID INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Create size_option table
CREATE TABLE size_option (
    sizeOptionID INT AUTO_INCREMENT PRIMARY KEY,
    sizeCategoryID INT,
    size_label VARCHAR(50) NOT NULL,
    FOREIGN KEY (sizeCategoryID) REFERENCES size_category(sizeCategoryID)
);

-- Create product table
CREATE TABLE product (
    productID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    brandID INT,
    base_price DECIMAL(10,2),
    categoryID INT,
    FOREIGN KEY (brandID) REFERENCES brand(brandID),
    FOREIGN KEY (categoryID) REFERENCES product_category(categoryID)
);

-- Create product_item table
CREATE TABLE product_item (
    productItemID INT AUTO_INCREMENT PRIMARY KEY,
    productID INT,
    sku VARCHAR(100) UNIQUE,
    stock_quantity INT,
    FOREIGN KEY (productID) REFERENCES product(productID)
);

-- Create product_variation table
CREATE TABLE product_variation (
    variationID INT AUTO_INCREMENT PRIMARY KEY,
    productItemID INT,
    colorID INT,
    sizeOptionID INT,
    FOREIGN KEY (productItemID) REFERENCES product_item(productItemID),
    FOREIGN KEY (colorID) REFERENCES color(colorID),
    FOREIGN KEY (sizeOptionID) REFERENCES size_option(sizeOptionID)
);

-- Create product_image table
CREATE TABLE product_image (
    imageID INT AUTO_INCREMENT PRIMARY KEY,
    productID INT,
    image_url VARCHAR(255) NOT NULL,
    FOREIGN KEY (productID) REFERENCES product(productID)
);

-- Create attribute_category table
CREATE TABLE attribute_category (
    attributeCategoryID INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Create attribute_type table
CREATE TABLE attribute_type (
    attributeTypeID INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL
);

-- Create product_attribute table
CREATE TABLE product_attribute (
    attributeID INT AUTO_INCREMENT PRIMARY KEY,
    productID INT,
    attributeCategoryID INT,
    attributeTypeID INT,
    attribute_name VARCHAR(100) NOT NULL,
    attribute_value VARCHAR(255) NOT NULL,
    FOREIGN KEY (productID) REFERENCES product(productID),
    FOREIGN KEY (attributeCategoryID) REFERENCES attribute_category(attributeCategoryID),
    FOREIGN KEY (attributeTypeID) REFERENCES attribute_type(attributeTypeID)
);

