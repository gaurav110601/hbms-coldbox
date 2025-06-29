/**
 * The main module handler
 */

 component extends="Base"{

	property name="searchService" inject="searchService@admin";
    

	/**
	 * Module EntryPoint
	 */
	function index( event, rc, prc ){
		relocate( "admin:home.index" );
	}

    /**
	 * Search Enquiry
	 */
	function searchEnquiry( event, rc, prc ){
		prc.pageTitle="Search Enquiry";
		prc.tableSearch="";
		if(structKeyExists(rc, "tableSearch")){
			prc.tableSearch = rc.tableSearch;
		}
		prc.searchEnquiryData = variables.searchService.searchEnquiry( prc.tableSearch);
		event.setView( "search/searchEnquiry" );
	}
	
	/**
	 * Search Booking
	 */
	function searchBooking( event, rc, prc ){
		prc.pageTitle="Search Booking";
		prc.tableSearch="";
		if(structKeyExists(rc, "tableSearch")){
			prc.tableSearch = rc.tableSearch;
		}
		prc.searchBookingData = variables.searchService.searchBooking( prc.tableSearch);
		event.setView( "search/searchBooking" );
	}

}
