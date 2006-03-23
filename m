From: Menno Smits <menno@netboxblue.com>
Subject: Re: Per-client routing, plus masquerading -- possible?
Date: Thu, 23 Mar 2006 17:35:19 +1000
Message-ID: <44224FB7.3020502@netboxblue.com>
References: <51e5f6120603221910j3a7d3827oddb2b3bdcacaa818@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <51e5f6120603221910j3a7d3827oddb2b3bdcacaa818@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: Netfilter Mailing list <netfilter@lists.netfilter.org>

Jeremy Elson wrote:

> I've been tinkering with a command like this:
> 
> iptables -t nat -A POSTROUTING -i $INTERNAL_CLIENT_IP -o
> external-iface0 -j SNAT --to $EXTERNAL_ROUTER_IP
> 
> ...but it seems that --to controls the new source address given to the
> packet (i.e., the router's outside-interface IP), and not the
> destination to which the NATted packet is sent.

This is correct. SNAT is not about routing packets; it's for changing 
the source address of a packet.

> Could someone please point me in the right direction?  Or is this not possible?

What you want to do is possible but you'll need to employ source policy 
routing using the "ip" command. This isn't part of the netfilter 
project. In simple terms, you need to set up routes for each client 
IP/network and gateway you want to use.

The Linux Advanced Routing & Traffic Control HOWTO covers source policy 
routing among other things. The routing policy database section should 
get you on right track: http://lartc.org/howto/lartc.rpdb.html

HTH,
Menno



Scanned by the NetBox from NetBox Blue
(http://netboxblue.com/)





