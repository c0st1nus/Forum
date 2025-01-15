CREATE TABLE `Users`(
    `user_ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(30) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `registration_date` TIMESTAMP NOT NULL
);
CREATE TABLE `Chats`(
    `chat_ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `chat_name` VARCHAR(50) NOT NULL,
    `owner_ID` INT NOT NULL,
    `creation_date` TIMESTAMP NOT NULL
);
CREATE TABLE `Messages`(
    `message_ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `message` LONGTEXT NOT NULL,
    `sender_ID` INT NOT NULL,
    `chat_ID` INT NOT NULL,
    `send_date` DATE NOT NULL,
    `send_time` TIME NOT NULL
);
CREATE TABLE `Conversations`(
    `conversation_ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_ID` INT NOT NULL,
    `chat_ID` INT NOT NULL
);
ALTER TABLE
    `Messages` ADD FOREIGN KEY(`sender_ID`) REFERENCES `Users`(`user_ID`);
ALTER TABLE
    `Chats` ADD FOREIGN KEY(`owner_ID`) REFERENCES `Users`(`user_ID`);
ALTER TABLE
    `Conversations` ADD FOREIGN KEY(`chat_ID`) REFERENCES `Chats`(`chat_ID`);
ALTER TABLE
    `Conversations` ADD FOREIGN KEY(`user_ID`) REFERENCES `Users`(`user_ID`);
ALTER TABLE
    `Messages` ADD FOREIGN KEY(`chat_ID`) REFERENCES `Chats`(`chat_ID`);