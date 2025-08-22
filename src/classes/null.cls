public class Something {
	public static void main( String as[] ) {
		Contact[] lst = [ SELECT Id, Name FROM Contact WHERE CustomField__c = null; ];  //Bad: this is not recommended.
	}
}

    