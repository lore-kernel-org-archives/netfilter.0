From: Jason Opperisano <opie@817west.com>
Subject: Re: Two ISPs, a bridge and iptables
Date: Mon, 13 Dec 2004 13:03:43 -0500
Message-ID: <1102961023.3629.19.camel@hubcap.ljm.dom>
References: <20041213171123.GA13902@samuraj>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041213171123.GA13902@samuraj>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Mon, 2004-12-13 at 12:11, Lukasz Hejnak wrote:
> Hi
> I've been thinking about connecting two ISP's to a linux box and
> then firewalling/masqrading that to a local net.
> The solution I'm thinking of is:
> - connect the ISP's to two different interfaces (say eth0/1)
> - connect the local net via a third interface (eth3)
> - bridge the two network interfaces into one (eth2)

no.  first--the bridge interface would be "br0" not "eth2"
second--do not bridge your two internet connections together.  bridging
two interfaces together says, "any packet received on one bridge member
interface is sent out all other bridge member interfaces."  and that is
certainly not what you appear to be after...

> - doing the rest of the iptables stuff using 
>     eth2 as the internet and eth3 as the local net

again, no--for bridging you could filter at the ebtables level (layer 2)
or use the "physdev" match to filter on specific bridge ports (the eth+
devices)

> some ascii art:
> 
>    ISP#1      ISP#2
>      |          |
> ===============================
>      |          |
>    eth0       eth1
>      |          |
>      ---bridge---
>          eth2
> 	  |   
>        iptables   (linux box)
>          masq
>           |
> 	 eth3
> 	  |
> ===============================
> 	  |
>      local network
>     
> Now since I still have no playground for this to test, I've got these questions:
> Would this solve the problem? 

no.

> (local net have access at ISP1+ISP2 bandwidth to the internet)
> Would the total load of connections outside be balanced
> by iptables/bridge mechanism between the ISP's?

to accomplish these two goals--read:

  http://lartc.org/howto/lartc.rpdb.multiple-links.html

and also take a look at the nth patch from POM (the help file describes
load-balancing outbound connections over multiple ISP links).

> Is this the best/worst/fastest/slowest way to do this?

bridging has virtually nothing to do with solving your problem.

> How will the things change when one of the ISP's fail?

you'll write a script that pings over each upstream link and take
actions in that script when one of the links fail.

-j

--
"I saw weird stuff in that place last night. Weird, strange, sick,
 twisted, eerie, godless, evil stuff. And I want in."
	--The Simpsons


