@IsTest
public class InvocableCollectionSlicerTest {
    public static testMethod void SliceRecords(){
        List<Contact> ListContacts = new List<Contact>();
        Contact con1 = new Contact(FirstName='Joe',LastName='Smith',Phone='415.555.1212', Email='example1234@sample.com');
        Contact con2 = new Contact(FirstName='Barry',LastName='Hallen',Phone='425.111.1234', Email='example12345@sample.com');
        Contact con3 = new Contact(FirstName='Budi',LastName='Rahman',Phone='222.111.1234', Email='example123456@sample.com');
        ListContacts.add(con1);
        ListContacts.add(con2);
        ListContacts.add(con3);
        
        Test.startTest();
        List<InvocableCollectionSlicer.Request> listRequest =new List<InvocableCollectionSlicer.Request>();
    	InvocableCollectionSlicer.Request req = new InvocableCollectionSlicer.Request();
        req.CollectionOfRecords = ListContacts;
        req.SliceFrom = 1;
        req.SliceTo = 3;
        listRequest.add(req);
        List<InvocableCollectionSlicer.Response> listResult = InvocableCollectionSlicer.Invoke(listRequest);  
        Test.stopTest();
        
        //should return record between con1 and con3
        System.assertEquals(con2, listResult[0].CollectionOfRecordsSliced[0]);
    }

}
