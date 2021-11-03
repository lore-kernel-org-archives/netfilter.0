From: Timothy Ham <timothyham@protonmail.com>
Subject: Re: Improvements to the Home Router Wiki page
Date: Wed, 03 Nov 2021 07:16:26 +0000
Message-ID: <AY1OAB6atWjjzXHRjIZMysPX2h_ROtF5WNJoW5U-qUpy0umNgg3LZ-ow-o98TC1xMEhJJHn6fHaHYxPInr59zsRRs4gRUL_5Vmkth438PrE=@protonmail.com>
References: <9EwLs4Z4lDrYS0hyZoApmQ2StFQlMHrKwhKRXtSsUCDf0G6p5_e5JCcrjz9T4vCV7TXVYZHX_egqjtKbSsPBoBMl2SAEODG-kOU1u8j-LgY=@protonmail.com> <YYEhmehrFUc8c1Ok@salvia>
Reply-To: Timothy Ham <timothyham@protonmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1635923787;
        bh=i3v9od6QMRig0uDim7kC/PzkFW6GukVmv1vboqstck4=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=Th51WvkQk1swcO9Vs9KBsQRr6oAipSMT1XBDEzS6ZSUAtnwYf8+sfawHzghVbCNNL
         2/prE3f9ZwgOqz7i7UO4DGm5UkHFVipmyPyO/cJ6L3UWvT9ojB40wJduNLBEkWZThM
         0or2S0tGgtuNu3aQ65yZWUm6hnoqhunX6CqJO2RQ=
In-Reply-To: <YYEhmehrFUc8c1Ok@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Thanks for the reply. My responses are inlined below.


On Tuesday, November 2nd, 2021 at 4:31 AM, Pablo Neira Ayuso <pablo@netfilt=
er.org> wrote:
> On Sat, Oct 30, 2021 at 09:39:07PM +0000, Timothy Ham wrote:
>
> > Hello,
> >
> > I have benefited from the wiki page "Simple ruleset for a home router" =
found here:
> >
> > https://wiki.nftables.org/wiki-nftables/index.php/Simple_ruleset_for_a_=
home_router
> >
> > Still, it doesn't cover port forwarding and hairpin NAT. So after sever=
al hours of trying different things, I've finally figured out how to do the=
m, and improved the example config. Could someone in charge please update t=
he example on the wiki? Specifically the example config given in the sectio=
n "Simple router using ppp interface". I've kept everything the same except=
 the few lines I've added.
> >
> > If my config can be improved further, please suggest more changes as we=
ll.
>
> I'm assuming nftables 1.0.0 for the comments below.

I'm actually using 0.9.8-3.1 on Debian 11. I hope there are no big differen=
ces.

>
> > Thank you.
> >
> > =3D=3D=3D=3D begin =3D=3D=3D=3D
> >
> > flush ruleset
> >
> > define DEV_PRIVATE =3D eth1
> >
> > define DEV_WORLD =3D ppp0
> >
> > define NET_PRIVATE =3D 192.168.0.0/16
> >
> > define IP_WAN =3D x.x.x.x
> >
> > define IP_ROUTER =3D 192.168.0.1
> >
> > define IP_SERVER =3D 192.168.0.10
> >
> > table ip global {
> >
> > chain prerouting {
> >
> > type nat hook prerouting priority dstnat;
> >
> >           # Hairpin NAT part 1/2. WAN IP address must be known
> >           ip daddr $IP_WAN tcp dport 443 dnat to $IP_SERVER:8443
> >           ip daddr $IP_WAN tcp dport 80 dnat to $IP_SERVER:8080
> >
>
> Consolidate this rule using a map:
>
> ip daddr $IP_WAN dnat to tcp dport map { 443 : $IP_SERVER . 8443, 80 : $I=
P_SERVER . 8080 }
>
> >           # Port forwarding part 1/2
> >           iifname $DEV_WORLD tcp dport 443 dnat to $IP_SERVER:8443
> >           iifname $DEV_WORLD tcp dport 80 dnat to $IP_SERVER:8080
> >
>
> Is this rule is redundant? is $IP_WAN the IP address of $DEV_WORLD?

Yes, these rules are functional duplicates. However....

If one is only using port forwarding, the second set of rules are much more=
 preferable because the IP address of the WAN does not need to be specified=
. However, when using hairpin NAT, the WAN's IP address must be specified, =
as far as I know. So with this configuration, I need an external script to =
update the $WAN_IP whenever that changes. If there is a way to do this in n=
ftables without knowing the $WAN_IP for hairpin NAT, that would be great. I=
 was able to get OpenBSD PF to perform hairpin NAT without specifying the W=
AN_IP in the config file, but have been unable to do it with nftables.

Anyways, I thought most people would use this example script as a template,=
 and comment out what they don't need. As such, since hairpin NAT is not th=
at common, I wanted to present it in a way that a novice can comment out in=
dependent bits.

> >     }
> >
> >     chain inbound_world {
> >         # accepting ping (icmp-echo-request) for diagnostic purposes.
> >         # However, it also lets probes discover this host is alive.
> >         # This sample accepts them within a certain rate limit:
> >         #
> >         # icmp type echo-request limit rate 5/second accept
> >
> >         # allow SSH connections from some well-known internet host
> >         ip saddr 81.209.165.42 tcp dport ssh accept
> >     }
> >
> >     chain inbound_private {
> >         # accepting ping (icmp-echo-request) for diagnostic purposes.
> >         icmp type echo-request limit rate 5/second accept
> >
> >         # allow DHCP, DNS and SSH from the private network
> >         ip protocol . th dport vmap { tcp . 22 : accept, udp . 53 : acc=
ept, tcp . 53 : accept, udp . 67 : accept}
> >     }
> >
> >     chain inbound {
> >         type filter hook input priority 0; policy drop;
> >
> >         # Allow traffic from established and related packets, drop inva=
lid
> >         ct state vmap { established : accept, related : accept, invalid=
 : drop }
> >
> >         # allow loopback traffic, anything else jump to chain for furth=
er evaluation
> >         iifname vmap { lo : accept, $DEV_WORLD : jump inbound_world, $D=
EV_PRIVATE : jump inbound_private }
> >
> >         # the rest is dropped by the above policy
> >     }
> >
> >     chain forward {
> >         type filter hook forward priority 0; policy drop;
> >
>
> You could move these rules below the verdict map...
>
> >         # port forwarding part 2/2
> >         meta iifname $DEV_WORLD ip daddr $IP_SERVER tcp dport 8443 ct s=
tate new accept
> >         meta iifname $DEV_WORLD ip daddr $IP_SERVER tcp dport 8080 ct s=
tate new accept
> >
> >         # Allow traffic from established and related packets, drop inva=
lid
> >         ct state vmap { established : accept, related : accept, invalid=
 : drop }
> >
>
> ... 'ct state new,untracked' is implicitly assumed after vmap, so you
>
> could move (and consolidate) this rule:
>
> meta iifname $DEV_WORLD ip daddr $IP_SERVER tcp dport { 8443, 8080 } acce=
pt
>

Yes. Again, I wanted to be able for people to just comment out what they do=
n't need for this template.

> >         # connections from the internal net to the internet or to other
> >         # internal nets are allowed
> >         iifname $DEV_PRIVATE accept
> >
> >         # the rest is dropped by the above policy
> >     }
> >
> >     chain postrouting {
> >         type nat hook postrouting priority 100; policy accept;
> >
> >         # hairpin part 2/2
> >         ip saddr $NET_PRIVATE ip daddr $IP_SERVER tcp dport 8443 snat $=
ROUTER
> >         ip saddr $NET_PRIVATE ip daddr $IP_SERVER tcp dport 8080 snat $=
ROUTER
> >
>
> Consolidate rule:
>
> ip saddr $NET_PRIVATE ip daddr $IP_SERVER tcp dport { 8080, 8443 } snat $=
ROUTER
>
> however, if the routing table allows to reach your $IP_SERVER from
>
> $NET_PRIVATE, then you do not need this NAT rule.

Actually, hairpin NAT does not work without this rule. I believe the reason=
 is that the reply packet from the $IP_SERVER would have $ROUTER as its dad=
dr, and that packet needs to be NATed back to the requesting client inside =
$NET_PRIVATE.

> >         # masquerade private IP addresses
> >         ip saddr $NET_PRIVATE oifname $DEV_WORLD masquerade
> >     }
> >
> >
> > }
> >
> > =3D=3D=3D=3D end =3D=3D=3D=3D

Thank you much for your feedback!
