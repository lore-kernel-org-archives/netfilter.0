From: Misterke <netfilter@quintux.com>
Subject: Re: Problems with bridge+router setup
Date: Mon, 28 Dec 2015 17:33:58 +0100
Message-ID: <e6259eb987cf9fb4d54fdf3b44ecac86@vpn.quintux.com>
References: <b012b8f6ef5b98338b2ce4544df60a24@vpn.quintux.com>
 <20151227142118.27861ea5@playground>
 <7f5d15a0a7067992b1ae21b149d64266@vpn.quintux.com>
 <5681128F.5090203@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5681128F.5090203@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Thanks for the feedback Pascal,

On 2015-12-28 11:44, Pascal Hambourg wrote:
> Does it use VLAN tagging (IEEE 802.1q) or plain ethernet ?

I don't think I can use VLAN tagging.  I would prefer not to install 
anything
special near the clients, just a plain and simple switch (well, 
actually in
some cases an old WIFI-router used simply as switch+AP with the routing 
part
disabled).

> What about broadcast packets such as ARP requests or DHCP replies 
> sent
> by the cable modem ? How do you decide if they should be bridged ?

Good question.  This is the sort of stuff I'm struggling with and 
basically
looking for people that can indicate how to sort this out.  Would 
passing
all ARP requests and broadcast frames be dangerous from a security
point-of-view?  Could I have an ebtables rule that would only let DHCP
replies for the client B MAC-addresses pass?  What would happen if I 
don't
allow other broadcast packets and/or ARP frames to be bridged?

> ICMP source quench is deprecated and considered...

I'll remove that rule then ...

> My advice is to not use br0 but only eth0 and eth1 for IP setup, 
> DHCP,
> routing and so on.

But then how to combine this with the need to bridge stuff for client 
B?
Can I have eth0 and eth1 part of a bridge but still each having their 
own
IP address?  I guess that would then mean making the address part of 
br0
manual instead of dhcp, for eth1 making it static and for eth0 making 
it
dhcp.  But then what interface would be used in the different chains 
for
ebtables/iptables?  Ex. if a packet comes into eth1 but doesn't have an
IP address in the range of the IP address assigned to eth1, will it 
then
be considered being for br0?  Or will everything still be considered to
be for br0 even if the target IP address is that of eth1?

So, I really appreciate the feedback, but would even more appreciate 
some
more tips on how to still fill in the required stuff.

Thanks,
K
