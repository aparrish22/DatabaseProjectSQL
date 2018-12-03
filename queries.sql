/*
rserve > all reserve dates
&&
resere < checkout dates

checkout date < checkout in table
&&
checkout date > reserve dates
*/
query1 = SELECT reserve_date FROM Reservation 
query2 = SELECT check_out_date FROM Reservation
SELECT * FROM Reservation WHERE query1 > reserve_date 
	AND reserve_date < check_out_date 
	AND check_out_date > reserve_date 
	AND query2 < check_out_date;
