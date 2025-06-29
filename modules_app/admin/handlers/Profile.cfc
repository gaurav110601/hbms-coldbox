/**
 * The main module handler
 */

 component extends="Base"{

    property name="ProfileService" inject="ProfileService@admin";
	
    
	/**
	 * Module EntryPoint
	 */
	function index( event, rc, prc ){
		relocate( "admin:home.index" );
	}
	
	
	/**
	 * Profile
	 */
	function profile( event, rc, prc ){
		prc.pageTitle="My Account";
		prc.profileData = variables.ProfileService.profile( prc.adminID );
        event.setView( "profile/profile" );
	}
	
	/**
	 * Profile Update
	 */
	function profileUpdate( event, rc, prc ){
		if(trim(rc.name) EQ "" OR trim(rc.email) EQ "" OR trim(rc.mobileNumber) EQ ""){
			variables.messagebox.error( "All Fields Required!!" );
			relocate(  "admin:profile.profile" );
		}

		var result = variables.ProfileService.profileUpdate( rc );
		if( result.success EQ true){
			variables.messagebox.success( result.message );
		}else{
			variables.messagebox.error( result.message );
		}
		relocate(  "admin:profile.profile" );
	}
	
	/**
	 * Change Password
	 */
	function changePassword( event, rc, prc ){
		prc.pageTitle="Change Password";
        event.setView( "profile/changePassword" );
	
	}
	function passwordUpdate( event, rc, prc ){
		if(trim(rc.oldPassword) EQ "" OR trim(rc.newPassword) EQ "" OR trim(rc.confirmPassword) EQ ""){
			variables.messagebox.error( "All Fields Required!!" );
			relocate(  "admin:profile.changePassword" );
		}

		var passwordUpdated = variables.ProfileService.passwordUpdate( rc );
		/* writeDump(rc);abort; */
		if( passwordUpdated.success EQ true){
			variables.messagebox.success( passwordUpdated.message );
		}else{
			variables.messagebox.error( passwordUpdated.message );
		}
		relocate(  "admin:profile.changePassword" );
	}
	
	

}
