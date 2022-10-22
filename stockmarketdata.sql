

use stockmarketdata;
select * from stockfinancials;

/*1. no of sectors */
select distinct sector from stockfinancials order by sector;


/*2. sectorwise most expensive stocks*/
select sector, name, max(price) as stock_price
from stockfinancials
group by sector
order by max(price) desc;

/*3.average priceperearnings sectorwise*/
select sector, round(avg(priceperearnings),2) as AvgPricePerEarnings from stockfinancials group by sector;
 

/*4. ValuePerspective based on P/E */
select  sector, name, price, priceperearnings, 	
(case when priceperearnings < 15.00 then "cheap" when priceperearnings between 15.00 and 18.00 then "neither expensive nor cheap" else "expensive" end) as ValuePerspective
from stockfinancials
order by sector, priceperearnings desc;

/*5. DividendYeild Analysis*/
select sector, name, price, dividendyield, 
(case when dividendyield between 2.00 and 4.00 then "Above Average" when dividendyield > 4.00 then "Best Yeilding" else "Poor" end) as ValuePerspective
from stockfinancials
order by sector, dividendyield desc;	

/*6. Companies with negative net income*/
select  sector, name, earningspershare
from stockfinancials
where earningspershare < 0.00
order by sector, earningspershare;

/*7.Industries to look at while buying*/
select  name, sector, pricetosales 
from stockfinancials
where pricetosales < 1
order by pricetosales;

/*8. which companies has more assets over liabilities*/
select sector, name, pricetobook,
if(pricetobook<1.00,"undervalued","overvalued") as ValuationPerspective
from stockfinancials
order by sector, pricetobook;






