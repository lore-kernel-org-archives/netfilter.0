From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: [Bridge] Bridge blocking network traffic
Date: Wed, 30 Jun 2010 14:15:24 -0500
Message-ID: <4C2B97CC.8090007@riverviewtech.net>
References: <m2nbc9320b91004211748o5548f351z646076fab6744cca@mail.gmail.com>	<20100422130919.70206765@nehalam> <AANLkTimPiriAOGpHHrAoEyFGuuyn1g8vFqW6Pimdz9CQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimPiriAOGpHHrAoEyFGuuyn1g8vFqW6Pimdz9CQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/30/10 02:50, ratheesh k wrote:
> Why is it so ?

Independent of your scenario, I'd say that binding the IP to the 
interface will make it more resilient to the individual interfaces going 
down.  At least in such as all the interfaces would have to go down 
before the IP would go down.

> I have a linux   machine with interfaces eth0 (192.168.1.100 ) and 
> eth1 ( 192.168.2.100 )  .   . I can connect  both eth0 an eth1  to a 
> hardware  HUB . How could i do this in linux machine itself using 
> brctl ?

What netmask are your two IPs using, a /24?  If they are, then you are 
actually using two different subnets, and possibly doing something like 
a bridging router.

Either way, you could bind both IPs to the bridge interface (classic IP 
alias or "ip add").

With in the Xen context it may be because different things manage 
various parts of the Xen network differently and having the IP bound in 
the wrong place might cause a problem if the Xen hypervisor takes 
something down.

There is also the fact that if a cable gets unplugged from an interface 
(that is a member of a bridge with at least one other member interface) 
said interface will go down but the bridge will stay up.  In doing so, 
the IP will go down b/c the interface that it was bound to would go 
down.  Conversely if the IP was bound to the bridge interface, the IP 
would stay up and usable.

There is also the possibility that if the IP is bound directly to the 
interface that filtering (EBTables / IPTables w/ Bridged Netfilter 
option) will not see the traffic.

In some ways, it really depends on the specific use scenario.



Grant. . . .
