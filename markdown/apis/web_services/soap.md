# SOAP


## References

- [Exploring Web Services and XML — SOAP, WSDL, and UDDI](https://medium.com/@AlexanderObregon/exploring-web-services-and-xml-soap-wsdl-and-uddi-66353df368d2)


## SOAP

### Defintion
SOAP is an acronym for Simple Object Access Protocol. It is an XML-based messaging protocol for exchanging information among computers. SOAP is an application of the XML specification.

Points to Note
- SOAP is a communication protocol designed to communicate via Internet.
- SOAP can extend HTTP for XML messaging.
- SOAP provides data transport for Web services.
- SOAP can exchange complete documents or call a remote procedure.
- SOAP can be used for broadcasting a message.
- SOAP is platform- and language-independent.
- SOAP is the XML way of defining what information is sent and how.
- SOAP enables client applications to easily connect to remote services and invoke remote methods.

### Envelope
####  Architecture
A SOAP message is an ordinary XML document containing the following elements −

- Envelope − Defines the start and the end of the message. It is a mandatory element.
- Header − Contains any optional attributes of the message used in processing the message, either at an intermediary point or at the ultimate end-point. It is an optional element.
- Body − Contains the XML data comprising the message being sent. It is a mandatory element.
- Fault − An optional Fault element that provides information about errors that occur while processing the message.

#### Message Structure
The following block depicts the general structure of a SOAP message −

```
<?xml version = "1.0"?>
<SOAP-ENV:Envelope xmlns:SOAP-ENV = "http://www.w3.org/2001/12/soap-envelope" 
   SOAP-ENV:encodingStyle = "http://www.w3.org/2001/12/soap-encoding">

   <SOAP-ENV:Header>
      ...
      ...
   </SOAP-ENV:Header>
   <SOAP-ENV:Body>
      ...
      ...
      <SOAP-ENV:Fault>
         ...
         ...
      </SOAP-ENV:Fault>
      ...
   </SOAP-ENV:Body>
</SOAP_ENV:Envelope>
```

#### Points to Note
- Every SOAP message has a root Envelope element.
- Envelope is a mandatory part of SOAP message.
- Every Envelope element must contain exactly one Body element.
- If an Envelope contains a Header element, it must contain no more than one, and it must appear as the first child of the Envelope, before the Body.
- The envelope changes when SOAP versions change.
- The SOAP envelope is specified using the ENV namespace prefix and the Envelope element.
- The optional SOAP encoding is also specified using a namespace name and the optional encodingStyle element, which could also point to an encoding style other than the SOAP one.
- A v1.1-compliant SOAP processor generates a fault upon receiving a message containing the v1.2 envelope namespace.
- A v1.2-compliant SOAP processor generates a VersionMismatch fault if it receives a message that does not include the v1.2 envelope namespace.

### Header
The optional Header element offers a flexible framework for specifying additional application-level requirements. For example, the Header element can be used to specify a digital signature for password-protected services. Likewise, it can be used to specify an account number for pay-per-use SOAP services.

#### Points to Note
- It is an optional part of a SOAP message.
- Header elements can occur multiple times.
- Headers are intended to add new features and functionality.
- The SOAP header contains header entries defined in a namespace.
- The header is encoded as the first immediate child element of the SOAP envelope.
- When multiple headers are defined, all immediate child elements of the SOAP header are interpreted as SOAP header blocks.
- Attributes
    - By setting the Actor attribute, the client can specify the recipient of the SOAP header.
    - Header element is optional or mandatory. If set to true, the recipient must understand and process the Header attribute according to its defined semantics, or return a fault.


### Body
The SOAP body is a mandatory element that contains the application-defined XML data being exchanged in the SOAP message. The body must be contained within the envelope and must follow any headers that might be defined for the message.

### Fault
If an error occurs during processing, the response to a SOAP message is a SOAP fault element in the body of the message, and the fault is returned to the sender of the SOAP message.

The SOAP fault mechanism returns specific information about the error, including a predefined code, a description, and the address of the SOAP processor that generated the fault.

#### Points to Note
- A SOAP message can carry only one fault block.
- Fault is an optional part of a SOAP message.
- For HTTP binding, a successful response is linked to the 200 to 299 range of status codes.
- SOAP Fault is linked to the 500 to 599 range of status codes.

#### Sub-elements of Fault
The SOAP Fault has the following sub elements −

| Sr.No	  | Sub-element          | Description                                                                                                     |
| :-----: | :------------------: | :------------------------------------------------------------------------------------------------------- |
| 1       | \<faultCode\>        |It is a text code used to indicate a class of errors. See the next Table for a listing of predefined fault codes. |
| 2       | \<faultString\>      | It is a text message explaining the error. |
| 3	      | \<faultActor\>       | It is a text string indicating who caused the fault. It is useful if the SOAP message travels through several nodes in the SOAP message path, and the client needs to know which node caused the error. A node that does not act as the ultimate destination must include a faultActor element |
| 4       | \<detail\>           | It is an element used to carry application-specific error messages. The detail element can contain child elements called detail entries. |

### Encoding
SOAP includes a built-in set of rules for encoding data types. It enables the SOAP message to indicate specific data types, such as integers, floats, doubles, or arrays.

- SOAP data types are divided into two broad categories − scalar types and compound types.
- Scalar types contain exactly one value such as a last name, price, or product description.
- Compound types contain multiple values such as a purchase order or a list of stock quotes.
- Compound types are further subdivided into arrays and structs.
- The encoding style for a SOAP message is set via the SOAP-ENV:encodingStyle attribute.
- To use SOAP 1.1 encoding, use the value http://schemas.xmlsoap.org/soap/encoding/
- To use SOAP 1.2 encoding, use the value http://www.w3.org/2001/12/soap-encoding
- Latest SOAP specification adopts all the built-in types defined by XML Schema. Still, SOAP maintains its own convention for defining constructs not - standardized by XML Schema, such as arrays and references.

#### Scalar Types

| Simple Type	 | Example                                                                                                                 |
| :------------- | :---------------------------------------------------------------------------------------------------------------------- |
|string|	Confirm this is electric.|
|boolean|	true, false, 1, 0.|
|float|	-INF, -1E4, -0, 0, 12.78E-2, 12, INF, NaN.|
|double|	-INF, -1E4, -0, 0, 12.78E-2, 12, INF, NaN.|
|decimal|	-1.23, 0, 123.4, 1000.00.|
|binary|	100010|
|integer|	-126789, -1, 0, 1, 126789.|
|nonPositiveInteger|	-126789, -1, 0.|
|negativeInteger|	-126789, -1.|
|long|	-1, 12678967543233|
|int|	-1, 126789675|
|short|	-1, 12678|
|byte|	-1, 126|
|nonNegativeInteger|	0, 1, 126789|
|unsignedLong|	0, 12678967543233|
|unsignedInt|	0, 1267896754|
|unsignedShort|	0, 12678|
|unsignedByte|	0, 126|
|positiveInteger|	1, 126789.|
|date|	1999-05-31, ---05.|
|time|	13:20:00.000, 13:20:00.000-05:00|
**Table:** Simple Types Built-In to XML Schema

#### Compound Types

##### array of 10 double values 

arrayType = "xsd:double[10]"

##### two-dimensional array of strings 

arrayType = "xsd:string[5,5]"