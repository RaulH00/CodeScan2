public class Foo{
    public PageReference absoluteRedirect() {
        String fullUrl ='https://bad-practice.salesforce.com/TestPage?some=thing'; //Using this hardcoded URL could fail depending on the environment it was run in
        PageReference newUrl = new PageReference(fullURL);
         PageReference newUrl1 = new PageReference(fullURL);
        newURL.setRedirect(true);
        return newURL;
    }
    public PageReference relativeRedirect() {
        String relativeUrl = URL.getSalesforceBaseUrl().toExternalForm() + '/TestPage?some=thing';  //Using a relative address make this code usable across any environment
        PageReference newUrl = new PageReference(relativeUrl);
        newURL.setRedirect(true);
        return newURL;
    }
}
public with sharing class GeocodingService {
private static final String BASE_URL = 'https://nominatim.openstreetmap.org/search?format=json';
@InvocableMethod(callout=true label='Geocode address')
public static List<Coordinates> geocodeAddresses(
  List<GeocodingAddress> addresses
) {
  List<Coordinates> computedCoordinates = new List<Coordinates>();
  for (GeocodingAddress address : addresses) {
      String geocodingUrl = BASE_URL;
      geocodingUrl += (String.isNotBlank(address.street))
          ? '&street=' + address.street
          : '';
      geocodingUrl += (String.isNotBlank(address.city))
          ? '&city=' + address.city
          : '';
      geocodingUrl += (String.isNotBlank(address.state))
          ? '&state=' + address.state
          : '';
      geocodingUrl += (String.isNotBlank(address.country))
          ? '&country=' + address.country
          : '';
      geocodingUrl += (String.isNotBlank(address.postalcode))
          ? '&postalcode=' + address.postalcode
          : '';
      geocodingUrl += (String.isNotBlank(address.pincode))
          ? '&postalcode=' + address.pincode
          : '';
      Coordinates coords = new Coordinates();
      if (geocodingUrl != BASE_URL) {
          Http http = new Http();
          HttpRequest request = new HttpRequest();
          request.setEndpoint(geocodingUrl);
          request.setMethod('GET');
          request.setHeader(
              'http-referer',
              URL.getSalesforceBaseUrl().toExternalForm()
          );
          HttpResponse response = http.send(request);
          if (response.getStatusCode() == 200) {
              List<Coordinates> deserializedCoords = (List<Coordinates>) JSON.deserialize(
                  response.getBody(),
                  List<Coordinates>.class
              );
              coords = deserializedCoords[0];
          }
      }
      computedCoordinates.add(coords);
  }
  return computedCoordinates;
}
public class GeocodingAddress {
  @InvocableVariable
  public String street;
  @InvocableVariable
  public String city;
  @InvocableVariable
  public String state;
  @InvocableVariable
  public String country;
  @InvocableVariable
  public String postalcode;
}
public class Coordinates {
  @InvocableVariable
  public Decimal lat;
  @InvocableVariable
  public Decimal lon;
}
}
public class Foo{
    public PageReference absoluteRedirect() {
        String fullUrl ='https://bad-practice.salesforce.com/TestPage?some=thing'; //Using this hardcoded URL could fail depending on the environment it was run in
        PageReference newUrl = new PageReference(fullURL);
        newURL.setRedirect(true);
        return newURL;
    }
    public PageReference relativeRedirect() {
        String relativeUrl = URL.getSalesforceBaseUrl().toExternalForm() + '/TestPage?some=thing';  //Using a relative address make this code usable across any environment
        PageReference newUrl = new PageReference(relativeUrl);
        newURL.setRedirect(true);
        return newURL;
    }
}