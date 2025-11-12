Microsoft Windows [Version 10.0.26200.6584]
(c) Microsoft Corporation. All rights reserved.

C:\Users\LENOVO>cd C:\xampp\mysql\bin

C:\xampp\mysql\bin>mysql.exe -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]>
MariaDB [(none)]> create DATABASE toko_online;
Query OK, 1 row affected (0.003 sec)

MariaDB [(none)]> use toko_online;
Database changed
MariaDB [toko_online]> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
| toko_online        |
+--------------------+
6 rows in set (0.003 sec)

MariaDB [toko_online]> CREATE TABLE pelanggan (
    ->     id_pelanggan INT PRIMARY KEY AUTO_INCREMENT,
    ->     nama VARCHAR(100),
    ->     email VARCHAR(100),
    ->     no_hp VARCHAR(15),
    ->     alamat VARCHAR(150)
    -> );
Query OK, 0 rows affected (0.022 sec)

MariaDB [toko_online]> CREATE TABLE produk (
    ->     id_produk INT PRIMARY KEY AUTO_INCREMENT,
    ->     nama_produk VARCHAR(100),
    ->     kategori VARCHAR(50),
    ->     harga DECIMAL(10,2),
    ->     stok INT
    -> );
Query OK, 0 rows affected (0.028 sec)

MariaDB [toko_online]> CREATE TABLE transaksi (
    ->     id_transaksi INT PRIMARY KEY AUTO_INCREMENT,
    ->     id_pelanggan INT,
    ->     id_produk INT,
    ->     tanggal_transaksi DATE,
    ->     jumlah INT,
    ->     total_harga DECIMAL(10,2),
    ->     FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    ->     FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
    -> );
Query OK, 0 rows affected (0.024 sec)

MariaDB [toko_online]> INSERT INTO pelanggan (nama, email, no_hp, alamat) VALUES
    -> ('Rani Putri', 'rani@gmail.com', '0812001001', 'Jl. Kenanga No. 3'),
    -> ('Andi Saputra', 'andi@gmail.com', '0812001002', 'Jl. Mawar No. 7'),
    -> ('Nina Lestari', 'nina@gmail.com', '0812001003', 'Jl. Melati No. 5'),
    -> ('Rizal Fadli', 'rizal@gmail.com', '0812001004', 'Jl. Anggrek No. 9'),
    -> ('Citra Dewi', 'citra@gmail.com', '0812001005', 'Jl. Flamboyan No. 2'),
    -> ('Bayu Pratama', 'bayu@gmail.com', '0812001006', 'Jl. Cempaka No. 10'),
    -> ('Dewi Kartika', 'dewik@gmail.com', '0812001007', 'Jl. Dahlia No. 12'),
    -> ('Eka Yuliana', 'eka@gmail.com', '0812001008', 'Jl. Merpati No. 8'),
    -> ('Fajar Hidayat', 'fajar@gmail.com', '0812001009', 'Jl. Sakura No. 15'),
    -> ('Lina Marlina', 'lina@gmail.com', '0812001010', 'Jl. Nangka No. 4'),
    -> ('Tono Widodo', 'tono@gmail.com', '0812001011', 'Jl. Angsana No. 6'),
    -> ('Sinta Ayu', 'sinta@gmail.com', '0812001012', 'Jl. Mawar No. 2'),
    -> ('Yuda Prasetyo', 'yuda@gmail.com', '0812001013', 'Jl. Melur No. 1'),
    -> ('Farah Hasanah', 'farah@gmail.com', '0812001014', 'Jl. Cendana No. 11'),
    -> ('Indra Gunawan', 'indra@gmail.com', '0812001015', 'Jl. Teratai No. 9');
Query OK, 15 rows affected (0.020 sec)
Records: 15  Duplicates: 0  Warnings: 0

MariaDB [toko_online]> INSERT INTO produk (nama_produk, kategori, harga, stok) VALUES
    -> ('Kaos Polos', 'Fashion', 75000, 40),
    -> ('Celana Jeans', 'Fashion', 180000, 30),
    -> ('Sepatu Sneakers', 'Fashion', 350000, 25),
    -> ('Tas Ransel', 'Aksesoris', 250000, 20),
    -> ('Topi Baseball', 'Aksesoris', 65000, 35),
    -> ('Jam Tangan', 'Aksesoris', 500000, 15),
    -> ('Mouse Wireless', 'Elektronik', 120000, 40),
    -> ('Keyboard RGB', 'Elektronik', 220000, 20),
    -> ('Headset Gaming', 'Elektronik', 280000, 25),
    -> ('Charger HP', 'Elektronik', 85000, 30),
    -> ('Powerbank', 'Elektronik', 150000, 40),
    -> ('Buku Catatan', 'Alat Tulis', 20000, 50),
    -> ('Bolpoin', 'Alat Tulis', 5000, 60),
    -> ('Tas Laptop', 'Aksesoris', 320000, 10),
    -> ('Kabel Data', 'Elektronik', 40000, 45);
Query OK, 15 rows affected (0.012 sec)
Records: 15  Duplicates: 0  Warnings: 0

MariaDB [toko_online]> INSERT INTO transaksi (id_pelanggan, id_produk, tanggal_transaksi, jumlah, total_harga) VALUES
    -> (1, 1, '2025-11-01', 2, 150000),
    -> (2, 3, '2025-11-01', 1, 350000),
    -> (3, 2, '2025-11-02', 1, 180000),
    -> (4, 5, '2025-11-02', 3, 195000),
    -> (5, 7, '2025-11-03', 1, 120000),
    -> (6, 8, '2025-11-03', 1, 220000),
    -> (7, 9, '2025-11-04', 1, 280000),
    -> (8, 4, '2025-11-04', 1, 250000),
    -> (9, 6, '2025-11-05', 1, 500000),
    -> (10, 10, '2025-11-05', 2, 170000),
    -> (11, 12, '2025-11-06', 5, 100000),
    -> (12, 13, '2025-11-06', 10, 50000),
    -> (13, 11, '2025-11-07', 1, 150000),
    -> (14, 14, '2025-11-07', 2, 80000),
    -> (15, 15, '2025-11-08', 3, 120000);
Query OK, 15 rows affected (0.017 sec)
Records: 15  Duplicates: 0  Warnings: 0


MariaDB [toko_online]> SHOW TABLES;
+-----------------------+
| Tables_in_toko_online |
+-----------------------+
| pelanggan             |
| produk                |
| transaksi             |
+-----------------------+
3 rows in set (0.008 sec)

MariaDB [toko_online]> desc pelanggan;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| id_pelanggan | int(11)      | NO   | PRI | NULL    | auto_increment |
| nama         | varchar(100) | YES  |     | NULL    |                |
| email        | varchar(100) | YES  |     | NULL    |                |
| no_hp        | varchar(15)  | YES  |     | NULL    |                |
| alamat       | varchar(150) | YES  |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
5 rows in set (0.015 sec)

MariaDB [toko_online]> desc produk;
+-------------+---------------+------+-----+---------+----------------+
| Field       | Type          | Null | Key | Default | Extra          |
+-------------+---------------+------+-----+---------+----------------+
| id_produk   | int(11)       | NO   | PRI | NULL    | auto_increment |
| nama_produk | varchar(100)  | YES  |     | NULL    |                |
| kategori    | varchar(50)   | YES  |     | NULL    |                |
| harga       | decimal(10,2) | YES  |     | NULL    |                |
| stok        | int(11)       | YES  |     | NULL    |                |
+-------------+---------------+------+-----+---------+----------------+
5 rows in set (0.009 sec)

MariaDB [toko_online]> desc transaksi;
+-------------------+---------------+------+-----+---------+----------------+
| Field             | Type          | Null | Key | Default | Extra          |
+-------------------+---------------+------+-----+---------+----------------+
| id_transaksi      | int(11)       | NO   | PRI | NULL    | auto_increment |
| id_pelanggan      | int(11)       | YES  | MUL | NULL    |                |
| id_produk         | int(11)       | YES  | MUL | NULL    |                |
| tanggal_transaksi | date          | YES  |     | NULL    |                |
| jumlah            | int(11)       | YES  |     | NULL    |                |
| total_harga       | decimal(10,2) | YES  |     | NULL    |                |
+-------------------+---------------+------+-----+---------+----------------+
6 rows in set (0.014 sec)

MariaDB [toko_online]> SELECT * FROM produk
    -> WHERE kategori = 'Elektronik';
+-----------+----------------+------------+-----------+------+
| id_produk | nama_produk    | kategori   | harga     | stok |
+-----------+----------------+------------+-----------+------+
|         7 | Mouse Wireless | Elektronik | 120000.00 |   40 |
|         8 | Keyboard RGB   | Elektronik | 220000.00 |   20 |
|         9 | Headset Gaming | Elektronik | 280000.00 |   25 |
|        10 | Charger HP     | Elektronik |  85000.00 |   30 |
|        11 | Powerbank      | Elektronik | 150000.00 |   40 |
|        15 | Kabel Data     | Elektronik |  40000.00 |   45 |
+-----------+----------------+------------+-----------+------+
6 rows in set (0.013 sec)

MariaDB [toko_online]> SELECT * FROM pelanggan
    -> WHERE alamat LIKE '%Mawar%';
+--------------+--------------+-----------------+------------+-----------------+
| id_pelanggan | nama         | email           | no_hp      | alamat          |
+--------------+--------------+-----------------+------------+-----------------+
|            2 | Andi Saputra | andi@gmail.com  | 0812001002 | Jl. Mawar No. 7 |
|           12 | Sinta Ayu    | sinta@gmail.com | 0812001012 | Jl. Mawar No. 2 |
+--------------+--------------+-----------------+------------+-----------------+
2 rows in set (0.008 sec)

MariaDB [toko_online]> SELECT * FROM transaksi
    -> WHERE jumlah > 2;
+--------------+--------------+-----------+-------------------+--------+-------------+
| id_transaksi | id_pelanggan | id_produk | tanggal_transaksi | jumlah | total_harga |
+--------------+--------------+-----------+-------------------+--------+-------------+
|            4 |            4 |         5 | 2025-11-02        |      3 |   195000.00 |
|           11 |           11 |        12 | 2025-11-06        |      5 |   100000.00 |
|           12 |           12 |        13 | 2025-11-06        |     10 |    50000.00 |
|           15 |           15 |        15 | 2025-11-08        |      3 |   120000.00 |
+--------------+--------------+-----------+-------------------+--------+-------------+
4 rows in set (0.006 sec)

MariaDB [toko_online]> SELECT * FROM produk
    -> WHERE harga BETWEEN 100000 AND 300000;
+-----------+----------------+------------+-----------+------+
| id_produk | nama_produk    | kategori   | harga     | stok |
+-----------+----------------+------------+-----------+------+
|         2 | Celana Jeans   | Fashion    | 180000.00 |   30 |
|         4 | Tas Ransel     | Aksesoris  | 250000.00 |   20 |
|         7 | Mouse Wireless | Elektronik | 120000.00 |   40 |
|         8 | Keyboard RGB   | Elektronik | 220000.00 |   20 |
|         9 | Headset Gaming | Elektronik | 280000.00 |   25 |
|        11 | Powerbank      | Elektronik | 150000.00 |   40 |
+-----------+----------------+------------+-----------+------+
6 rows in set (0.002 sec)

MariaDB [toko_online]> SELECT * FROM transaksi
    -> WHERE tanggal_transaksi BETWEEN '2025-11-02' AND '2025-11-05';
+--------------+--------------+-----------+-------------------+--------+-------------+
| id_transaksi | id_pelanggan | id_produk | tanggal_transaksi | jumlah | total_harga |
+--------------+--------------+-----------+-------------------+--------+-------------+
|            3 |            3 |         2 | 2025-11-02        |      1 |   180000.00 |
|            4 |            4 |         5 | 2025-11-02        |      3 |   195000.00 |
|            5 |            5 |         7 | 2025-11-03        |      1 |   120000.00 |
|            6 |            6 |         8 | 2025-11-03        |      1 |   220000.00 |
|            7 |            7 |         9 | 2025-11-04        |      1 |   280000.00 |
|            8 |            8 |         4 | 2025-11-04        |      1 |   250000.00 |
|            9 |            9 |         6 | 2025-11-05        |      1 |   500000.00 |
|           10 |           10 |        10 | 2025-11-05        |      2 |   170000.00 |
+--------------+--------------+-----------+-------------------+--------+-------------+
8 rows in set (0.007 sec)

MariaDB [toko_online]> SELECT * FROM transaksi
    -> WHERE id_pelanggan = 5
    -> AND tanggal_transaksi BETWEEN '2025-11-02' AND '2025-11-06';
+--------------+--------------+-----------+-------------------+--------+-------------+
| id_transaksi | id_pelanggan | id_produk | tanggal_transaksi | jumlah | total_harga |
+--------------+--------------+-----------+-------------------+--------+-------------+
|            5 |            5 |         7 | 2025-11-03        |      1 |   120000.00 |
+--------------+--------------+-----------+-------------------+--------+-------------+
1 row in set (0.005 sec)

