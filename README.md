# Pewlett-Hackard-Analysis

## Overview of the analysis: Explain the purpose of this analysis.

For this exercise, I worked for a company named Pewlett Hackard (a play on Hewlett Packard). The company is anticipating many current employees are going to retire soon as many employees are aging close to retirement age (an event nicknamed the 'silver tsunami'). In this scenario, it is important that management and company leadership prepare the best they can so there are no staff shortages and the company can continue to operate as usual when this event occurs. In order to help prepare the business, I used SQL and PGAdmin to merge multiple large datasets in order to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. 

As the following ERD shows, we started out with multiple different csv files with different sorts of data related to employees, their departments, when they started, their date of birth, their titles, and their past roles etc. 

![EmployeeDB](https://user-images.githubusercontent.com/80979705/123572237-d812a200-d799-11eb-88d7-f4ac414dae74.png)

It was messy. So the first task is to merge them using primary and foreign keys.

## Results: Provide a bulleted list with four major points from the two analysis deliverables. 

For the first deliverable, I first merged the info in the employees and titles databases in order to create a retirement_titles database:  

<img width="377" alt="Challenge7RetirementTitles" src="https://user-images.githubusercontent.com/80979705/123572655-8fa7b400-d79a-11eb-8e6e-4602d36ff025.png">

This list was pretty good. But the one issue is there are duplicate entries for some employees because they have switched titles over the years (eg maybe someone got promoted etc). It would be most helpful to have only an employees current/most recent title so we can know with precision exactly where the staffing gaps might be once many employees start to retire as planned. So I then made a database named unique_titles with only the most recent title for each employee in order to avoid duplicate names:

<img width="282" alt="Challenge7UniqueTitles" src="https://user-images.githubusercontent.com/80979705/123572663-920a0e00-d79a-11eb-9398-f7f99d631d14.png">

Using this database, I was able to estimate/pinpoint the titles of all the employees who are reaching retiring age soon. This way the company can know where the gaps in staffing and management may be and they can start to fill them earlier/prepare for the transition earlier:

<img width="122" alt="Challenge7RetiringTitles" src="https://user-images.githubusercontent.com/80979705/123572680-97675880-d79a-11eb-80cb-0a0b9eadddff.PNG">

As you can see from the table above, only 2 managers are retiring- which is good news- but the company is going to have a large gap to fill as 64% (57,668) of employees retiring hold senior titles (Senior Engineers or Staff). Some good news is that the retiring positions are fairly evenly distributed between staff and engineer roles- which may create a bit less headache while managing the transition. Still, most retiring employees are in senior roles at the company.

For deliverable two, I then used this information and information provided earlier in the module coursework to see which employees may be eligible for the mentorship program. Mentorship programs can be a useful tool to help prepare younger and more junior employees, or new hires, for filling in for the key roles that will be empty once the wave of older employees retiring begins. The table is below:

<img width="418" alt="Challenge7MentorshipEligibilty" src="https://user-images.githubusercontent.com/80979705/123572687-99c9b280-d79a-11eb-9ded-91564db98a8f.PNG">

In conclusion:

- Most employees that are retiring hold senior positions at the company (64%).
- Retiring roles are fairly evenly distributed between staff and engineers.
- There are over 94,000 roles that will need to be filled in anticipation for the 'silver tsunami'.
- Only 1,549 employees are currenly eligible for the mentorship program.

## Summary: 

### How many roles will need to be filled as the "silver tsunami" begins to make an impact?

Many roles are going to need to be filled over the next ten years and the company should start preparing to hire and train many new employees to replace those retiring as soon as possible. Currently around 90,000 positions will have to be filled in the next few years in order for the companyu to continue operating as it currently is.

### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

No there are not enough qualified mentors to train new employees as there are currently 1,549 eligible mentors and around 90,000 new employees that need to be hired and trained. This is not a good ratio for efficient learning and the company needs to figure out a more efficient way to train more employees- perhaps using technologies for online classes or by bringing in additional industry experts on a temporary basis in order to help mentor and train all the necessary new hires. The company could also potentially experiment with lowering the standards needed to be a mentor in order to increase the size of the pool.

<img width="418" alt="Challenge7MentorshipEligibilty" src="https://user-images.githubusercontent.com/80979705/123572687-99c9b280-d79a-11eb-9ded-91564db98a8f.PNG">

<img width="122" alt="Challenge7RetiringTitles" src="https://user-images.githubusercontent.com/80979705/123572680-97675880-d79a-11eb-80cb-0a0b9eadddff.PNG">
