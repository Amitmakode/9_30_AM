USE ddl ;

# event Creation

CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    task_name VARCHAR(255),
    `status` VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DELIMITER $$

CREATE PROCEDURE add_task()
BEGIN
    INSERT INTO tasks (task_name, `status`) 
    VALUES ('New Task', 'pending');
END $$

DELIMITER ;


CREATE EVENT add_task_event
ON SCHEDULE EVERY 1 MINUTE
DO
    CALL add_task();


SET GLOBAL event_scheduler = ON;

select * from tasks ;


----------------------------------------------------------------
#exception Handling


CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255),
    email VARCHAR(255) UNIQUE
);


DELIMITER $$

CREATE PROCEDURE insert_user(IN user_name VARCHAR(255), IN user_email VARCHAR(255))
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        BEGIN
            -- This block is executed if an error occurs
            SELECT 'Error: Unable to insert user due to a duplicate email or other constraint violation.';
        END;

    -- Attempt to insert a new user into the table
    INSERT INTO users (`name`, email) VALUES (user_name, user_email);
    
    -- Success message if no error occurs
    SELECT 'User inserted successfully!';
END $$

DELIMITER ;


CALL insert_user('Johnn Doe', 'john.doe@example.com');

CALL insert_user('Jane2 Doe', 'john2.doe@example.com');


select * from users ;

-- Error: Unable to insert user due to a duplicate email or other constraint violation.

-------------------------------------------------------------------

#image insertion in table

create table image(id int, img longblob) ;

insert into image (id, img) 
values (1, load_file("C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Data Analytics.jpg")) ;


select * from image ;

