-- creating a database
create database labo;
use labo;

select * from `company_transactions_2022`;

-- total row 
select count(*) from`company_transactions_2022`;

-- total company
select count(distinct(company_name)) as total_company from `company_transactions_2022`;

-- total income of each company
select company_name, sum(income_transaction) as total_transaction from `company_transactions_2022`
group by company_name order by total_transaction desc ;

-- total outcome of each company 
select company_name,sum(outcome_transaction) as total_outcome_transaction from `company_transactions_2022`
group by company_name order by total_outcome_transaction desc;

-- total income and outcome transaction by month of each company
select monthname(date) as month_name,company_name,sum(income_transaction) as total_income_transaction,
sum(outcome_transaction) as total_outcome_transaction from `company_transactions_2022`
group by month_name,company_name
having month_name='july'
order by total_income_transaction desc;

-- most income description
select income_description, count(income_description) as total_income_description from `company_transactions_2022`
group by  income_description;

-- most outcome description
select outcome_description,count(outcome_description) as total_outcome_description from `company_transactions_2022`
group by outcome_description;

-- tax 20% if income >=800000
select company_name,sum(income_transaction) as total_income,
                   case 
                        when sum(income_transaction) >=800000
                        then sum(income_transaction) * 0.20
                        else 0
				end as tax_fee
	from `company_transactions_2022`
    group by company_name;
