From: Emilio Lazo Zaia <emiliolazozaia@gmail.com>
Subject: Re: Problem with SNAT trying to configure a load balancing router
Date: Wed, 20 Apr 2011 19:55:29 -0430
Message-ID: <1303345529.936.70.camel@uqbar.local>
References: <1303323523.25148.10.camel@uqbar.local>
	 <1303331081.4938.307.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:subject:from:to:cc:in-reply-to:references
         :content-type:date:message-id:mime-version:x-mailer
         :content-transfer-encoding;
        bh=e93kHaCjkUOxMevYTzSAEC52tpnUdA7roCfwkvdvpT4=;
        b=G6ugjLWzE+K4hwu+TpGJdHV2gEyCR8Ggj2owPsm/SJufZk0//yDTyCWuDsVY5VjKdD
         et6U/Dt+/PZ9XzFzqz6k6ZboFA56FzUbpI7ONjvSCMN2zxBLmctbknrnWUJsKHrazach
         kx6e6bAkzNWLMkRQzlO4gxopvSovrjhRcoHDs=
In-Reply-To: <1303331081.4938.307.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

Hi!

On Wed, 2011-04-20 at 21:24 +0100, Andrew Beverley wrote:
> On Wed, 2011-04-20 at 13:48 -0430, Emilio Lazo Zaia wrote:
> > 
> > The ISP1's routing table is called 'CANTV' and its network interface is
> > called 'wan'. ISP2 is 'Inter' and network interface 'wan2'. Both ISP
> > gives me IP addresses via DHCP.
> 
> It it a "static" DHCP - do you get the same IP address assigned each
> time?

Addresses from ISP1 have a lease time within 1 and 8 hours, but if the
MAC address doesn't change, the IP address sent by DHCP server remains
the same one month or more. Is an ADSL link. 

ISP2 is a cable link and IP address assignment is more "dynamic"; the
addresses doesn't lasts the same more than 3 days.

But, why does it matter? I don't understand the difference within
MASQUERADE and SNAT and I guess you ask me about the staticity of IP
addresses having this in mind. E.g., having static public and private
address can't be used MASQUERADE and having all dynamic addresses can't
be used SNAT? ("dynamic" SNAT rules which updates via scripts when DHCP
assigns different address) Can you explain this? :-)
 
> > After bringing up both links and some manual fix and addons to routing
> > tables, rules and Netfilter's SNAT, we have the following:
> > 
> > # ip rule
> > 0: from all lookup local 
> > 32747: from all fwmark 0x2 lookup Inter 
> > 32748: from all fwmark 0x1 lookup CANTV 
> 
> These 2 look good, but what rules are you using to mark packets?

These two rules selects the packets based on the mark and send them to
Inter or CANTV; right? To discrimine based on traffic I did test the
following:

Declare two incoming meters to look at them every time a new packet is
generated: (I'm unsure about the values of --rateest-ewma and
--rateest-interval but I'll test it better when SNAT works correctly)

# iptables -t mangle -A INPUT -i wan \
-j RATEEST --rateest-name wan1medidor --rateest-interval 1s
--rateest-ewma 2s

# iptables -t mangle -A INPUT -i wan2 \
-j RATEEST --rateest-name wan2medidor --rateest-interval 1s
--rateest-ewma 2s

All OUTPUT traffic passes throught the following chain (this can be
improved)

# iptables -t mangle -I OUTPUT -j Balancea

The mark of the connection is written into the packet:

# iptables -t mangle -A Balancea -j CONNMARK --restore-mark

If the packet belongs to an existing connection, it doesn't enters to
the path decision based on bandwidth, so it will follow the rule (prio
32747 or prio 32748) based on the mark the connection has.

# iptables -t mangle -A Balancea -m state --state ESTABLISHED,RELATED -j
ACCEPT

When a new packet is generated locally, the meter 'wan1medidor' is
compared against 'wan2medidor' and based on the difference of bandwidth,
'Marca-CANTV' or 'Marca-Inter' targets will be followed:

# iptables -t mangle -A Balancea -m conntrack --ctstate NEW \
-m rateest \
--rateest-delta \
--rateest1 wan1medidor \
--rateest-bps1 ${WAN1_RATE} \
--rateest-gt \
--rateest2 wan2medidor \
--rateest-bps2 ${WAN2_RATE} \
-j Marca-CANTV

# iptables -t mangle -A Marca-CANTV -j MARK --set-mark 1
# iptables -t mangle -A Marca-CANTV -j CONNMARK --save-mark

These last three sentences has its corresponding ISP2 construction, so
it was omitted for simplicity.

This '-m conntrack --ctstate NEW' is the same as '-m state --state NEW'?

This ipt_rateest module lacks a /proc interface to read the
instantaneous values of the meters. :-)

Maybe I'm missing something about this load balancing code but now I
didn't using it because of the issue with SNAT not related with the
balancing, so that's why I didn't write this code in the original
message to avoid increasing entropy!

> > 32750: from x.x.90.26 lookup Inter 
> > 32751: from x.x.222.247 lookup CANTV 
> 
> I don't think you need these - packets are already on their way back in
> regardless.

These are because of the incoming traffic not related to outgoing
generated traffic, i.e. if someone reachs me using the IP address of
ISP1 or ISP2, all communication will be through the link in which the
packet comes from. If the packet does not satisfy having a mark (1 or 2)
surely it was not generated locally and then it is not susceptible for a
load balancing. Can cause some conflict or are these useless after
defining fwmarks?
 
> > # ip route show table Inter
> > x.x.64.0 dev wan2 scope link src x.x.90.26 
> 
> Not sure that you need this.

Also I'm not sure; seems to be pleonastic? :-)

> > default via x.x.64.1 dev wan2
> 
> You do need this.

Yes!
 
> > At this point I have some questions:
> > 
> > 1) The routing path "127.0.0.0/8 dev lo  scope link" needs to be in both
> > routing tables? if so, why? what is its purpose?
> > 
> 
> I don't think you need that.

Ok; also I think this is not needed. 

> > 2) The main routing table had to have both default routes like above or
> > this is a mistake in the addition? only one (the "default", i.e.
> > preferred) gateway or both using multipath nexthop mechanism?
> 
> Depends what you are trying to achieve. I would leave just one in there.
> If you get your load balancing rules right then it shouldn't be used,
> except for things like locally generated traffic.

Depends on if the traffic is locally generated or is being forwarded?
How? Now I'm testing all these iptables and iproute2 rules with only
locally generated traffic! That's why always I'm talking about OUTPUT
and not PREROUTING or FORWARD chains.

My plan is to extend/generalize these rules to output/forward when it
works perfectly for output traffic. Should I run VirtualBox with its
network interface attached to my LAN interface in bridging mode to test
all this mark and SNAT things correctly?
 
> > Regardless what configuration is used, some packets leaves one interface
> > with the IP address of the other, so I hoped this can be fixed with two
> > NAT rules:
> > 
> > # iptables -t nat -F
> > # iptables -t nat -A POSTROUTING -o wan2 -j SNAT --to-source x.x.90.26
> > # iptables -t nat -A POSTROUTING -o wan -j SNAT --to-source x.x.222.247
> > # conntrack -F
> > # ip route flush cache
> > 
> > However this only reduces the routing of packets with the incorrect
> > address but is not completely stopped. I.e. SNAT seems to be not
> > applying to all the traffic, maybe only to certain combination of TCP
> > flags. 
> 
> That doesn't seem right to me; the rules above should catch everything.
> Maybe it is something to do with the extra rules above?

Ok, good if these rules are badly written because the problem seems to
be NAT-related!

I write them having in mind that every packet that leaves interface
'wan' must have the IP address of this interface; the same applies to
'wan2' interface; so I think the first rule will match only if the
packet is going to leave wan2 (and then it should have the IP address of
wan2 interface), and the second rule will match only if the packet is
going to leave 'wan' interface.

The result is having on wan2 packets whose source address is the IP
address of wan, and vice versa.
 
> > This marks all OUTPUT packets regardless anything (NEW,
> > ESTABLISHED, ...)? If so, why not all these packets, after crossing
> > routing tables and are ready to be sent to wan/wan2 are natted?
> 
> I don't know. Can I suggest that you look at the tutorial below? It
> looks like it should help you do what you want to achieve:
> 
> http://www.sysresccd.org/Sysresccd-Networking-EN-Iptables-and-netfilter-load-balancing-using-connmark

Yes! Also I did read this, is really good! Even running almost exactly
the script in this tutorial gave me wrong results with SNAT.

Thanks Andy for your help!!

Best regards!

