CREATE DATABASE aims;

CREATE TABLE Media (
 id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
 price int NOT NULL,
 value int NOT NULL,
 category varchar(255) NOT NULL,
 title varchar(255) NOT NULL,
 supportRushDelivery boolean NOT NULL
);

CREATE TABLE PhysicalGood (
 id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
 FOREIGN KEY (mediaId) REFERENCES Media(id),
 barcode varchar(255) NOT NULL,
 description varchar(255) NOT NULL,
 stockReceiptDate date NOT NULL,
 quantity int NOT NULL,
 productDimension varchar(255) NOT NULL
);

CREATE TABLE CD (
 id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
 FOREIGN KEY (physicalGoodId) REFERENCES PhysicalGood(id),
 album varchar(255) NOT NULL,
 artist varchar(255) NOT NULL,
 trackList varchar(255) NOT NULL,
 genre varchar(255) NOT NULL,
 releaseDate date NOT NULL,
 recordLabel varchar(255) NOT NULL
);

CREATE TABLE LP (
 id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
 FOREIGN KEY (physicalGoodId) REFERENCES PhysicalGood(id),
 album varchar(255) NOT NULL,
 artist varchar(255) NOT NULL,
 trackList varchar(255) NOT NULL,
 genre varchar(255) NOT NULL,
 releaseDate date NOT NULL,
 recordLabel varchar(255) NOT NULL
);

CREATE TABLE Book (
 id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
 FOREIGN KEY (physicalGoodId) REFERENCES PhysicalGood(id),
 author varchar(255) NOT NULL,
 coverType varchar(255) NOT NULL,
 publishDate date NOT NULL,
 publisher varchar(255) NOT NULL,
 category varchar(255) NOT NULL,
 numberOfPage int NOT NULL,
 laguage varchar(255) NOT NULL
);

CREATE TABLE DVD (
 id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
 FOREIGN KEY (physicalGoodId) REFERENCES PhysicalGood(id),
 studio varchar(255) NOT NULL,
 genre varchar(255) NOT NULL,
 releaseDate date NOT NULL,
 discType varchar(255) NOT NULL,
 director varchar(255) NOT NULL,
 runtime int NOT NULL,
 subtitle varchar(255) NOT NULL
);

CREATE TABLE DeliveryInfo (
 id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
 name varchar(255) NOT NULL,
 email varchar(255) NOT NULL,
 phoneNumber varchar(10) NOT NULL,
 province varchar(255) NOT NULL,
 address varchar(255) NOT NULL
);

CREATE TABLE RushDeliveryInfo (
 id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
 FOREIGN KEY (deliveryInfoId) REFERENCES DeliveryInfo(id),
 instruction varchar(255) NOT NULL,
 receivedDate date NOT NULL
);

CREATE TABLE `Order` (
 id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
 FOREIGN KEY (deliveryInfoId) REFERENCES DeliveryInfo(id),
 shippingFees varchar(255) NOT NULL,
 totalAmount int NOT NULL,
 deliveryMethod varchar(255) NOT NULL
);

CREATE TABLE CreditCard (
 id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
 cardNumber varchar(255) NOT NULL,
 ownerName varchar(255) NOT NULL,
 cvvCode int NOT NULL,
 dateExp date NOT NULL
);

CREATE TABLE VNPayPaymentTransaction (
 id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
 FOREIGN KEY (creditCardId) REFERENCES CreditCard(id),
 typeOfGoods varchar(255) NOT NULL,
 content varchar(255) NOT NULL,
 bank varchar(255) NOT NULL,
 language varchar(255) NOT NULL,
 totalAmount int NOT NULL
);

CREATE TABLE Invoice (
 id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
 FOREIGN KEY (orderId) REFERENCES `Order`(id),
 FOREIGN KEY (VNPayPaymentTransactionId) REFERENCES VNPayPaymentTransaction(id)
);
