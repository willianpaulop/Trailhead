/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
	private class TestAccountDeletion {
	 
	    @isTest static void TestDeleteAccountWithOneOpportunity() {
	        // Test data setup
	        // Create an account with an opportunity, and then try to delete it
	        Account acct = new Account(Name='Test Account');
	        insert acct;
	        Opportunity opp = new Opportunity(Name=acct.Name + ' Opportunity',
	                                       StageName='Prospecting',
	                                       CloseDate=System.today().addMonths(1),
	                                       AccountId=acct.Id);
	        insert opp;
	         
	        // Perform test
	        Test.startTest();
	        Database.DeleteResult result = Database.delete(acct, false);
	        Test.stopTest();
	 
	        // Verify
	        // In this case the deletion should have been stopped by the trigger,
	        // so verify that we got back an error.
	        System.assert(!result.isSuccess());
	        System.assert(result.getErrors().size() > 0);
	        System.assertEquals('Cannot delete account with related opportunities.',
	                             result.getErrors()[0].getMessage());
	    }
	}