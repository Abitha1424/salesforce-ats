public class FutureCalloutDemo {
    @future(callout=true)
    public static void externalCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://jsonplaceholder.typicode.com/todos/1');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.debug('Status Code: ' + response.getStatusCode());
 		System.debug('Response Body: ' + response.getBody());
    }
}