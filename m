From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: routing external IP's to internal machines.... Confustion
Date: Wed, 09 Jun 2004 18:59:06 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086821945.2926.18.camel@localhost>
References: <6781F74D-BA66-11D8-8DB6-000A95675988@earthlink.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6781F74D-BA66-11D8-8DB6-000A95675988@earthlink.net>
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
To: Michael Rowley MD <mrowleymd@earthlink.net>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-06-09 at 18:43, Michael Rowley MD wrote:
> Hello,
> 
> I apparently don't know what I am doing... I have read the docs, and 
> searched for some guidance, but have not come up with any help yet....
> 
> Here is the scenario.... I have a firewall running on Gentoo, 2.4.26 
> kernel, all routing/netfilter stuff is compiled as module in kernel, 
> iptables installed, using arno's  firewall scripts.
> 
> What I am trying to do seems fairly basic, but I haven't found any 
> guidance, and my efforts are failing...
> 
> I have a block of IP's from Sprint, 209.26.244.33/29.  I have 2 servers 
> inside the firewall that I would like to have accessible from the 
> internet on an external fixed IP.  Currently the internal network is on 
> 192.168.1.0/24, the firewall is working, and I can ssh into the 
> firewall, but would like to ssh into all the servers, and need web 
> access to both also.  I will try and diagram this, just to ellucidate. 
> :)
> 
> -----------
> 	     |
> 	pvc0: 209.26.250.74ptp209.26.250.73
> 	pvc0:0 209.26.224.33
> 	     |
> 	Firewall Server
> 	     |
> 	eth0: 192.168.1.1
> 	     |
> 	     |
> 	     --------------------------  Server1 192.168.1.2
> 	     |
> 	     |
>        	Server 2: 192.168.1.3
> 
> Now, I would like to reference each server via an external IP ie 
> Server1 = 209.26.224.34, Server2 = 209.26.224.35
> 
> Here is what I had added to the firewall script:
> 
> PHEONIX="192.168.1.192"
> STATIC_PHEONIX="209.26.224.34"
> ASTERISK="192.168.1.1"
> STATIX_ASTERISK="209.26.224.33"
> 
> #
> # all packets coming for STATIC_PHEONIX should go to PHEONIX
> #
> 
> /sbin/iptables -t nat -I PREROUTING 1 -p TCP -d $STATIC_PHEONIX -dport 
> 80 -i $EXT_IF -o $INT_IF -j DNAT --to-destination $PHEONIX
> /sbin/iptables -t nat -I PREROUTING 1 -p TCP -d $STATIC_PHEONIX -dport 
> 22 -i $EXT_IF -o $INT_IF -j DNAT --to-destination $PHEONIX
> 
> #
> # All packets going out from PHEONIX should have correct source IP...
> #
> 
> /sbin/iptables -t nat -I POSTROUTING 1 -p TCP -s $PHEONIX -o pvc0 -j 
> SNAT --to-source $STATIC_PHEONIX
> 
> and I still can't ping the addresses...  I read something from suse.com 
> website that talked about having the addresses aliased to the external 
> address, so added ifconfig pvc0:1 209.26.224.34,
> 
> I am only working on one server here, as I figure, If I can get to one 
> of the, I can get to either with the same/similar setup.
> 
> Guidance?  Please help.
> 
> Michael...
A few quick points.  First, some syntactics - --dport instead of -dport,
-o is not valid on the PREROUTING chain.

Second, NAT is not Access Control (a mantra I've been saying for my own
sake to keep my sanity as I build the NAT modules for the ISCS
project).  Once you've NAT'd the packet to the internal address, you
still need a rule in the filter table to allow access to that internal
address.

Third, we still need to get down to layer two by providing for ARP.  We
can do this by binding the additional addresses to the external
interface:
ip address add 209.26.224.34/29 dev pvc0
ip address add 209.26.224.35/29 dev pvc0

That should at least get you closer.  Good luck - John
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


