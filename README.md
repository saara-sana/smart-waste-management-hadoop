# smart-waste-management-hadoop
# Smart Waste Management Analytics using Hadoop & Hive

## 📌 Project Overview

This project implements a Smart Waste Management Analytics system using the Hadoop Ecosystem. The system analyzes IoT-based waste management data collected from smart garbage bins deployed across a city.

The objective is to identify overflow-prone locations, analyze waste generation patterns, and generate useful insights that can help municipal authorities optimize waste collection schedules and improve city cleanliness.

---

## 🎯 Problem Statement

A smart city municipal corporation has deployed sensors in garbage bins that continuously collect information such as:

* Bin ID
* Zone
* Timestamp
* Waste Type
* Fill Level Percentage
* Collection Status

Due to the large volume of generated data, traditional data processing methods become inefficient.

### Business Challenges

* Large volume of real-time and historical waste data
* Overflowing garbage bins due to poor monitoring
* Inefficient waste collection routes
* Lack of analytical insights for decision-making

### Objective

Design a scalable data analytics pipeline using Hadoop and Hive to:

* Store datasets in HDFS
* Process data using MapReduce
* Analyze waste patterns using Hive
* Identify frequently overflowing locations
* Generate daily waste trends
* Detect high-risk zones
* Support optimized waste collection planning

---

## 🛠 Technologies Used

* Hadoop
* HDFS (Hadoop Distributed File System)
* MapReduce
* Apache Hive
* Java
* CSV Dataset

---

## 📂 Dataset Structure

| Field Name         | Description                      |
| ------------------ | -------------------------------- |
| Bin_ID             | Unique identifier of garbage bin |
| Zone               | Area/Location of the bin         |
| Timestamp          | Date and time of data collection |
| Waste_Type         | Type of waste collected          |
| Fill_Level_Percent | Current fill level of bin        |
| Collection_Status  | Collection status of the bin     |

---

## 📁 Project Structure

```text
smart-waste-management/
│
├── dataset/
│   └── waste_data.csv
│
├── mapreduce/
│   ├── OverflowMapper.java
│   ├── OverflowReducer.java
│   └── WasteDriver.java
│
└── README.md
```

---

## 🚀 Hadoop Implementation

### Step 1: Start Hadoop Services

```bash
start-all.sh
```

Verify active services:

```bash
jps
```

---

### Step 2: Create Input Directory in HDFS

```bash
hdfs dfs -mkdir /input
```

---

### Step 3: Upload Dataset to HDFS

```bash
hdfs dfs -put waste_data.csv /input
```

Verify upload:

```bash
hdfs dfs -ls /input
```

---

### Step 4: Compile Java Files

```bash
javac -classpath `hadoop classpath` *.java
jar cf WasteDriver.jar *.class
```

---

### Step 5: Run MapReduce Job

```bash
hadoop jar WasteDriver.jar WasteDriver /input /output
```

---

### Step 6: View Output

```bash
hdfs dfs -cat /output/part-r-00000
```

---

## 📊 MapReduce Analytics

### 1. Overflow Event Detection

The system identifies garbage bins whose fill level exceeds 90%.

### 2. High-Risk Zone Analysis

Overflow incidents are grouped by zone to identify locations requiring immediate attention.

### 3. Average Fill Level Analysis

Daily waste fill levels are analyzed to understand waste generation patterns.

---

## 🐝 Hive Implementation

### Create Database

```sql
CREATE DATABASE smart_waste;
USE smart_waste;
```

### Create Table

```sql
CREATE TABLE waste_data (
    Bin_ID STRING,
    Zone STRING,
    Timestamp STRING,
    Waste_Type STRING,
    Fill_Level_Percent INT,
    Collection_Status STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;
```

### Load Dataset

```sql
LOAD DATA INPATH '/input/waste_data.csv'
INTO TABLE waste_data;
```

---

## 📊 Hive Queries Implemented

### Query 1 – Waste Type Distribution Analysis

```sql
SELECT Waste_Type,
       COUNT(*) AS total_entries,
       AVG(Fill_Level_Percent) AS avg_fill_percentage
FROM waste_data
GROUP BY Waste_Type
ORDER BY avg_fill_percentage DESC;
```

### Query 2 – Daily Waste Trend Analysis

```sql
SELECT SUBSTR(Timestamp,1,10) AS waste_date,
       COUNT(*) AS total_entries
FROM waste_data
GROUP BY SUBSTR(Timestamp,1,10)
ORDER BY waste_date;
```

### Query 3 – Date-wise Report Analysis

```sql
SELECT TO_DATE(Timestamp) AS report_date,
       COUNT(*) AS total_records
FROM waste_data
GROUP BY TO_DATE(Timestamp)
ORDER BY report_date;
```

### Query 4 – High Risk Overflow Zone Analysis

```sql
SELECT Zone,
       Waste_Type,
       COUNT(*) AS overflow_count
FROM waste_data
WHERE Fill_Level_Percent > 90
GROUP BY Zone, Waste_Type
ORDER BY overflow_count DESC;
```

---

## 📈 Expected Results

The analytics pipeline successfully generates:

* Waste type distribution reports
* Daily waste generation trends
* Date-wise waste analysis
* Overflow incident reports
* High-risk zone detection
* Data-driven waste collection insights

---

## ✅ Project Outcomes

This project demonstrates:

* Hadoop ecosystem setup and configuration
* HDFS-based distributed storage
* MapReduce-based data processing
* Hive-based analytical querying
* Waste pattern identification
* Overflow zone detection
* Smart city waste management analytics

The generated insights can assist municipal authorities in improving operational efficiency, reducing overflowing bins, and optimizing waste collection schedules.

---

## 📚 Learning Outcomes

Through this project, the following concepts were implemented and understood:

* Hadoop Architecture
* HDFS Operations
* MapReduce Programming
* Hive Query Language (HQL)
* Big Data Analytics
* Distributed Data Processing
* Smart City Data Applications

---

## 👩‍💻 Author

**Shaik Saara Kauser**
B.Tech – Artificial Intelligence & Machine Learning
Smart Waste Management Analytics Project
