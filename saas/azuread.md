# Azure AD (Azure Active Directory)

Azure AD is a <mark style="background-color: #FF999C">cloud-based identity and access management service</mark> by Microsoft. It allows organizations to manage user identities, control access to applications, and ensure security across cloud and on-premises environments.


## Azure Jargon. Azurgon. Klingon? 👀

1. Yielding
"Yielded" in this context refers to the process of producing or returning results from an operation. In programming, "yield" often means returning a value or a result from a process that is ongoing or iterative. Here, it suggests that the system has processed and returned a certain number of items up to that point in time.

2. Items
"Items" typically represent the individual units of data or objects being processed or retrieved by the system.   
In Azure AD, items are:
- Events or log entries related to 
    - user authentication
    - access requests
    - audit logs
    - sign-in logs
    - any other relevant data that Azure AD collects for monitoring and security purposes.

3. Poll
"Poll" refers to the process of <span style="background-color: #F9E294">repeatedly checking or querying a system </span> to see if new data or changes are available. Polling can be done at regular intervals to ensure that the system stays updated with the latest information.   
Poll is the system querying or checking for new log entries or events within a certain timeframe. The polling operation yields or returns the items (log entries) that have been processed since the last check.


## Direction of Polling Requests


<span style="background-color: #F9E294"></span>
<span style="background-color: #F9E294"></span>


- Polling typically involves a <span style="background-color: #F9E294">client (e.g., a script, application, or monitoring tool)</span> repeatedly sending requests to <span style="background-color: #F9E294">a server or service (e.g., Azure AD)</span> to check for new data or updates.
- In this case, the client is the entity doing the polling, and Azure AD is the service being polled.
    - Client >>>>> Polling >>>>> Azure AD server
    - for <span style="background-color: #F9E294">log entries, events, etc.</span>

## Who is Polling Whom?
- The client is polling Azure AD. This means the client is sending requests to Azure AD to retrieve information such as <span style="background-color: #F9E294">log entries, events, or any other data the client is interested in.</span>
- The client or the process running the polling operation is the actor who yielded the items. This client is responsible for making requests to Azure AD.
- "Yielded xxxx items" means that, up to that point in the polling operation, <mark style="background-color: #FF999C">the client has retrieved (or received) a certain number of items (e.g., log entries) from Azure AD.</mark>


## Common AzureAD issues - The roles and the access token. 
1. Meaning
- The error usually occurs if the access token does not have **permissions** related to Microsoft Graph while calling Graph API requests.
- When the system is unable to locate the "roles" claim in the access token.
- In OAuth 2.0 and OpenID Connect, an access token is a piece of security information that represents the authorization granted to a client to access resources on behalf of a user.
- The "roles" claim typically contains information about the roles assigned to the user (e.g., admin, user, reader). These roles are often used for authorization purposes to determine what actions the user is allowed to perform.

2. Possible Causes:
Missing Roles Claim: The token might not include the "roles" claim. This could happen if the roles are not configured to be included in the access token.
Misconfiguration: There might be a misconfiguration in the application or Azure AD where the roles should have been included in the token but weren’t.
Token Scope: The token request might not have included the proper scopes or permissions to obtain the roles information.
3. Solution:
Check Token Configuration: Verify that the roles are configured correctly in the Azure AD application settings and that the token is being issued with the necessary claims.
Scopes and Permissions: Ensure that the token request includes the required scopes or permissions to obtain the roles.