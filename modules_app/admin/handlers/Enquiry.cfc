/**
 * The main module handler
 */

 component extends="Base"{

	property name="enquiryService" inject="enquiryService@admin";
    

	/**
	 * Module EntryPoint
	 */
	function index( event, rc, prc ){
        relocate( "admin:home.index" );
	}

	
	
	/**
	 * Enquiry
	 */
	function readEnquiry( event, rc, prc ){
		prc.pageTitle="Read Enquiry";
		prc.enquiryData = variables.enquiryService.enquiry();
		prc.readEnquiryData = prc.enquiryData.readEnquiry;
		event.setView( "enquiry/readEnquiry" );
	}
	function unreadEnquiry( event, rc, prc ){
		prc.pageTitle="Unread Enquiry";
		prc.enquiryData = variables.enquiryService.enquiry();
		prc.unreadEnquiryData = prc.enquiryData.unreadEnquiry;
		event.setView( "enquiry/unreadEnquiry" );
	}
	function viewEnquiry( event, rc, prc ){
		prc.pageTitle="View Enquiry";
		prc.enquiryData = variables.enquiryService.viewEnquiry(rc.id);
		event.setView( "enquiry/viewEnquiry" );
	}

}
