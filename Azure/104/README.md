# DevOps Sharing

**WARNING:** The content of this repository is my **personal knowledge**

Please let me know if you find something wrongs and I will fix that

---

# Subscription

This is an agreement with Microsoft to use one or more Microsoft cloud platforms or services. Every resources created in Azure is associated with the subscription

The Azure subscription is normally associated with an account

## Strategies when using subscriptions

The need for having multiple subscriptions

"Management group" is used for managing multiple subscriptions

## Subscription roles

Classic subscription administrator roles

* Account Administrator: One per Azure account. This user has access to Azure Account Center and can manage all the subscriptions in the account

* Service Administrator: One per Azure subscription. This user can cancel the subscription and also manage services in Azure portal

* Co-administrator: Equivalent to having a user who is assigned the Owner role at the subscription level

# Identity and Access

## Azure AD Groups

Azure AD Groups are a way to manage access to resources in Microsoft Azure and other Microsoft services. They are used to simplify user and resource management by grouping users and resources together, making it easier to manage permissions and access controls

Azure AD Groups can be used to assign access to applications, assign licenses, delegate administrative permissions and much more

These groups can be created manually in Azure AD or synchronized from on-premise Active Directory using Azure AD Connect    

The Azure site does not allow management of certain groups:

* Only On-premises Active Directory can handle groups that have been synchronized from it

* The only places to handle distribution lists and mail-enabled security groups are the Microsoft 365 admin center or the Exchange admin center

* To manage these groups, you must be logged into the Microsoft 365 admin center or the Exchange admin center

There are 2 types of groups and 3 different levels of group membership

* Security group type: 

    * Controls how computers and users access shared resources

    * To provide each group member the identical set of security rights, you may, for instance, form a security group

    * Users, devices, other groups, and service principals, which specify access rules and permissions, can all be members of a security group

* Microsoft 365 group types:

    * Offers chances for group members to collaborate by granting them access to a mailbox, calendar, files, SharePoint sites and more

    * You can also grant access to the group to individuals outside of your company using this option

    * A Microsoft 365 group can only have users as members. Users and service principals can be group owners in Microsoft 365

* Assigned membership type:

    * Allows you to add particular people to a group and give them exclusive permissions

* Dynamic user membership type:

    * Enables you to automatically add and remove users using dynamic membership rules

    * When a member's attributes change, the system checks your dynamic group rules for the directory to see if the member still satisfies the criteria (is added), has ceased to satisfies the criteria (is removed), or no longer satisfies the criteria

* Dynamic device membership type:

    * Enables you to add and remove devices automatically using dynamic group rules

    * When a device's properties are changed, the system checks your dynamic group rules for the directory to determine if the device still satisfies the criteria for inclusion (is added) or exclusion (is withdrawn)

Conditional Access Policies (Azure AD)

* The current security perimeter now includes user and device identities in addition to the organization's network. Identity-driven signals can be used by organizations when making access control choices

* To make decision and implement organization policies, conditional access combines signals. The new identity-driven control plane is built on the foundation of Azure AD Conditional Access

* If-then statements are the simplest kind of conditional access controls: if a user wants to access a resource, they must perform an action. As an illustration, a payroll manager needs to complete multifactor authentication in order to access the payroll application

* Administrators must focus on two main objectives:

    * Enabling people to be effective whenever and wherever possible

    * Defend the resources of the organization

* Conditional Access Policies are enforced after first-factor authentication is completed. Conditional access isn't intended to be an organization's first line of defense for scenarios like DDoS attacks, but it can use signals from these events to determine access

Typical signals that conditional access may take into account when choosing actions include the following:

* Membership in a User or Group:

    * Policies can be tailored to certain users or groups, providing administrators granular control over access

* Information about IP location:

    * Businesses can designate trusted IP address ranges for use in deciding on policies

    * Administrators can specify entire IP ranges to either allow or disallow communication from particular contries or regions

* Device:

    * When enforcing Conditional Access Policies, users with devices running a specific operating system or marked with a particular state may be used

    * Use filter for devices to modify policies so that they only apply to specific types of devices, such as workstations with privileged access

* Application:

    * Different Conditional Access Policies may be activated when users attempt to access particular applications

* Real-time and Calculated Risk Detection

    * Conditional Access Policies can recognize problematic sign-in activity thanks to signals integration with Azure AD Identity Protection

    * Once users have changed their passwords, policies can either block access until an administrator takes manual action or require multifactor authentication to lower risk

* Microsoft Defender for Cloud Applications

    * Giving you additional visibility and control over who can access your cloud environment and what they can do there, real-time monitoring and administration of user application access and sessions is made possible

Conditional access policies best practices:

* Requiring users with administrative roles to utilize multifactor authentication

* Duties involving Azure management calling for multifactor authentication

* Preventing users who try to sign in using old authentication methods

* Requiring trusted locations for the registration of Azure AD multifactor authentication

* Allowing or denying access from particular places

* Preventing dangerous sign-in practices

* Requiring managed devices from the organization for a particular application

# Microsoft Entra Product family

Permissions Management

* Multicloud Cloud Infrastructure Entitlement Management (CIEM) solution

* Discovers permission risk

* Multicloud permission right-sizing

* Generating forensic reports

Verified ID

* Introduces the next generation of Decentralized Identity (DID)

* Based on open standards W3C and the Decentralized Identity Foundation (DIF)

* User-generated DIDs instead of email or social network credentials

Microsoft Entra product family includes:

* Azure Active Directory

* Microsoft Entra Permissions Management: An Enterprise application that is added to Azure active directory that allows permission management across multiple Cloud providers

* Microsoft Entra Verified ID: Included in all Azure active directory subscriptions. This is an open standard that automates verification credentials and provides privacy between organizations and users

## Azure Active Directory

It is an authentication tool, or a cloud-based identity and access management service

It is also an identity tool, allows us to create and manage users and groups

It is also a licensing tool.

It allows role based access.

Features and Edition options:

* Editions:

    * Azure Active Directory Free: Azure, Dynamics 365, Intune, Power Platform

    * Azure Active Directory Office 365 Apps: Includes Free, E1, E3, E5, F1 and F3 have additional features

    * Azure Active Directory Premium P1: Seamless hybrid integration, MFA, Application Access, Frontline workers

    * Azure Active Directory Premium P2: Includes everything from the P1 edition, Authorization, Conditional Access, End-user self-service

## Azure AD Tenants