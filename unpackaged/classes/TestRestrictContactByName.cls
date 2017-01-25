@isTest
	private class TestRestrictContactByName {
	 
	    @isTest static void TestInvalid() {
	       Contact cont = new Contact(FirstName='Teste', LastName='INVALIDNAME');
	        List<Contact> listaContatti = new List<Contact>();
	        listaContatti.add(cont);
	      	try{
                insert listaContatti;
            } catch(Exception ee){

            }
            listaContatti.get(0).LastName = 'test';
            try{
                update listaContatti;
            } catch(Exception ee){

            }
	    }

	    @isTest static void TestValid() {
	       Contact cont = new Contact(FirstName='Teste1', LastName='test1');
	        List<Contact> listaContatti = new List<Contact>();
	        listaContatti.add(cont);
	      	try{
                insert listaContatti;
            } catch(Exception ee){

            }
            listaContatti.get(0).LastName = 'INVALIDNAME';
            try{
                update listaContatti;
            } catch(Exception ee){

            }
	    }
	}