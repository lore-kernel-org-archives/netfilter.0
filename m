From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: ISCS Pre-Alpha Release Announcement
Date: Mon, 23 Aug 2004 23:33:25 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1093318404.2813.191.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

In response to numerous requests, The Open Source Development
Corporation has issued a pre-alpha release of the Integrated Secure
Communications System (ISCS).  ISCS seamlessly combines Access Control,
NAT, VPN, Routing, User Authentication and Security Policy Management
into a single network security environment.

ISCS is not a GUI firewall rule configurator.  It is a security
environment configurator which produces consistent rule sets for a
variety of security subsystems on a variety of platforms from different
vendors.  It is a very different approach to network security.  Neither
we nor any of the major vendors and enterprise organizations to whom we
have presented the technology have seen anything similar in either the
proprietary or open source world.  The results are a much more flexible
and secure environment with an over 90% reduction in security
configuration time.  It makes true, multi-layered, network
compartmentalization realistic and manageable.

The project home page is http://iscs.sourceforge.net and the download
page is http://sourceforge.net/project/showfiles.php?group_id=72799
Please continue reading if you would like more information.


ISCS has the potential to demonstrate the power of the open source
development model.  Far less efficient and innovative commercial
offerings carry five and six figure price tags.  The open source
community can produce a better solution.  The key is the support
community.

ISCS is an enormous undertaking.  It requires skills in C, C++, SQL, GUI
design and development, embedded systems, open source and proprietary
firewall systems, open and proprietary VPN systems, open and proprietary
routing systems, open and proprietary IDS, IPS, Content Filtering, Virus
Scanning, Layer 1 and Layer 2 configuration for open and proprietary
systems, wireless technology, PKI, documentation, SSH, SSL.  The list is endless.

The ISCS road map is published below.  It may change based upon sponsor
funding and the skill sets of the volunteer support community.  If you
seen something that interests you and you have at least eight hours per
week to contribute to the project, please contact the Open Source
Development Corporation at info@opensourcedevelopmentcorp.com 

Version 1.0:
Complete automatic configuration of *swan based IPSec VPN
Complete automatic configuration of iproute2 routing
Complete simple integration of PKI

Version 1.1:
Logging, monitoring and alerting
Troubleshooting and analysis tools
Policy evaluation
Enhanced system administration and database management

Version 1.2:
More database enhancements
Ability to save edit sessions
Online help
Segment the administration environment into different "VPN clouds"
Enhanced response to security emergencies
Enhanced self protection for gateways

Version 2.0:
Extended user authentication - RADIUS, LDAP, Active Directory,
e-Directory, SecureID tokens, CAC, SmartCards, etc.
Delegated administration, i.e., different administrative rights to
different parts of the database, e.g., Managed Service Providers able to
delegate some administration rights to their clients.
Environment consistency checks
Application proxies
Security based upon protocol specific options, e.g., URI for HTTP
Live fail-over
Enhanced search and navigation functions for the GUI Security Policy
Manager
The ability to schedule updates based upon universal or local time
Implement pre-configured server templates for the quick creation of
server objects
Patch management
Relaying Internet traffic
Provide options to build Mesh, Hub & Spoke and Hybrid VPNs
Ability to change root CA
Nested gateways
Implement QoS
Encryption and Authentication based upon the needs of the data rather
than the configuration of the tunnel
View and manipulate data flows
VPN based upon native Linux and BSD
VPN based upon OpenVPN
VPN based upon proprietary IPSec stacks
Firewall based upon BSD
Integration with ISC DHCP for DHCP-over-IPSec
Full PKI integration
User customization of Security Policy Manager settings

Version 3.0:
Registration service for mobile gateways
Gateway rule optimization
An SSL type VPN RAS component
Change a gateway's DBD
Add time as a factor for access control decisions
Add location as a factor for access control decisions
Integrated IDS/IPS
Integrate Anti-Virus
Integrate Content Filtering
Implement an inherited rights mask
Added intelligence to DBD
Hierarchical change distribution
Integrate network security devices from Cisco, Nortel, Netscreen,
WatchGuard and others - create a vendor independent management console
Integrate security gateways and wireless access points
Integrate mobile devices (mobile phones, PDAs, embedded systems, etc.)
-- 
John A. Sullivan III
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevel.com


