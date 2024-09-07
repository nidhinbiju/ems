SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE audience (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  contact varchar(50) NOT NULL,
  email varchar(255) NOT NULL,
  address text NOT NULL,
  event_id int(11) NOT NULL,
  payment_status tinyint(1) NOT NULL DEFAULT 0 COMMENT '0= pending, 1 =Paid',
  attendance_status tinyint(1) NOT NULL DEFAULT 0 COMMENT '1= present',
  status tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = for verification,  1 = confirmed,2= declined',
  date_created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE events (
  id int(11) NOT NULL AUTO_INCREMENT,
  venue_id int(11) NOT NULL,
  event text NOT NULL,
  description text NOT NULL,
  schedule datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  type tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Public, 2=Private',
  audience_capacity int(11) NOT NULL,
  payment_type tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Free, 2=payable',
  amount double NOT NULL DEFAULT 0,
  banner text NOT NULL,
  date_created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE system_settings (
  id int(11) NOT NULL AUTO_INCREMENT,
  name text NOT NULL,
  email varchar(255) NOT NULL,
  contact varchar(20) NOT NULL,
  cover_img text NOT NULL,
  about_content text NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE users (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  username varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  type tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=Admin, 2=Staff',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE venue (
  id int(11) NOT NULL AUTO_INCREMENT,
  venue text NOT NULL,
  address text NOT NULL,
  description text NOT NULL,
  rate float NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE venue_booking (
  id int(11) NOT NULL AUTO_INCREMENT,
  name text NOT NULL,
  address text NOT NULL,
  email varchar(255) NOT NULL,
  contact varchar(255) NOT NULL,
  venue_id int(11) NOT NULL,
  duration varchar(100) NOT NULL,
  datetime datetime NOT NULL,
  status tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-for verification, 1=confirmed, 2=canceled',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO users (id, name, username, password, type) VALUES
(2, 'Administrator', 'admin', '0192023a7bbd73250516f069df18b500', 1);

COMMIT;