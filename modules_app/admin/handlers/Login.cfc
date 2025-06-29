/**
 * The main module handler
 */

 component extends=""{
	property name="loginService" inject="loginService@admin";
    property name="messagebox" inject="messagebox@cbmessagebox";
	property name="sessionStorage" inject="sessionStorage@cbstorages";

	/**
	* Login
	*/
	function index( event, rc, prc ){
		event.setLayout( "Login" );
        event.setView( "login/index" );
	}
	
	/**
	* doLogin
	*/
	function doLogin( event, rc, prc ){
		if(trim(rc.email) EQ "" OR trim(rc.password) EQ ""){
			variables.messagebox.error( "All Fields Required!!" );
		}
	   var result = variables.loginService.doLogin( rc.email, rc.password);
	
	   if( result.success EQ true){
		   variables.sessionStorage.set("adminID", result.adminID );
		   variables.sessionStorage.set("adminName", result.adminName );
		   variables.messagebox.success( result.message );
		   relocate(  "admin:home.index" );
	   }else{
		   variables.messagebox.error( result.message );
		   
	   }
       relocate(  "admin:login.index" );
	}
	
	
	
	
	
	
	/**
	 * Logout
	 */
	function logout( event, rc, prc ){
		variables.sessionStorage.delete("adminID");
		variables.sessionStorage.delete("adminName");
		variables.messagebox.success( "Log Out Successfull!" );
		relocate(  "admin:login.index" );
	}

}
