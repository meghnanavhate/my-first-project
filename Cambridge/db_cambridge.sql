-- Create Database
CREATE DATABASE IF NOT EXISTS cb_cambridge;
USE cb_cambridge;

-- Admin Table
CREATE TABLE cb_admin (
    admin_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    contact_number VARCHAR(15) NOT NULL
);

-- Teacher Table
CREATE TABLE cb_teacher (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    subject VARCHAR(50) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    hired_date DATE NOT NULL,
    admin_id INT,
    CONSTRAINT fk_teacher_admin
        FOREIGN KEY (admin_id) REFERENCES cb_admin(admin_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Student Table
CREATE TABLE cb_student (
    student_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Boy', 'Girl') NOT NULL,
    class_level ENUM('Nursery', 'Kindergarten', 'Primary', 'Secondary') NOT NULL,
    guardian_name VARCHAR(100) NOT NULL,
    guardian_contact VARCHAR(15) NOT NULL,
    teacher_id INT,
    admin_id INT,
    CONSTRAINT fk_student_teacher
        FOREIGN KEY (teacher_id) REFERENCES cb_teacher(teacher_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    CONSTRAINT fk_student_admin
        FOREIGN KEY (admin_id) REFERENCES cb_admin(admin_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Enquiry Table
CREATE TABLE db_enq (
    enq_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    parent_name VARCHAR(255) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    residential_address TEXT NOT NULL,
    child_name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Boy', 'Girl') NOT NULL,
    interested_in ENUM('Nursery', 'Kindergarten', 'Primary', 'Secondary') NOT NULL,
    admin_id INT,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_enq_admin
        FOREIGN KEY (admin_id) REFERENCES cb_admin(admin_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- ===============================
-- Insert Admin Records
-- ===============================
INSERT INTO cb_admin (full_name, email, password_hash, contact_number) VALUES
('Alice Johnson', 'alice.admin@example.com', 'hash1', '9998887771'),
('Bob Smith', 'bob.admin@example.com', 'hash2', '9998887772'),
('Charlie Brown', 'charlie.admin@example.com', 'hash3', '9998887773'),
('Diana Prince', 'diana.admin@example.com', 'hash4', '9998887774'),
('Edward Norton', 'edward.admin@example.com', 'hash5', '9998887775');

-- ===============================
-- Insert Enquiries Record
-- ===============================
INSERT INTO db_enq (parent_name, contact_number, email, residential_address, child_name, date_of_birth, gender, interested_in, admin_id) VALUES
('Vishal Pawar', '9890011111', 'vishal.pawar@gmail.com', 'Pune', 'Atharva Pawar', '2025-02-10', 'Boy', 'Nursery', 1),
('Meena Khot', '9890011112', 'meena.khot@gmail.com', 'Kolhapur', 'Kshitij Khot', '2025-02-12', 'Boy', 'Kindergarten', 2),
('Suresh More', '9890011113', 'suresh.more@gmail.com', 'Sangli', 'Rutuja More', '2025-02-15', 'Girl', 'Primary', 3),
('Sarika Gaikwad', '9890011114', 'sarika.gaikwad@gmail.com', 'Nashik', 'Sarthak Gaikwad', '2025-02-18', 'Boy', 'Secondary', 4),
('Pravin Bhosale', '9890011115', 'pravin.bhosale@gmail.com', 'Satara', 'Shruti Bhosale', '2025-02-20', 'Girl', 'Nursery', 5),
('Savita Salunkhe', '9890011116', 'savita.salunkhe@gmail.com', 'Kolhapur', 'Omkar Salunkhe', '2025-02-22', 'Boy', 'Kindergarten', 1),
('Ganesh Jagtap', '9890011117', 'ganesh.jagtap@gmail.com', 'Pune', 'Anuja Jagtap', '2025-02-25', 'Girl', 'Primary', 2),
('Asha Shitole', '9890011118', 'asha.shitole@gmail.com', 'Mumbai', 'Nilesh Shitole', '2025-02-27', 'Boy', 'Secondary', 3),
('Nitin Mane', '9890011119', 'nitin.mane@gmail.com', 'Solapur', 'Tanvi Mane', '2025-03-01', 'Girl', 'Nursery', 4),
('Sunita Kharade', '9890011120', 'sunita.kharade@gmail.com', 'Satara', 'Sahil Kharade', '2025-03-03', 'Boy', 'Kindergarten', 5),
('Vijay Thorat', '9890011121', 'vijay.thorat@gmail.com', 'Pune', 'Neha Thorat', '2025-03-04', 'Girl', 'Primary', 1),
('Anita Bhandare', '9890011122', 'anita.bhandare@gmail.com', 'Pune', 'Rohan Bhandare', '2025-03-05', 'Boy', 'Secondary', 2),
('Bharati Kamble', '9890011123', 'bharati.kamble@gmail.com', 'Kolhapur', 'Isha Kamble', '2025-03-06', 'Girl', 'Nursery', 3),
('Mahesh Nalawade', '9890011124', 'mahesh.nalawade@gmail.com', 'Sangli', 'Ruturaj Nalawade', '2025-03-07', 'Boy', 'Kindergarten', 4),
('Seema Jadhav', '9890011125', 'seema.jadhav@gmail.com', 'Solapur', 'Snehal Jadhav', '2025-03-08', 'Girl', 'Primary', 5),
('Rajesh Kolhe', '9890011126', 'rajesh.kolhe@gmail.com', 'Mumbai', 'Ravindra Kolhe', '2025-03-09', 'Boy', 'Secondary', 1),
('Varsha Dandge', '9890011127', 'varsha.dandge@gmail.com', 'Nashik', 'Komal Dandge', '2025-03-10', 'Girl', 'Nursery', 2),
('Pramod Kharat', '9890011128', 'pramod.kharat@gmail.com', 'Pune', 'Aditya Kharat', '2025-03-11', 'Boy', 'Kindergarten', 3),
('Usha Sonawane', '9890011129', 'usha.sonawane@gmail.com', 'Aurangabad', 'Mitali Sonawane', '2025-03-12', 'Girl', 'Primary', 4),
('Manoj Gite', '9890011130', 'manoj.gite@gmail.com', 'Jalgaon', 'Swapnil Gite', '2025-03-13', 'Boy', 'Secondary', 5);

-- ===============================
-- Insert Student Record
-- ===============================

INSERT INTO cb_student (full_name, date_of_birth, gender, class_level, guardian_name, guardian_contact, teacher_id, admin_id) VALUES
('Omkar Pawar', '2020-02-10', 'Boy', 'Nursery', 'Vishal Pawar', '9890011111', 1, 1),
('Rutuja More', '2019-03-12', 'Girl', 'Kindergarten', 'Suresh More', '9890011113', 2, 2),
('Sarthak Gaikwad', '2018-04-15', 'Boy', 'Primary', 'Sarika Gaikwad', '9890011114', 3, 3),
('Shruti Bhosale', '2017-05-20', 'Girl', 'Secondary', 'Pravin Bhosale', '9890011115', 4, 4),
('Aniket Salunkhe', '2020-06-05', 'Boy', 'Nursery', 'Savita Salunkhe', '9890011116', 5, 5),
('Anuja Jagtap', '2019-07-10', 'Girl', 'Kindergarten', 'Ganesh Jagtap', '9890011117', 6, 1),
('Nilesh Shitole', '2018-08-15', 'Boy', 'Primary', 'Asha Shitole', '9890011118', 7, 2),
('Tanvi Mane', '2017-09-20', 'Girl', 'Secondary', 'Nitin Mane', '9890011119', 8, 3),
('Sahil Kharade', '2020-10-25', 'Boy', 'Nursery', 'Sunita Kharade', '9890011120', 9, 4),
('Neha Thorat', '2019-11-30', 'Girl', 'Kindergarten', 'Vijay Thorat', '9890011121', 10, 5),
('Rohan Bhandare', '2018-02-14', 'Boy', 'Primary', 'Anita Bhandare', '9890011122', 11, 1),
('Isha Kamble', '2017-03-18', 'Girl', 'Secondary', 'Bharati Kamble', '9890011123', 12, 2),
('Ruturaj Nalawade', '2020-04-22', 'Boy', 'Nursery', 'Mahesh Nalawade', '9890011124', 13, 3),
('Snehal Jadhav', '2019-05-26', 'Girl', 'Kindergarten', 'Seema Jadhav', '9890011125', 14, 4),
('Ravindra Kolhe', '2018-06-30', 'Boy', 'Primary', 'Rajesh Kolhe', '9890011126', 15, 5),
('Komal Dandge', '2017-07-04', 'Girl', 'Secondary', 'Varsha Dandge', '9890011127', 16, 1),
('Aditya Kharat', '2020-08-08', 'Boy', 'Nursery', 'Pramod Kharat', '9890011128', 17, 2),
('Mitali Sonawane', '2019-09-12', 'Girl', 'Kindergarten', 'Usha Sonawane', '9890011129', 18, 3),
('Swapnil Gite', '2018-10-16', 'Boy', 'Primary', 'Manoj Gite', '9890011130', 19, 4),
('Atharva Pawar', '2019-02-20', 'Boy', 'Nursery', 'Vishal Pawar', '9890011111', 20, 5),
('Kshitij Khot', '2018-03-15', 'Boy', 'Kindergarten', 'Meena Khot', '9890011112', 21, 1),
('Sarthak Gaikwad', '2017-04-25', 'Boy', 'Primary', 'Sarika Gaikwad', '9890011114', 22, 2),
('Shruti Bhosale', '2016-05-28', 'Girl', 'Secondary', 'Pravin Bhosale', '9890011115', 23, 3),
('Omkar Salunkhe', '2019-06-01', 'Boy', 'Nursery', 'Savita Salunkhe', '9890011116', 24, 4),
('Anuja Jagtap', '2018-07-05', 'Girl', 'Kindergarten', 'Ganesh Jagtap', '9890011117', 25, 5),
('Nilesh Shitole', '2017-08-09', 'Boy', 'Primary', 'Asha Shitole', '9890011118', 26, 1),
('Tanvi Mane', '2016-09-13', 'Girl', 'Secondary', 'Nitin Mane', '9890011119', 27, 2),
('Sahil Kharade', '2020-10-17', 'Boy', 'Nursery', 'Sunita Kharade', '9890011120', 28, 3),
('Neha Thorat', '2019-11-21', 'Girl', 'Kindergarten', 'Vijay Thorat', '9890011121', 29, 4),
('Rohan Bhandare', '2018-12-25', 'Boy', 'Primary', 'Anita Bhandare', '9890011122', 30, 5),
('Isha Kamble', '2017-01-29', 'Girl', 'Secondary', 'Bharati Kamble', '9890011123', 30, 5),
('Mitali Sonawane', '2018-03-03', 'Girl', 'Primary', 'Usha Sonawane', '9890011129', 17, 4),
('Aditya Kharat', '2019-04-07', 'Boy', 'Kindergarten', 'Pramod Kharat', '9890011128', 18, 3),
('Komal Dandge', '2020-05-11', 'Girl', 'Nursery', 'Varsha Dandge', '9890011127', 19, 2),
('Ravindra Kolhe', '2017-06-15', 'Boy', 'Secondary', 'Rajesh Kolhe', '9890011126', 20, 1);

-- ===============================
-- Insert Teacher Record
-- ===============================

INSERT INTO cb_teacher (full_name, email, password_hash, subject, contact_number, hired_date, admin_id) VALUES
('Vaibhav Patil', 'vaibhav.patil@school.com', 'hash1', 'Math', '9765012345', '2025-02-10', 1),
('Rohini Kulkarni', 'rohini.kulkarni@school.com', 'hash2', 'Science', '9765012346', '2025-02-11', 1),
('Sandeep Jadhav', 'sandeep.jadhav@school.com', 'hash3', 'English', '9765012347', '2025-02-12', 2),
('Neha Shinde', 'neha.shinde@school.com', 'hash4', 'Marathi', '9765012348', '2025-02-13', 2),
('Swapnil Deshmukh', 'swapnil.deshmukh@school.com', 'hash5', 'History', '9765012349', '2025-02-14', 3),
('Amruta Bhosale', 'amruta.bhosale@school.com', 'hash6', 'Science', '9765012350', '2025-02-15', 3),
('Vikas Thorat', 'vikas.thorat@school.com', 'hash7', 'Math', '9765012351', '2025-02-16', 4),
('Pooja Kamble', 'pooja.kamble@school.com', 'hash8', 'English', '9765012352', '2025-02-17', 4),
('Santosh Salunkhe', 'santosh.salunkhe@school.com', 'hash9', 'Science', '9765012353', '2025-02-18', 5),
('Sneha Nalawade', 'sneha.nalawade@school.com', 'hash10', 'Marathi', '9765012354', '2025-02-19', 5),
('Rajesh Pawar', 'rajesh.pawar@school.com', 'hash11', 'Math', '9765012355', '2025-02-20', 1),
('Meena More', 'meena.more@school.com', 'hash12', 'Science', '9765012356', '2025-02-21', 1),
('Kiran Gite', 'kiran.gite@school.com', 'hash13', 'English', '9765012357', '2025-02-22', 2),
('Aarti Shitole', 'aarti.shitole@school.com', 'hash14', 'Marathi', '9765012358', '2025-02-23', 2),
('Ganesh Jagtap', 'ganesh.jagtap@school.com', 'hash15', 'History', '9765012359', '2025-02-24', 3),
('Varsha Dandge', 'varsha.dandge@school.com', 'hash16', 'Science', '9765012360', '2025-02-25', 3),
('Sunil Kharat', 'sunil.kharat@school.com', 'hash17', 'Math', '9765012361', '2025-02-26', 4),
('Anuja Sonawane', 'anuja.sonawane@school.com', 'hash18', 'English', '9765012362', '2025-02-27', 4),
('Nitin Kolhe', 'nitin.kolhe@school.com', 'hash19', 'Science', '9765012363', '2025-02-28', 5),
('Sujata Khot', 'sujata.khot@school.com', 'hash20', 'Marathi', '9765012364', '2025-03-01', 5),
('Mahesh Mane', 'mahesh.mane@school.com', 'hash21', 'Math', '9765012365', '2025-03-02', 1),
('Shruti Gaikwad', 'shruti.gaikwad@school.com', 'hash22', 'Science', '9765012366', '2025-03-03', 1),
('Ashwini Bhandare', 'ashwini.bhandare@school.com', 'hash23', 'English', '9765012367', '2025-03-04', 2),
('Prasad Sawant', 'prasad.sawant@school.com', 'hash24', 'History', '9765012368', '2025-03-05', 2),
('Dipali Jadhav', 'dipali.jadhav@school.com', 'hash25', 'Marathi', '9765012369', '2025-03-06', 3),
('Umesh Kharade', 'umesh.kharade@school.com', 'hash26', 'Math', '9765012370', '2025-03-07', 3),
('Laxmi Kumbhar', 'laxmi.kumbhar@school.com', 'hash27', 'English', '9765012371', '2025-03-08', 4),
('Bhushan Salvi', 'bhushan.salvi@school.com', 'hash28', 'Science', '9765012372', '2025-03-09', 4),
('Sanjay Sutar', 'sanjay.sutar@school.com', 'hash29', 'Math', '9765012373', '2025-03-10', 5),
('Ankita Pawar', 'ankita.pawar@school.com', 'hash30', 'Hindi', '9765012374', '2025-03-11', 5);

-- ===============================
-- Describe Tables
-- ===============================

describe cb_admin;

describe cb_student;

describe cb_teacher;

describe db_enq;

-- ===============================
-- Show Tables
-- ===============================

select * from cb_admin;

select * from cb_teacher;

select * from cb_student;

select * from db_enq;

