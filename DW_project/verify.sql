\echo "Checking row in FactTable Table"
select count(*) from "FactTable";

\echo "Checking row in DimDateTime Table"
select count(*) from "DimDateTime";

\echo "Checking row in DimPassengerCount Table"
select count(*) from "DimPassengerCount";

\echo "Checking row in DimTripDistance Table"
select count(*) from "DimTripDistance";

\echo "Checking row in DimRateCode Table"
select count(*) from "DimRateCode";

\echo "Checking row in DimPickupLocation Table"
select count(*) from "DimPickupLocation";

\echo "Checking row in DimDropoffLocation Table"
select count(*) from "DimDropoffLocation";

\echo "Checking row in DimPaymentType Table"
select count(*) from "DimPaymentType";