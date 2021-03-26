public class InvocableCollectionSlicer {
    public class Request {
        @InvocableVariable(label='CollectionOfRecords' required=True)
        public List<SObject> CollectionOfRecords;
        @InvocableVariable(label='SliceFrom' required=True)
        public Integer SliceFrom;
        @InvocableVariable(label='SliceTo' required=True)
        public Integer SliceTo;
    }
    
    public class Response {
        @InvocableVariable(label='CollectionOfRecordsSliced' required=True)
        public List<SObject> CollectionOfRecordsSliced;
    }
    
    @InvocableMethod(label='CollectionSlicer')
    public static List<Response> Invoke (List<Request> requests) {
        List<Response> responseList = new List<Response>();
        for (Request curRequest : requests) {
            Response response = new Response();
            response.CollectionOfRecordsSliced = slice(curRequest.CollectionOfRecords,curRequest.SliceFrom,curRequest.SliceTo);
            responseList.add(response);
        }
        return responseList;
    }
    
    public static sObject[] slice(sObject[] ary, Integer first, Integer last) {
        sObject[] res = ary.clone(), temp;
        Integer size = ary.size(),
            startIndex = Math.min(size, Math.max(-1, first<0? size+first: first)),
            endIndex = Math.min(size, Math.max(-1, last<0? size+last: last-1)),
            offset = Math.max(-1, endIndex-startIndex);
        temp = new sObject[offset+1];
        for(Integer h = 0, i = startIndex, j = endIndex; i <= j; ) {
            temp[h++] = ary[i++];
        }
        res.clear();
        res.addAll(temp);
        return res;
    }
        

}