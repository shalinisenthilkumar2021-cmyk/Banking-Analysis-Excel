select IsActiveMember,count(*) as total_customers from customers group by IsActiveMember;

select * from customers;

select * from customers where Age = 40 and Gender="Male"; 

select CreditScore,Geography,Gender,Age,Tenure,Balance,Exited,Complain,
case 
   when Geography="Germany" then Gender="Male"
   when Geography="France" then  Gender="Male"
   when Geography="Spain" then Gender="Male"
   end as geocredit from customers;

select CreditScore,Geography,Gender,Age,Tenure,Balance,Exited,Complain,
case 
   when Geography="Germany" then CreditScore=400 and CreditScore=600
   when Geography="France" then  CreditScore=500 and CreditScore=800
   when Geography="Spain" then CreditScore=500 and CreditScore=900
   end as geocredit from customers;  

select `Card Type`,count(*) as total_customers from customers group by `Card Type`;

select Geography,Balance from customers order by Balance desc limit 10;

select round(avg(`Satisfaction Score`),2) as avg_satisfaction from customers;

select round(avg(amt),2) as avg_transaction from transactions;

select (sum(amt)) as avg_transaction from transactions; 

select round(sum(is_fraud)*100.0/count(*),2) as fraud_rate from transactions;

select merchant,round(sum(amt),2) AS revenue 
   from transactions group by merchant order by revenue desc limit 10;

select state,round(sum(amt),2) AS revenue
    from transactions group by state order by revenue desc;

select category,count(*) as fraud_count from transactions 
    where is_fraud = 1 group by category order by fraud_count desc; 

select gender,round(sum(amt),2) as total_spending from transactions group by gender;

select count(*) as total_loans from loan;   

  show tables;
select round(avg(LoanAmount),2) as avg_loan_amount from loan; 

select Loan_Status,count(*) as total_loans from loan group by Loan_Status; 

select Property_Area,count(*) as total_loans from loan group by Property_Area;

select Education,round(avg(LoanAmount),2) as avg_loan from loan group by Education;

select Credit_History,count(*) as total_customers from loan group by Credit_History;

select Self_Employed,count(*) as total_loans from loan group by Self_Employed;  

select Married,round(avg(LoanAmount),2) as avg_loan from loan group by Married; 

select *   from branches;   

select city,count(*) as total_branches from branches group by city;

select Geography,Balance,
    rank() over(order by Balance desc) as ranking from customers limit 5;

select category,sum(amt) as revenue,rank() 
    over(order by sum(amt) desc) as ranking from transactions group by category; 

select
case
       when Balance < 50000 then 'Low'
       when Balance < 150000 then 'Medium'
       else 'High'
       end as segment,count(*) as customers from customers group by segment;  
