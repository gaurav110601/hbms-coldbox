/**
 * I am a new Model Object
 */
component accessors="true"{

	// Properties
	property name="id" type="numeric";
	property name="BCrypt" inject="BCrypt@BCrypt";

	/**
	 * Constructor
	 */
	reportService function init(){
		
		return this;
	}

	/**
	 * Verify if the model has been loaded from the database
	 */
	function isLoaded(){
		return ( !isNull( variables.id ) && len( variables.id ) );
	}
    
	
	/**
	 * Booking Report
	 */
	public query function bookingReport( required struct formData ){
		var loc = {};
		loc.q = new query();
		loc.q.addParam(name="fromDate",value=arguments.formData.fromDate,CFSQLTYPE="cf_sql_date");
		loc.q.addParam(name="toDate",value=arguments.formData.toDate,CFSQLTYPE="cf_sql_date");

		/* Report Booking */
		loc.sql = 'SELECT * FROM booking WHERE bookingDate BETWEEN :fromDate AND :toDate ORDER BY bookingNumber DESC';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
		loc.bookingReport = loc.result;

		return loc.bookingReport;
	}

    /**
	 * Enquiry Report
	 */
	public query function enquiryReport( required struct formData ){
		var loc = {};
		loc.q = new query();
		loc.q.addParam(name="fromDate",value=arguments.formData.fromDate,CFSQLTYPE="cf_sql_date");
		loc.q.addParam(name="toDate",value=arguments.formData.toDate,CFSQLTYPE="cf_sql_date");

		/* Report Enquiry */
		loc.sql = 'SELECT * FROM enquiry WHERE date BETWEEN :fromDate AND :toDate ORDER BY id DESC';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
		loc.enquiryReport = loc.result;

		return loc.enquiryReport;
	}
	public query function viewEnquiry(required numeric id){
		var loc = {};
		loc.enquiryData = {};
		loc.q = new query();
		loc.q.addParam(name="id",value=arguments.id,CFSQLTYPE="cf_sql_integer");

		/* View Enquiry */
		loc.sql = 'SELECT * FROM enquiry WHERE id=:id';
		loc.q .setSQL(loc.sql);
		loc.result = loc.q.execute().getResult();
		if(loc.result.status EQ 0){
			loc.sql = 'UPDATE enquiry SET status=1 WHERE id=:id';
			loc.q.setSQL(loc.sql);
			loc.rs = loc.q.execute();
		}
		loc.enquiryData.readEnquiry = loc.result;

		return loc.enquiryData.readEnquiry;
	}
	
}