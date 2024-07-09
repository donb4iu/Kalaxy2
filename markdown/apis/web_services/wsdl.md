# WSDL


## References

- [Exploring Web Services and XML — SOAP, WSDL, and UDDI](https://medium.com/@AlexanderObregon/exploring-web-services-and-xml-soap-wsdl-and-uddi-66353df368d2)
- [WSDL Tutorial](https://www.tutorialspoint.com/wsdl/index.htm)

## WSDL

### Defintion

WSDL stands for Web Services Description Language. It is the standard format for describing a web service. WSDL was developed jointly by Microsoft and IBM.

### Features of WSDL
WSDL is an XML-based protocol for information exchange in decentralized and distributed environments.

- WSDL definitions describe how to access a web service and what operations it will perform.
- WSDL is a language for describing how to interface with XML-based services.
- WSDL is an integral part of Universal Description, Discovery, and Integration (UDDI), an XML-based worldwide business registry.
- WSDL is the language that UDDI uses.
- WSDL is pronounced as 'wiz-dull' and spelled out as 'W-S-D-L'.

### Web services elements
WSDL breaks down web services into three specific, identifiable elements that can be combined or reused once defined.

- Types
- Operations
- Binding

### WSDL Elements
A WSDL document contains the following elements −

- Definition − It is the root element of all WSDL documents. It defines the name of the web service, declares multiple namespaces used throughout the remainder of the document, and contains all the service elements described here.

- Data types − The data types to be used in the messages are in the form of XML schemas.

- Message − It is an abstract definition of the data, in the form of a message presented either as an entire document or as arguments to be mapped to a method invocation.

- Operation − It is the abstract definition of the operation for a message, such as naming a method, message queue, or business process, that will accept and process the message.

- Port type − It is an abstract set of operations mapped to one or more end-points, defining the collection of operations for a binding; the collection of operations, as it is abstract, can be mapped to multiple transports through various bindings.

- Binding − It is the concrete protocol and data formats for the operations and messages defined for a particular port type.

- Port − It is a combination of a binding and a network address, providing the target address of the service communication.

- Service − It is a collection of related end-points encompassing the service definitions in the file; the services map the binding to the port and include any extensibility definitions.

In addition to these major elements, the WSDL specification also defines the following utility elements −

- Documentation − This element is used to provide human-readable documentation and can be included inside any other WSDL element.

- Import − This element is used to import other WSDL documents or XML Schemas.

        **NOTE − WSDL parts are usually generated automatically using web services-aware tools.**

### WSDL Document Structure


```
<definitions>
   <types>
      definition of types........
   </types>

   <message>
      definition of a message....
   </message>

   <portType>
      <operation>
         definition of a operation.......  
      </operation>
   </portType>

   <binding>
      definition of a binding....
   </binding>

   <service>
      definition of a service....
   </service>
</definitions>
```
A WSDL document can also contain other elements, like extension elements and a service element that makes it possible to group together the definitions of several web services in one single WSDL document.

### Example - contents of HelloService.wsdl file −

```
<definitions name = "HelloService"
   targetNamespace = "http://www.examples.com/wsdl/HelloService.wsdl"
   xmlns = "http://schemas.xmlsoap.org/wsdl/"
   xmlns:soap = "http://schemas.xmlsoap.org/wsdl/soap/"
   xmlns:tns = "http://www.examples.com/wsdl/HelloService.wsdl"
   xmlns:xsd = "http://www.w3.org/2001/XMLSchema">
 
   <message name = "SayHelloRequest">
      <part name = "firstName" type = "xsd:string"/>
   </message>
	
   <message name = "SayHelloResponse">
      <part name = "greeting" type = "xsd:string"/>
   </message>

   <portType name = "Hello_PortType">
      <operation name = "sayHello">
         <input message = "tns:SayHelloRequest"/>
         <output message = "tns:SayHelloResponse"/>
      </operation>
   </portType>

   <binding name = "Hello_Binding" type = "tns:Hello_PortType">
      <soap:binding style = "rpc"
         transport = "http://schemas.xmlsoap.org/soap/http"/>
      <operation name = "sayHello">
         <soap:operation soapAction = "sayHello"/>
         <input>
            <soap:body
               encodingStyle = "http://schemas.xmlsoap.org/soap/encoding/"
               namespace = "urn:examples:helloservice"
               use = "encoded"/>
         </input>
		
         <output>
            <soap:body
               encodingStyle = "http://schemas.xmlsoap.org/soap/encoding/"
               namespace = "urn:examples:helloservice"
               use = "encoded"/>
         </output>
      </operation>
   </binding>

   <service name = "Hello_Service">
      <documentation>WSDL File for HelloService</documentation>
      <port binding = "tns:Hello_Binding" name = "Hello_Port">
         <soap:address
            location = "http://www.examples.com/SayHello/" />
      </port>
   </service>
</definitions>
```

### Example Analysis
- Definitions − HelloService

- Type − Using built-in data types and they are defined in XMLSchema.

- Message −

    - sayHelloRequest − firstName parameter

    - sayHelloresponse − greeting return value

- Port Type − sayHello operation that consists of a request and a response service.

- Binding − Direction to use the SOAP HTTP transport protocol.

- Service − Service available at http://www.examples.com/SayHello/

- Port − Associates the binding with the URI http://www.examples.com/SayHello/ where the running service can be accessed.
