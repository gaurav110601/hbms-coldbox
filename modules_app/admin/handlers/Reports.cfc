/**
 * The main module handler
 */

 component extends="Base"{

	property name="reportService" inject="reportService@admin";
    

	/**
	 * Module EntryPoint
	 */
	function index( event, rc, prc ){
        relocate( "admin:home.index" );
	}

	/**
	 * Report Enquiry
	 */
	function reportEnquiry( event, rc, prc ){
		prc.pageTitle="Report Enquiry";
		event.setView( "reports/reportEnquiry" );
	}
	function enquiryReport( event, rc, prc ){
		prc.pageTitle="Enquiry Enquiry";
		if(rc.fromDate > rc.toDate){
			variables.cbmessagebox().error("please enter valid date");
			relocate( "admin:reports.reportEnquiry" );
		}
		prc.enquiryReportData = variables.reportService.enquiryReport(rc);
		event.setView( "reports/enquiryReport" );
	}
    function viewEnquiryReport( event, rc, prc ){
		prc.pageTitle="View Enquiry";
		prc.enquiryData = variables.reportService.viewEnquiry(rc.id);
		event.setView( "reports/viewEnquiryReport" );
	}
	
	/**
	 * Report Booking
	 */
	function reportBooking( event, rc, prc ){
		prc.pageTitle="Report Booking";
		event.setView( "reports/reportBooking" );
	}
	function bookingReport( event, rc, prc ){
		prc.pageTitle="Enquiry Enquiry";
		if(rc.fromDate > rc.toDate){
			variables.cbmessagebox().error("please enter valid date");
			relocate( "admin:reports.reportBooking" );
		}
		prc.bookingReportData = variables.reportService.bookingReport(rc);
		event.setView( "reports/bookingReport" );
	}



}
