From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: netfilter digest, Vol 1 #811 - 7 msgs
Date: 02 May 2003 19:04:31 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051916671.4218.22.camel@jasiiitosh.nexusmgmt.com>
References: <20030502222622.31281.6575.Mailman@kashyyyk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030502222622.31281.6575.Mailman@kashyyyk>
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

	I may be able to help a little.  For the ISCS project
(http://iscs.sourceforge.net), we use X.509 user authentication.  User
are assigned to user groups based upon their certs.  We create dynamic
iptables rules for users when they authenticate via X.509 certificates
based upon the fields in the ID passed during IKE.  We then tear down
those rules when the session is torn down.  The scripts we use to do
this (X509updown and DNRead) can be found in the project CVS
(http://sourceforge.net/projects/iscs) under PEP.  Perhaps they can
point you in the right direction.
	We plan to include LDAP authentication in version 2.0 of ISCS so I'd
love to know the specifics of how you ultimately accomplish it.  There
are some important security implications since, in effect, we are
caching the IP address against the user authentication.  With an IPSec
tunnel created with X.50 certs, we have the advantage that no one can
easily spoof the cert user's IP.  The rules only pertain to the IPSec
tunnel and when the tunnel is destroyed, so are the rules.  I'm not sure
how one would plug that hole with LDAP authentication.  Good luck - John

On Fri, 2003-05-02 at 18:26, netfilter-request@lists.netfilter.org
wrote:

> Message: 4
> Date: Fri, 2 May 2003 12:25:32 +0530 (IST)
> From: "Yogesh Talekar (M.T.S.@C.N.C.)" <yogesh@unipune.ernet.in>
> To: netfilter@lists.netfilter.org
> Subject: IP-tables with authentication
> 
> hi
> 
> Is this possible ...
> 
> I have a IP-tables firewall on a machine "A". I have LDAP database on 
> machine "B". And I want all the traffic going out of my firewall(A) to be 
> authenticated against this LDAP server(B).
> 
> Consider following scenario (network diagram)...
> 
> ********************************FIGURE********************************
> 
> Internet <--> Router (realIP-X.X.X.254) <--> Linux FW (Bridge-No IP) 
> 					|	
> 					|
> 					|
> 		------------------ switch---------------
> 		|			|		|
> 	LDAP Server(X.X.X.100)		|		|
> 	     			     server-1	    server-2
> 			(RealIP-X.X.X.10)    	(RealIP-X.X.X.3)
> 			(FakeIP-192.168.1.X) 	(FakeIP-192.168.2.X
> 				|
> 				|
> 				|
> 				Intranet
> 
> **********************************************************************
> 
> The question is, can I keep log and count the traffic per user if he 
> (from Intranet) uses any type of service (http,ssh,telnet,ftp) via the 
> Linux firewall. And Can I authenticate this user against the LDAP server 
> (which has a realIP)
> 
> Please advice
> 
> --yogesh
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


