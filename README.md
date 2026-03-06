# Project Title: European Football Performance Analysis & Tableau Dashboard

This project explores performance trends across major European football leagues using match-level data. The analysis transforms raw relational data into meaningful insights about scoring patterns, team dominance, and league competitiveness.

Using **SQL for data transformation** and **Tableau for visualization**, the project analyzes nearly **26,000 matches across 8 seasons** to uncover trends in goals, wins, and league performance.  

🔗 **Live Dashboard:**  
https://public.tableau.com/views/FootballViz_17503919933510/Football?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link 

---

## Table of Contents

- [Overview](#overview)  
- [Dataset](#dataset)  
- [Technologies Used](#technologies-used)  
- [Installation](#installation)  
- [Usage](#usage)  
- [Analysis & Visualizations](#analysis--visualizations)  
- [Conclusion](#conclusion)  
- [Credits](#credits)  
- [License](#license)  

---


# Overview

### Motivation
Football generates large amounts of performance data, making it an ideal dataset for practicing **data analysis, SQL modeling, and business intelligence dashboards**. I chose this dataset to explore how data can reveal trends in team performance, scoring behavior, and league competitiveness.

### Objective
The goal of this project was to analyze European football data and answer questions such as:

- Which leagues produce the most goals?
- How have scoring patterns changed across seasons?
- Which teams dominate their leagues over time?
- What is the average number of goals per match?

### Learning Outcomes

Through this project I developed skills in:

- Designing relational database analysis workflows
- Writing SQL queries for joins, views, and aggregations
- Cleaning and validating large datasets
- Building interactive dashboards in Tableau
- Translating raw data into business-style KPIs and insights

---

# Dataset

### Source
European Soccer Database  
https://www.kaggle.com/datasets/hugomathien/soccer

### Dataset Overview

The dataset contains match-level data across several European leagues.

Key statistics:

- **25,979 matches**
- **70,287 goals**
- **11 leagues**
- **296 teams**
- **8 seasons (2008–2016)**

### Database Structure

The project used four main relational tables:

- **countries** – country information  
- **leagues** – league data  
- **teams** – team details  
- **matches** – match results and statistics  

### Data Processing

Data preparation was performed using **MySQL**, including:

- Joining tables to create a unified analytical dataset
- Removing duplicate records using window functions
- Validating foreign key relationships
- Handling null values and anomalies
- Creating a reusable SQL view called **`joined_matches`**

This consolidated dataset was then used for all Tableau analysis.

---

# Technologies Used

### Languages & Databases
- SQL (MySQL)

### Data Tools
- Excel
- Tableau Public

### Development Tools
- Git
- GitHub
- VS Code

### Data Visualization
- Tableau

---

# Installation

To explore the project locally:

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git

# Navigate into the project directory
cd YOUR_REPO

```

## Usage

1.	Open the Tableau dashboard using the provided Tableau Public link
	2.	Use the interactive filters to explore:
	•	Different seasons
	•	Leagues
	•	Teams
	3.	Review the key performance metrics including:
	•	Total matches played
	•	Total goals scored
	•	Average goals per match
	•	Team win counts

The dashboard allows users to explore football performance trends across multiple dimensions.

![Visualization Example](assets/images/screenshot.png)  

---

## Analysis & Visualizations

The dashboard highlights several key insights:

Scoring Trends
	•	The average number of goals per match across all leagues is approximately 2.7 goals per game
	•	Goal averages increased slightly over time, rising from around 2.6 goals in early seasons to approximately 2.75 in later seasons

League Performance
	•	England’s top division recorded the highest total goals scored (~8,240) among the analyzed leagues.

Team Dominance
	•	Several teams accumulated over 200 wins across the analyzed period, demonstrating long-term league dominance.

Competitive Differences
	•	Goal totals and match outcomes vary significantly between leagues, reflecting differences in playing styles and competitiveness.
  
---

## Conclusion

This project demonstrates how structured data analysis can transform raw sports data into meaningful insights.

Key takeaways:
	•	European leagues average around 2.7 goals per match
	•	Scoring trends have slightly increased across seasons
	•	Some teams consistently dominate over long periods
	•	League competitiveness varies significantly across countries

The dashboard provides an interactive way to explore these trends and supports data-driven analysis of football performance.

Future improvements could include:
	•	Player-level analysis
	•	Advanced metrics such as expected goals (xG)
	•	Predictive modeling for match outcomes

---

## Credits

Dataset Source
https://www.kaggle.com/datasets/hugomathien/soccer

Tools Used
	•	MySQL
	•	Tableau Public

References
	•	Tableau Documentation
	•	SQL Documentation

---

## License

This project is licensed under the [MIT License](https://choosealicense.com/licenses/mit/) – feel free to use and modify it.  

---

<p align="center"><strong>Thanks for visiting! 🚀</strong></p>
