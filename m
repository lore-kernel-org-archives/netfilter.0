From: "John Wigley" <johnwigley@acorna.co.uk>
Subject: using NetFilter to share the SAME SINGLE IP between a Linux router
	AND a computer simultaneously
Date: Mon, 20 Jun 2005 14:31:45 +0100
Message-ID: <00c301c5759c$6771b3e0$02c8a8c0@computer1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi,

I wonder if some experienced NetFilter users may be able to answer if the 
following is possible and if so how :-

What I am looking to do is to be able to configure a Linux based router to 
be able to share a single Public IP address between the linux router and a 
single computer on the lan acting as the DMZ host.

So basically you have a linux router with two network ports, WAN and LAN. 
The router takes the single ISP assigned public IP address for it's WAN 
interface and then uses a non routable subnet for the LAN port. There are a 
number of machines on the LAN segment and the linux router is performing NAT 
for them so that they have internet connectivity - so far this is a standard 
normal setup.

Now what I want to do is to simultaneously assign that SAME PUBLIC IP 
address onto one of the LAN computers so that it for all intents and 
purposes is a DMZ host.

Before anyone says that this is mad and that it can't be done, it can be 
done perfectly well and all WESTELL ADSL / Ethernet routers have this 
functionality along with some no name Far Eastern origin broadband routers 
based on a Conexant OEM reference design.

Having thought long and hard about how to do this but not knowing NetFilter 
at all, I realised that the way this must be done is for the router to 
perform a standard NAT function with the added functions of tracking all 
outgoing connections from the DMZ host and entering those into the NAT table 
as well, so that it doesn't try to do a Port Address Translation on top of 
an existing outgoing connection from the DMZ host. For incoming connections, 
if the incoming packet has a reference in the NAT table then it is directed 
to the originating LAN machine and if not is passed through unmodified to 
the DMZ host.

I have spent much time googling and reading list postings but cannot find 
any reference on how to do this under linux, my guess is that Proxy ARP 
needs to be enabled on the LAN interface and then a 1:1 POST NAT mapping set 
to remap all the packets for the DMZ host back to the original public IP 
address but after that I'm stuck.

This is an incredibly useful feature which I've used on the Westell routers 
for some time, but now want to move to a Linux based router to be able to do 
QOS, as it allows all the benefits of NAT for sharing a single IP address 
but also the benefits of a routed connection for NAT unaware applications 
like IPSEC AH, and some VOIP implementations.

Any advice on setting this up would be much appreciated,

Thanks,

John Wigley



