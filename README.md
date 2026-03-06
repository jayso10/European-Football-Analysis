# Project Title: European Football Performance Analysis & Tableau Dashboard

A data analysis project exploring performance trends across European football leagues.  
The project analyzes match results, goals, and team performance across multiple seasons to uncover scoring trends, league competitiveness, and long-term team dominance.

The dataset was processed using **SQL** and visualized through an **interactive Tableau dashboard** to present key insights in a clear and user-friendly format.

[Live Dashboard](https://public.tableau.com/views/FootballViz_17503919933510/Football?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

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

## Overview

- **Motivation:**  
Football produces large volumes of statistical data, making it ideal for practicing data analysis and visualization. I chose this dataset to explore how match results and scoring trends vary across leagues, seasons, and teams.

- **Objective:**  
The goal of this project was to analyze European football data to answer key questions such as:
  - Which leagues produce the most goals?
  - How have scoring patterns changed across seasons?
  - Which teams dominate their leagues over time?
  - What is the average number of goals scored per match?

- **Learning Outcomes:**  
  - Developed SQL skills for data cleaning, joins, and view creation  
  - Learned how to structure relational datasets for analysis  
  - Built interactive dashboards using Tableau  
  - Practiced transforming raw sports data into meaningful business-style insights  

---

## Dataset

Provide details about the dataset used:

- **Source of the dataset:**  
  https://www.kaggle.com/datasets/hugomathien/soccer

- **Size of the dataset:**  
  - 25,979 matches  
  - 70,287 goals  
  - 11 leagues  
  - 296 teams  
  - 8 seasons (2008–2016)

- **Key features/columns used:**  
  - Country  
  - League name  
  - Team names  
  - Match results (home and away goals)  
  - Match dates  
  - Season information

- **Preprocessing / Cleaning Steps:**  
  - Joined multiple relational tables (countries, leagues, teams, matches)  
  - Removed duplicate records using SQL window functions  
  - Validated foreign key relationships  
  - Checked for null values and inconsistencies  
  - Created a reusable SQL view (`joined_matches`) for analysis

---

<h2>Technologies Used</h2>

<ul>
  <li><strong>Languages & Libraries:</strong> SQL (MySQL)</li>
  <li><strong>Tools:</strong> Excel, VS Code, Git, GitHub</li>
  <li><strong>Data Visualization:</strong> Tableau Public</li>
</ul>

<p>
  <img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL">
  <img src="https://img.shields.io/badge/Tableau-E97627?style=for-the-badge&logo=tableau&logoColor=white" alt="Tableau">
  <img src="https://img.shields.io/badge/Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white" alt="Excel">
</p>

---

## Installation

Step-by-step instructions to set up the project locally:

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git

# Navigate to the project folder
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
