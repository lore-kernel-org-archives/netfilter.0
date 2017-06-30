From: =?UTF-8?Q?=c3=98yvind_Kaurstad?= <oyvind@dynator.no>
Subject: Full NAT forward and source routing - possible without packet
 marking?
Date: Fri, 30 Jun 2017 15:55:25 +0200
Message-ID: <1363a246-966e-59fc-7d5a-efaf12aa6b51@dynator.no>
Reply-To: oyvind@dynator.no
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

Here's a quick rundown of the setup in question:

I have a device (kernel 4.1.6) with multiple interfaces, and I want to 
forward outside traffic coming into one interface, and have it exit a 
different interface. The reply (return traffic) should go in the exact 
opposite direction.

To do this, I am using DNAT and SNAT (masquerading), configured with 
nftables (v0.5 for now, will update at some point in the future). 
rp-filtering is turned off for all interfaces.

The device has three interfaces (eth0, eth1 and ppp0). The traffic in 
question first enters ppp0 (from the internet) with the ppp0 address as 
the destination. The source address can be anything, and not known in 
advance.

Then I have a DNAT-rule to translate the destination address to a device 
which is behind eth1 (so packet will just be forwarded). I also have 
masquerading enabled, so the source address is also rewritten when it 
exits eth1.

The reply packet then comes back at eth1, with a destination address 
that is eth1's address, and a source address that belongs to the 
replying device.

Now the packet will need to have both the source and destination 
addresses changed, reversing both SNAT/masquerading and DNAT, and then 
sent back out ppp0.

All the packet addresses are correctly rewritten (as expected) so that 
the final packet has a destination address of the initial internet 
client and a source address of my ppp0 interface, but the problem is 
that the packet exits out eth0 (which is the default route) and is then 
lost.

My first attempt at fixing this was to add a new default route out ppp0 
in a separate table, and then adding a rule to trigger this whenever the 
source address was that of the ppp0 interface (which is indeed the 
source address in the final packet). However, this rule does not 
trigger, because as far as I can tell, the routing decision is made 
before the DNAT is reversed, and at that point the source address of the 
packet is still the address of the replying device. For traffic directed 
at the router itself, this rule works, and ensures that replies go back 
out the ppp0 interface.

Since I don't know anything about the client's address, I can't add any 
explicit routes to it, hence I wanted it to be source routed.

Which brings me to the question in the subject, is it even possible to 
have this work without using the features of marking the connection and 
then mark the return packets and have a routing rule for it? I've tested 
this, and I can get that to work, but if there is a way to have the 
source routing work without doing that, I'd like to know.

If anyone would care to comment on this I'd be grateful, and if 
necessary I can of course give some specific examples of my config and 
sample packet flows.

