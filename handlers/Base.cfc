component{

    property name="loginService" inject="loginService";
    property name="frontService" inject="frontService";
    property name="messagebox" inject="messagebox@cbmessagebox";
	property name="sessionStorage" inject="sessionStorage@cbstorages";


    function preHandler( event, rc, prc ){
        prc.aboutData = variables.frontService.about();
        prc.contactData = variables.frontService.contact();
        prc.categoryData = variables.frontService.category();

		if( variables.sessionStorage.exists("userID") ){
			prc.userID = variables.sessionStorage.get("userID");
            prc.userName = variables.sessionStorage.get("userName");
		} else{
			variables.messagebox.error( "No Access, Please Sign in first!!" );
			relocate( "main.signin" );
		} 

    } 
}