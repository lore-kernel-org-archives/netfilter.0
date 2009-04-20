From: =?ISO-8859-1?Q?Javier_G=E1lvez_Guerrero?= 
	<javier.galvez.guerrero@gmail.com>
Subject: Re: still can't route using fwmark
Date: Mon, 20 Apr 2009 10:48:43 +0200
Message-ID: <145d4e1a0904200148p23d66274h8c0eb0a28ccf568b@mail.gmail.com>
References: <op.uskfabufx1lyi3@localhost>
	 <20090418082314.GA12566@internet24.de> <op.usld3aqfx1lyi3@localhost>
	 <20090418184809.GA15649@internet24.de> <op.uslkl80px1lyi3@localhost>
	 <20090418205802.GA16790@internet24.de> <op.uslqwresx1lyi3@localhost>
	 <20090419090016.GA19987@internet24.de> <op.usn740lix1lyi3@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=MGL464RfJq5lU1Lra2D3UEpAUfzFJqO/n0PdgWcKBTQ=;
        b=LYD9CHum6NYLiNxri/MpL3zQ5Qf61lwhwB6o5aeONHETRU8yBY2maq73CZwQys6TyU
         ahWP1LRpPnQlMDRYLJOrfVUQrK93OywEbMLgvMvDzIZiu2nwJc36L7Z+X2ZvG78vG1pU
         aCNgG3S1QXJ5iTvC0C9+TvCbme0HPpciDaHgk=
In-Reply-To: <op.usn740lix1lyi3@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: Thomas Jacob <jacob@internet24.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

I've been trying something similar to Lloyd's configuration for a long
time with no success. I want to reach a host (server) from my laptop
with two WiFi interfaces attached to different subnetworks/routers;
the server is in the public network, both routers have public IPs (the
same domain than the server) while setting up two different private
networks (192.168.0.0/24 and 192.168.1.0/24), so each WiFi interface
in my laptop are attached to each one of them.

The problem is that I can't manage to dynamically configure which
interface to be chosen to redirect my traffic. In my case, I want the
packets with destination port 8554 to be routed to one or other
interface as I want (so load one network or the other), so I tried to
change MARK iptables rules accordingly with no success, just getting
what Lloyd had: packets are routed through the default route in the
main ip routing table, while if I have not this route configured I
lose network access, despite having the corresponding tables and rules
properly configured. What I ended figuring out is that using the TOS
target it worked properly, but this is not what I'd like to preserve
as TOS changes the type of service parameter and could affect network
management beyond my laptop; I need to use MARK to manage my outgoing
and incoming traffic.

This is the script I'm currently using (stripped):

=A0=A0=A0 ip route flush table 1
=A0=A0=A0 ip route flush table 2
=A0=A0=A0 ip rule del prio 1
=A0=A0=A0 ip rule del prio 1
=A0=A0=A0 iptables -F OUTPUT -t mangle
=A0=A0=A0 iptables -F POSTROUTING -t nat
=A0=A0=A0 iptables -F PREROUTING -t nat

    ip route add default via 192.168.0.1 dev ra0 ---> I need a
configure a route in the main table! Why?
    ip route add table 1 192.168.0.0/24 dev ra0
    ip route add table 1 default via 192.168.0.1 dev ra0
    ip route add table 2 192.168.1.0/24 dev ra1
    ip route add table 2 default via 192.168.1.1 dev ra1

=A0=A0=A0 ip rule add from all fwmark 1 table 1 prio 1
=A0=A0=A0 ip rule add from all fwmark 2 table 2 prio 1

    iptables -t nat -A POSTROUTING -p tcp --dport 8554 -j SNAT
--to-source 192.168.0.2
    iptables -A OUTPUT -t mangle -p tcp --dport 8554 -j MARK --set-mark=
 1
    iptables -t mangle -A PREROUTING -s 147.83.47.178 -j MARK --set-mar=
k 1


So, when I want to change the marking rules:

	iptables -t nat -R POSTROUTING 1 -p tcp --dport 8554 -j SNAT
--to-source 192.168.1.2
	iptables -R OUTPUT 1 -t mangle -p tcp --dport 8554 -j MARK --set-mark =
2
	iptables -t mangle -R PREROUTING 1 -s 147.83.47.178 -j MARK --set-mark=
 2


Anyway, I'm not able to get this working, but only when the selected
IP matches the default IP in the main routing table, so... it doesn't
work. Changing MARKing rules with TOS works.

So, I can't dynamically change the used interface for the selected pack=
ets.


I opened a bug (#589) in the Netfilter bugzilla system and Jan
Engelhardt has kindly tried to help me but I haven't been able to
solve it yet.

By the way, I'm using kernel 2.6.27-11 wit iptables 1.4.0.


Any help would be much appreciated, as I'm not sure if this is really
a bug or just a problem with iptables rules understanding or misuse.


Regards,
Javi

2009/4/20 Lloyd Standish <lloyd@crnatural.net>
>
> On Sun, 19 Apr 2009 03:00:17 -0600, Thomas Jacob <jacob@internet24.de=
> wrote:
>
> >>Well, I want to load-balance packets from the local machine, which =
is serving as gateway for a home LAN (eth0). =A0The local machine is 19=
2.168.1.1 on the LAN.
> >
> > Then your current setup in PREROUTING is what you want to go for, j=
ust keep
> > in mind that this does not give you load balancing for connections =
originating
> > from your router box, just the ones from your LAN.
>
> I'm sorry, I don't understand. =A0 According to what you are saying, =
I should not get any load balancing, since all my testing up until now =
has been with connections (to the Internet) originating on the router b=
ox. =A0(I haven't even tried connecting from the LAN.)
>
> However, the packets originating on the router box *are* showing up i=
n the conntrack table with the fwmark, put there by my prerouting rules=
=2E =A0Is there a reason why they should not be pushed out the interfac=
e specified by the rt_link1/2 tables? =A0(As far as I can tell, my user=
-defined routing tables are ignored, and the default route in the "main=
" table is always used.)
>
> >
> > C.f.: http://ebtables.sourceforge.net/br_fw_ia/bridge3b.png
> >
> > I'm not sure why you need NAT on your eth0 though then, what are yo=
u
> > trying to achieve with this? But that should not be the cause
> > of the load balancing failure.
>
> I was trying to masquerade any LAN-connected machine so it could conn=
ect to the Internet through the router box, but I mistakenly specified =
"-o eth0" instead of Internet connected interface.
>
> The lines:
> iptables -t nat -A POSTROUTING -o ppp0 -j SNAT1
> iptables -t nat -A POSTROUTING -o ppp1 -j SNAT2
> should do the masquerading I suppose, although the idea was not that,=
 but rather to fix the source address of outgoing packets to coincide w=
ith the IP of the interface (ppp0 or ppp1).
>
> >
> >> When I remove the default route in the main routing table, I compl=
etely lose Internet connectivity. =A0 My logic tells me that a default =
"main" route should not be necessary at all if all packets are marked a=
nd sent to my 2 custom routing tables (rt_link1/2), each of which has a=
 default route.
> >
> > That's right, but if all your /proc/net/ip_conntrack entries contai=
n mark values
> > then there really must be something wrong with the fw mark <-> rout=
e interaction.
> >
> > My suggestion is to try this with the lastest IPtables user space a=
nd 2.6.27.X for
> > instance, then maybe more people have a comparable setup to look at=
=2E
> That's good advice, although I can't use kernel 2.6.27 I'm afraid. =A0=
At some point after 2.6.21 the code for a USB serial driver changed. =A0=
I have to patch that driver to make my USB-connected GPRS (ppp over GSM=
 cell phone) modem work. =A0(I already hacked the patch once, after the=
 driver code changed between kernel 2.4 and 2.6, and I don't want to ha=
ve to do it again.) =A0GPRS is my only Internet option in my remote are=
a of Costa Rica.
>
> My idea was to download the 2.6.18.8 kernel and use it with iptables =
v1.3.6, which as you pointed out previously ought to have the functiona=
lity I need. =A0(It is a drag to be tied to an old kernel version due t=
o hardware dependency.)
> >
> > Do you know about LARTC? The best way to get started IMO: http://la=
rtc.org/
>
> Yes, I downloaded the tutorial a couple of days ago, thanks!
>
> --
> Lloyd
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
