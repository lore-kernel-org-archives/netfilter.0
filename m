From: Thomas Jacob <jacob@internet24.de>
Subject: Re: still can't route using fwmark
Date: Mon, 20 Apr 2009 13:44:22 +0200
Message-ID: <1240227862.27336.43.camel@enterprise.ims-firmen.de>
References: <op.uskfabufx1lyi3@localhost>
	 <20090418082314.GA12566@internet24.de> <op.usld3aqfx1lyi3@localhost>
	 <20090418184809.GA15649@internet24.de> <op.uslkl80px1lyi3@localhost>
	 <20090418205802.GA16790@internet24.de> <op.uslqwresx1lyi3@localhost>
	 <20090419090016.GA19987@internet24.de> <op.usn740lix1lyi3@localhost>
	 <145d4e1a0904200148p23d66274h8c0eb0a28ccf568b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <145d4e1a0904200148p23d66274h8c0eb0a28ccf568b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Javier =?ISO-8859-1?Q?G=E1lvez?= Guerrero <javier.galvez.guerrero@gmail.com>
Cc: Lloyd Standish <lloyd@crnatural.net>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I haven't read thru all this, and you also haven't posted
your TOS variant, but a few observations:

You should use CONNMARK like Lloyd does, MARK does not
affect the connection, just a single packet, and you have to
reconstruct your MARK values for each packet.

Your TOS rules most likely change the packet TOS field, and that
is sort of "sticky" if all the intermediate hosts play ball,
according to the standards, i.e. does do something like CONNMARK
does.

Also be aware of the different paths thru the various
chains taken by packets from/to the local host and
by forwarded packets.

A small ascii diagram for your setup would be very helpful.

On Mon, 2009-04-20 at 10:48 +0200, Javier G=C3=A1lvez Guerrero wrote:
> Hi,
>=20
> I've been trying something similar to Lloyd's configuration for a lon=
g
> time with no success. I want to reach a host (server) from my laptop
> with two WiFi interfaces attached to different subnetworks/routers;
> the server is in the public network, both routers have public IPs (th=
e
> same domain than the server) while setting up two different private
> networks (192.168.0.0/24 and 192.168.1.0/24), so each WiFi interface
> in my laptop are attached to each one of them.
>=20
> The problem is that I can't manage to dynamically configure which
> interface to be chosen to redirect my traffic. In my case, I want the
> packets with destination port 8554 to be routed to one or other
> interface as I want (so load one network or the other), so I tried to
> change MARK iptables rules accordingly with no success, just getting
> what Lloyd had: packets are routed through the default route in the
> main ip routing table, while if I have not this route configured I
> lose network access, despite having the corresponding tables and rule=
s
> properly configured. What I ended figuring out is that using the TOS
> target it worked properly, but this is not what I'd like to preserve
> as TOS changes the type of service parameter and could affect network
> management beyond my laptop; I need to use MARK to manage my outgoing
> and incoming traffic.
>=20
> This is the script I'm currently using (stripped):
>=20
>     ip route flush table 1
>     ip route flush table 2
>     ip rule del prio 1
>     ip rule del prio 1
>     iptables -F OUTPUT -t mangle
>     iptables -F POSTROUTING -t nat
>     iptables -F PREROUTING -t nat
>=20
>     ip route add default via 192.168.0.1 dev ra0 ---> I need a
> configure a route in the main table! Why?
>     ip route add table 1 192.168.0.0/24 dev ra0
>     ip route add table 1 default via 192.168.0.1 dev ra0
>     ip route add table 2 192.168.1.0/24 dev ra1
>     ip route add table 2 default via 192.168.1.1 dev ra1
>=20
>     ip rule add from all fwmark 1 table 1 prio 1
>     ip rule add from all fwmark 2 table 2 prio 1
>=20
>     iptables -t nat -A POSTROUTING -p tcp --dport 8554 -j SNAT
> --to-source 192.168.0.2
>     iptables -A OUTPUT -t mangle -p tcp --dport 8554 -j MARK --set-ma=
rk 1
>     iptables -t mangle -A PREROUTING -s 147.83.47.178 -j MARK --set-m=
ark 1
>=20
>=20
> So, when I want to change the marking rules:
>=20
> 	iptables -t nat -R POSTROUTING 1 -p tcp --dport 8554 -j SNAT
> --to-source 192.168.1.2
> 	iptables -R OUTPUT 1 -t mangle -p tcp --dport 8554 -j MARK --set-mar=
k 2
> 	iptables -t mangle -R PREROUTING 1 -s 147.83.47.178 -j MARK --set-ma=
rk 2
>=20
>=20
> Anyway, I'm not able to get this working, but only when the selected
> IP matches the default IP in the main routing table, so... it doesn't
> work. Changing MARKing rules with TOS works.
>=20
> So, I can't dynamically change the used interface for the selected pa=
ckets.
>=20
>=20
> I opened a bug (#589) in the Netfilter bugzilla system and Jan
> Engelhardt has kindly tried to help me but I haven't been able to
> solve it yet.
>=20
> By the way, I'm using kernel 2.6.27-11 wit iptables 1.4.0.
>=20
>=20
> Any help would be much appreciated, as I'm not sure if this is really
> a bug or just a problem with iptables rules understanding or misuse.
>=20
>=20
> Regards,
> Javi
>=20
> 2009/4/20 Lloyd Standish <lloyd@crnatural.net>
> >
> > On Sun, 19 Apr 2009 03:00:17 -0600, Thomas Jacob <jacob@internet24.=
de> wrote:
> >
> > >>Well, I want to load-balance packets from the local machine, whic=
h is serving as gateway for a home LAN (eth0).  The local machine is 19=
2.168.1.1 on the LAN.
> > >
> > > Then your current setup in PREROUTING is what you want to go for,=
 just keep
> > > in mind that this does not give you load balancing for connection=
s originating
> > > from your router box, just the ones from your LAN.
> >
> > I'm sorry, I don't understand.   According to what you are saying, =
I should not get any load balancing, since all my testing up until now =
has been with connections (to the Internet) originating on the router b=
ox.  (I haven't even tried connecting from the LAN.)
> >
> > However, the packets originating on the router box *are* showing up=
 in the conntrack table with the fwmark, put there by my prerouting rul=
es.  Is there a reason why they should not be pushed out the interface =
specified by the rt_link1/2 tables?  (As far as I can tell, my user-def=
ined routing tables are ignored, and the default route in the "main" ta=
ble is always used.)
> >
> > >
> > > C.f.: http://ebtables.sourceforge.net/br_fw_ia/bridge3b.png
> > >
> > > I'm not sure why you need NAT on your eth0 though then, what are =
you
> > > trying to achieve with this? But that should not be the cause
> > > of the load balancing failure.
> >
> > I was trying to masquerade any LAN-connected machine so it could co=
nnect to the Internet through the router box, but I mistakenly specifie=
d "-o eth0" instead of Internet connected interface.
> >
> > The lines:
> > iptables -t nat -A POSTROUTING -o ppp0 -j SNAT1
> > iptables -t nat -A POSTROUTING -o ppp1 -j SNAT2
> > should do the masquerading I suppose, although the idea was not tha=
t, but rather to fix the source address of outgoing packets to coincide=
 with the IP of the interface (ppp0 or ppp1).
> >
> > >
> > >> When I remove the default route in the main routing table, I com=
pletely lose Internet connectivity.   My logic tells me that a default =
"main" route should not be necessary at all if all packets are marked a=
nd sent to my 2 custom routing tables (rt_link1/2), each of which has a=
 default route.
> > >
> > > That's right, but if all your /proc/net/ip_conntrack entries cont=
ain mark values
> > > then there really must be something wrong with the fw mark <-> ro=
ute interaction.
> > >
> > > My suggestion is to try this with the lastest IPtables user space=
 and 2.6.27.X for
> > > instance, then maybe more people have a comparable setup to look =
at.
> > That's good advice, although I can't use kernel 2.6.27 I'm afraid. =
 At some point after 2.6.21 the code for a USB serial driver changed.  =
I have to patch that driver to make my USB-connected GPRS (ppp over GSM=
 cell phone) modem work.  (I already hacked the patch once, after the d=
river code changed between kernel 2.4 and 2.6, and I don't want to have=
 to do it again.)  GPRS is my only Internet option in my remote area of=
 Costa Rica.
> >
> > My idea was to download the 2.6.18.8 kernel and use it with iptable=
s v1.3.6, which as you pointed out previously ought to have the functio=
nality I need.  (It is a drag to be tied to an old kernel version due t=
o hardware dependency.)
> > >
> > > Do you know about LARTC? The best way to get started IMO: http://=
lartc.org/
> >
> > Yes, I downloaded the tutorial a couple of days ago, thanks!
> >
> > --
> > Lloyd
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter=
" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

