	/* DIALYSIS - 1 */
    
    create table Dialysis_1(
    Provider_id int,
	Network int,
    Facility_Name varchar(120),
	Five_Star int,
    Address_Line varchar(200),
    City varchar(120),
	State varchar(120),
    Zip	int,
    County varchar(120),
    Profit_or_NonProfit varchar(120),	
    Chain_Owned	varchar(120),
    Chain_Organization varchar(120),
    Late_Shift int,
    No_of_Dialysis_Stations	int,
    Offers_incenter_hemodialysis int,	
    Offers_peritoneal_dialysis int,
    Offers_hemodialysis_training int,
	`% of Medicare patients with Hgb<10 g/dL` int,
    `% of Medicare patients with Hgb>12 g/dL` int,
    No_of_Dialysis_Patients_with_Hgb_data int,
    Patient_Transfusion_category varchar(120),
    No_of_patients_in_transfusion_summary int,	
    `% of Adult HD patients with Kt/V >= 1.2` int,	
    `% of Adult PD PTS with Kt/V >= 1.7` int,	
    `% of Pediatric HD patients with Kt/V >= 1.2` int,	
	`# of adult HD patients with KT/V data` int,	
    `# of adult HD patient-months with Kt/V data` int,	
    `# of adult PD patients with KT/V data`	int,
    `# of adult PD patient-months with Kt/V data` int,
    `# of pediatric HD patients with Kt/V data`	int,
    `# of pediatric HD patient-months with KT/V data` int,	
    No_of_patients_in_hypercalcemia_summary	int,
    No_of_patient_months_in_hypercalcemia_summary int,
    `% of Adult patients with serum calcium > 10.2 mg/dL` int,	
    No_of_patients_in_Serum_phosphorus_summary int,
    No_of_patient_months_in_Serum_phosphorus_summary int, 	
    `% of Adult patients with serum phosphorus less than 3.5 mg/dL`	int,
    `% of Adult patients with serum phosphorus between 3.5-4.5 mg/dL` int,	
    `% of Adult patients with serum phosphorus between 4.6-5.5 mg/dL` int,
    `% of Adult patients with serum phosphorus between 5.6-7.0 mg/dL` int,	
    `% of Adult patients with serum phosphorus > 7.0 mg/dL` int,
    Patient_hospitalization_category varchar(120),
    Patient_Hospital_Readmission_Category varchar(120),
   	Patient_Survival_Category varchar(120),
	No_of_patients_in_hospitalization int,
    No_of_hospitalizations_included_in_hospital_readmission int,
    No_of_Patients_included_in_survival_summary int,	
    Mortality_Rate_Facility int,
    `Mortality Rate: Upper Confidence Limit (97.5%)` int,
    `Mortality Rate: Lower Confidence Limit (2.5%)` int,	
    Readmission_Rate_Facility int,
    `Readmission Rate: Upper Confidence Limit (97.5%)` int,
    `Readmission Rate: Lower Confidence Limit (2.5%)` int,
    Hospitalization_Rate_Facility int,
    `Hospitalization Rate: Upper Confidence Limit (97.5%)` int,	
    `Hospitalization Rate: Lower Confidence Limit (2.5%)` int,	
    `# of pediatric PD patients with Kt/V data` int,
	`# of pediatric PD patient-months with KT/V data` int,	
    `% of pediatric PD patients with Kt/V>=1.8` int,	
	Patient_Infection_category varchar(120),
	Standard_Infection_Ratio decimal,
    `SIR: Upper Confidence Limit (97.5%)` decimal,
    `SIR: Lower Confidence Limit (2.5%)` decimal,	
    Transfusion_Rate_Facility decimal,
    `Transfusion Rate: Upper Confidence Limit (97.5%)` decimal,
    `Transfusion Rate: Lower Confidence Limit (2.5%)` decimal,
	Fistula_Category varchar(120),
    No_of_Patients_in_fistula int,
    Fistula_Rate_Facility int,
    `Fistula Rate: Upper Confidence Limit (97.5%)` int,	
    `Fistula Rate: Lower Confidence Limit (2.5%)` int,	
     No_of_patients_in_long_term_catheter int,
    No_of_patient_months_in_long_term_catheter int,
	Percent_of_Adult_patients_with_long_term_catheter_in_use int,	
    No_of_patients_in_nPCR_summary int,
    No_of_patient_months_in_nPCR_summary int,
	SWR_category varchar(120),
	`95% C.I. (upper limit) for SWR` decimal,
    `95% C.I. (lower limit) for SWR` decimal,
    No_of_patients_in_facility_for_SWR int,
    Standardized_First_Kidney_Transplant_Waitlist_Ratio	decimal,
    PPPW_category varchar(120),
	`95% C.I. (upper limit) for PPPW` decimal,
    `95% C.I. (lower limit) for PPPW` decimal,	
    No_of_patients_for_PPPW	int,
    Percent_of_Prevalent_Patients_Waitlisted decimal);
    drop table dialysis_1;
    load data infile "Dialysis_1_SQL.csv" into table dialysis_1
    fields terminated by ','
    ignore 1 lines
    SET 
    `% of Adult PD PTS with Kt/V >= 1.7` = NULLIF(`% of Adult PD PTS with Kt/V >= 1.7`,' '),
    `% of Adult HD patients with Kt/V >= 1.2` = nullif(`% of Adult HD patients with Kt/V >= 1.2`,' ')
    ;




	/* DIALYSIS - 2 */
    
create table dialysis_2( 
Facility_Name varchar(120),
Address varchar(120),
City varchar(120),
State varchar(120),
Zip_Code int,
Network int,
PY2020_Payment_Reduction_Percentage decimal,
Ownership_as_of_December_31_2018 varchar(120),
Total_Performance_Score int,
Ultrafiltration_Measure_Score int,
Pain_Assessment_and_Followup_Measure_Score int,
VAT_Catheter_Measure_Score int,
VAT_Catheter_Measure_Score_Applied varchar(120),
VAT_Fistula_Measure_Score int,
VAT_Fistula_Measure_Score_Applied varchar(120),
`Kt/V Comprehensive Measure Score` int,
Hypercalcemia_Measure_Score int,
Hypercalcemia_Measure_Score_Applied varchar(120)
);
 
 load data infile "Dialysis_2_SQL.csv" into table dialysis_2
 fields terminated by ','
 ignore 1 lines;






-- KPI'S

-- Patiensts in Different Summaries
CREATE VIEW Patients_Summaries AS 
select
	sum(No_of_patients_in_transfusion_summary) as Patients_in_Transfusion,
    sum(No_of_patients_in_hypercalcemia_summary) as Patients_in_Hypercalcemia,
    sum(No_of_patients_in_Serum_phosphorus_summary) as Patients_in_Serum_Phosphorus,
    sum(No_of_patients_in_hospitalization) as Patients_in_hospitalization,
    sum(No_of_Patients_included_in_survival_summary) as Patients_in_survival,
    sum(No_of_Patients_in_fistula) as Patients_in_fistula,
    sum(No_of_patients_in_long_term_catheter) as Patients_in_long_term_catheter,
    sum(No_of_patients_in_nPCR_summary) as Patients_in_nPCR_summary
    from dialysis_1;
    
-- Profit vs Non-Profit Stats

 -- 1) % of Organizations with Profit and Non-Profit
	CREATE VIEW Organizations_Profit_Non_Profit AS
		select profit_or_nonprofit, concat(round(count(*)/(select count(*) from dialysis_1)*100,0),'%') as Percentage_Distribution
	    from dialysis_1 
        group by Profit_or_NonProfit
        ;
        
-- 2) Profit and Night Shift Stats
CREATE VIEW Profit_Night_shift_Stats as
	 select Profit_or_NonProfit,
     case when Late_shift = 1 
     then "Yes"
     else "No"
     end as Late_Shift
     , concat(round(count(*)/(select count(*) from dialysis_1)*100,0),"%") as Facilities  
	 from dialysis_1 group by Profit_or_NonProfit, Late_Shift
     having Facilities <> "0%";

-- 3) State Wise Profit and Non-Profit Facilities
CREATE VIEW State_Profit_nonProfit AS
	select State,profit_or_nonProfit,count(profit_or_NonProfit) No_of_Facilities
    from dialysis_1 
    group by state,Profit_or_NonProfit
    order by State desc,No_of_Facilities desc ;
    
-- Chain Organization w.r.t. Total Performance Score as No Score
CREATE VIEW Chain_Organization_No_Score AS 
	select d1.chain_organization,count(d2.total_performance_score) as Count_of_No_Score 
    from dialysis_1 d1
	inner join dialysis_2 d2 on d1.Facility_Name=d2.Facility_Name
    where d2.total_performance_score = 101
    group by d1.chain_organization
    order by Count_of_No_Score desc;
    
-- Dialysis Station Stats

-- 1) Top 10 Facilities by Number of Dialysis Stations
CREATE VIEW Top_10_Facilities_by_Dialysis_Stations AS 
	  select facility_name ,No_of_Dialysis_Stations
      from dialysis_1
      order by No_of_Dialysis_Stations desc
      limit 10;
      
-- # of Category Text - As Expected
CREATE VIEW Category_text_expected AS 
    select "Patient_Transfusion_category",count(Patient_Transfusion_category) as No_of_Categories_As_Expected
    from dialysis_1 
    where Patient_Transfusion_category="As Expected"
    union
    select "Patient_hospitalization_category", count(Patient_hospitalization_category) 
    from dialysis_1
    where Patient_hospitalization_category="As Expected"
    union
    select "Patient_Hospital_Readmission_Category", count(Patient_Hospital_Readmission_Category) 
    from dialysis_1
    where Patient_Hospital_Readmission_Category="As Expected"
    union
    select "Patient_Survival_Category", count(Patient_Survival_Category) 
    from dialysis_1
    where Patient_Survival_Category="As Expected"
    ;
    
-- Average Payment Reduction Rate
	
    create view Avg_Payment_reduction_rate 
		as select concat(round(avg(PY2020_Payment_Reduction_Percentage),2),"%") as Avg_Payment_Reduction_rate
		from dialysis_2;

-- VIEWS

SELECT * FROM Patients_Summaries;
SELECT * FROM Organizations_Profit_Non_Profit;
select * from Profit_Night_shift_Stats;
select * from State_Profit_nonProfit;
select * from Chain_Organization_No_Score;
select * from Top_10_Facilities_by_Dialysis_Stations;
select * from Category_text_expected;
select * from avg_payment_reduction_rate;

      

