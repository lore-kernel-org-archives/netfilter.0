From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: return
Date: Fri, 04 Jun 2004 11:44:17 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086363857.15361.25.camel@localhost>
References: <00f201c44a39$599a9230$49caa8c0@caris.priv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00f201c44a39$599a9230$49caa8c0@caris.priv>
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
To: Peter Marshall <peter.marshall@caris.com>
Cc: netfilter <netfilter@lists.netfilter.org>

On Fri, 2004-06-04 at 09:39, Peter Marshall wrote:
> I was just wondering if anyone here uses "return" in their rules .. I
> understand what it is for .. just wondering if it is efficient to use.
> 
> ex.
> 
> -A Forward -s 192.168.200.5 -o eth1 -j subchain1
> -A Forward -s 192.168.200.0/24 -o eth1 -j subchain2
> 
> -A subchain1 -d 200.200.200.200 --dport 1234 -j ACCEPT
> -A subchain1 -d 200.200.300.300 --dport 4321 -j ACCEPT
> -A subchain1 -j RETURN
> 
> -A subchain2 .......... blah blah blah ....
> 
> Or would you just write the rules different ?
> 
> Also, I was wondering is there a way to specify multiple source ip address ?
> 
> ex -s 192.168.200.5, 192.168.200.20 .....
<snip>
I use return all the time; it is great for handling exceptions
especially given that one cannot use multiple source or destination
addresses in rule.  For example, suppose that you had a rule you wanted
to apply to all of the 192.168.200.0/24 network except for 192.168.200.5
and 192.168.200.20.  You could use the iprange patch and break the
source into 192.168.200.1-4, 192.168.200.6-19 and 192.168.200.21-254, or
you could not patch at all and break the ranges into a multitude of
subnets to exclude those two addresses or you could do something like
the following:

iptables -N SpecialChain
iptables -A FORWARD -s 192.168.200.0/24 -j SpecialChain
iptables -A SpecialChain -j ACCEPT
iptables -I SpecialChain 1 -s 192.168.200.5 -j RETURN
iptables -I SpecialChain 1 -s 192.168.200.20 -j RETURN

For a real world example, one of the great advantages of the ISCS
project (http://iscs.sourceforge.net) for remote access is that we can
maintain extended user authentication across an entire VPN WAN.  In
other words, if a user authenticates to an ISCS PEP (Policy Enforcement
Point - gateway) in their home office and is granted iptables access
control rights based upon the fields of their X.509 cert, the user can
now be granted or denied access anywhere in the could in any office
based upon that same authentication.  They do not need to connect
directly to the PEP protecting the resources in a remote office nor do
they need to be assigned a locally assigned IP address and have
authentication in remote offices based upon their spoofable IP address. 
Their remote access if truly granted based upon their extended
authentication anywhere they go in the VPN WAN.  We do this with return
rules.

The PEP protecting the user has the responsibility for all
authentication anywhere on the VPN WAN (how we manage the rule set sized
required for this is another interesting story).  When the packet
arrives at the remote PEP from an ipsec interface, the PEP trusts that
the sending PEP authenticated it and thus simply allows it.  This would
create a gaping security hole if we did not except from this general
accept rule, all the networks which the remote PEP was responsible for
authenticating.  Thus we do something like:

iptables -N VPN_ALLOW
iptables -A FORWARD -i ipsec+ -j VPN_ALLOW
iptables -A FORWARD -j ACCESS_GROUPS
iptables -A VPN_ALLOW -j ACCEPT
iptables -I VPN_ALLOW -s 192.168.1.0/24 -j RETURN
iptables -I VPN_ALLOW -s 24.76.89.223 -j RETURN

This accepts all previously authenticated traffic but returns all
non-authenticated traffic to the authentication chain series.

So, yes, we use RETURN frequently and frequently because we cannot use
multiple source and destination addresses.  Good luck with it - John
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


