From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: A Humble Proposal
Date: Fri, 26 Sep 2003 07:53:38 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064577218.1924.24.camel@jasiiitosh.nexusmgmt.com>
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

	I can certainly appreciate the desire to do this and it would be most
helpful for us in the ISCS project but there are some significant
hurdles if I correctly understand what you desire.
	I will be delighted to be wrong on this subject so, if someone sees a
better way, please correct me.  In ISCS (http://iscs.sourceforge.net),
we have been very interested in out-of-band authentication.  As far as I
know, all we consistently have to identify a user when the packet comes
in (in-band authentication) is the IP address.  How do we associate some
other kind of user authentication with this packet stream?
	We have been able to successfully use out-of-band authentication with
X.509 certs because we associate them with a specific tunnel using
FreeS/WAN (http://www.freeswan.org) and the X.509 patch
(http://www.strongsec.com).  When the IPSec session is initiated, we
capture the various fields of the cert (actually the fields in the
passed DER_ASN.1_DN ID) and the issuing CA.  We compare these against a
list of user groups associated with those fields (wildcards are allowed
in the security definitions so that we don't have to define every
specific user - just groups of users).  We then dynamically create rules
in the FORWARD or INPUT chains to jump the associated IP addresses to
the chains that contain the rules for those groups.  When the IPSec
session is torn down, we dynamically delete those chain jump rules.
	This is relatively safe against spoofing since we look for the traffic
coming off the ipsec interface.  It can't get to that interface unless
it has been authenticated in the IPSec tunnel creation and we will not
have two identical IPSec sessions with the same IP address.
	Other forms of out-of-band authentication are much more difficult.  We
have examined two approaches. One is to have a user application handle
it and the request for the authentication comes from the gateway.  The
other is to have the user initiate the authentication via something like
a Java app running in a browser.
	We found the first approach highly problematic.  It involves the
creation, distribution and maintenance of an OS specific application. 
The mechanism creates firewall problems.  Basically, the data packet
arrives at the gateway and the gateway sees if it has any rules to allow
the packet.  If it does not, it initiates a conversation with the
application running on the user's computer to ask for any other means of
identification.  Since the stream is initiated by the gateway, the
request is blocked if the user is behind a firewall that does not
(wisely) allow such inbound initiated streams.
	The user authentication method is much friendlier that way.  The data
stream is initiated by the user before sending any data packets and it
can run in any browser on any platform (theoretically!). However, we
have not yet set our minds to working around the spoofing problem.  Once
a user's IP address has been cached against that ID, in other words -
the dynamic iptables rules have been created based upon the
authentication and are checking packets on the physical interface, what
is to prevent another user from spoofing that address and obtaining the
same security clearance?
	My understanding from some of the major vendors who have implemented
this kind of out-of-band authentication is that they are subject to
spoofing attacks and it is an imperfect science.
	It would be wonderful if this could be in the state table but since the
authentication is a different data stream than the service data request,
how would it be associated? What happens when the user wishes to access
a different service, e.g., they first check their e-mail and then wish
to access the Human Resources web server? I,too, would love the ability
to do this but I see it as quite a challenging proposal.  Good luck to
all those working on it - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


