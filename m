From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: Per-client routing, plus masquerading -- possible?
Date: Thu, 23 Mar 2006 08:46:17 -0500
Message-ID: <4422A6A9.7030102@SCampbell.net>
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
To: Jeremy Elson <jelson@gmail.com>
Cc: netfilter@lists.netfilter.org

Jeremy Elson wrote:
> [ Oops, sent this to netfilter-devel before I realized this list
> existed.  D'oh! ]
> 
> 
> Hi,
> 
> I'm trying to set up a Linux box as a NATting router.  But here's the
> trick: my box's external interface is on a LAN that has a whole bunch
> of next-hop routers on it, any of which can be used to access the
> Internet.  I'm trying to figure out how to configure iptables so that
> the NAT box selects the router to use based on client IP address
> (i.e., the IP address on the inside interface).
> 
> In other words -- I'd like ipfilter to keep the destination IP address
> unchanged, but select a next-hop destination (e.g., by changing the
> destination MAC address) based on the source IP.   And, on top of all
> this, mangle the source address according to normal masquerading.
> 
> I've been tinkering with a command like this:
> 
> iptables -t nat -A POSTROUTING -i $INTERNAL_CLIENT_IP -o
> external-iface0 -j SNAT --to $EXTERNAL_ROUTER_IP
> 
> ...but it seems that --to controls the new source address given to the
> packet (i.e., the router's outside-interface IP), and not the
> destination to which the NATted packet is sent.
> 
> Could someone please point me in the right direction?  Or is this not possible?
> 
> Thanks!
> 
> --Jeremy
> 

You just want do to source routing, look here

http://www.linuxguruz.com/iptables/howto/2.4routing-4.html#ss4.1

