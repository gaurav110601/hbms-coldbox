component{

    property name="messagebox" inject="messagebox@cbmessagebox";
	property name="sessionStorage" inject="sessionStorage@cbstorages";


    function preHandler( event, rc, prc ){
        prc.adminID = 0; 
        prc.sn=1;
		if( variables.sessionStorage.exists("adminID") ){
			prc.adminID = variables.sessionStorage.get("adminID");
            prc.adminName = variables.sessionStorage.get("adminName");
		}else{            
			variables.messagebox.error( "No Access" );
			relocate( "admin:login.index" );
		}
		
    } 
}