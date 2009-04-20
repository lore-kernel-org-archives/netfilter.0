From: Thomas Jacob <jacob@internet24.de>
Subject: Re: still can't route using fwmark
Date: Mon, 20 Apr 2009 15:37:38 +0200
Message-ID: <1240234658.27336.66.camel@enterprise.ims-firmen.de>
References: <op.uskfabufx1lyi3@localhost> <op.usld3aqfx1lyi3@localhost>
	 <20090418184809.GA15649@internet24.de> <op.uslkl80px1lyi3@localhost>
	 <20090418205802.GA16790@internet24.de> <op.uslqwresx1lyi3@localhost>
	 <20090419090016.GA19987@internet24.de> <op.usn740lix1lyi3@localhost>
	 <145d4e1a0904200148p23d66274h8c0eb0a28ccf568b@mail.gmail.com>
	 <1240227862.27336.43.camel@enterprise.ims-firmen.de>
	 <145d4e1a0904200608i45d9cf09sce1c38ab42cd316@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <145d4e1a0904200608i45d9cf09sce1c38ab42cd316@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Javier =?ISO-8859-1?Q?G=E1lvez?= Guerrero <javier.galvez.guerrero@gmail.com>
Cc: netfilter@vger.kernel.org

Nice diagram ;)

Well, it is as thought, your TOS rules set TOS fields in the packets
and those are usually bounced back to you from the reply direction,
so effectively you are using something like CONNMARK already.

Jan's item 5 description is definitely a good starting point.

Maybe you could try this, I am assuming that you really
are talking only about connections originating from client
here:


    iptables -F OUTPUT -t mangle
    iptables -F POSTROUTING -t nat
    iptables -F PREROUTING -t nat


    iptables -t nat -A POSTROUTING -p tcp --dport 8554 -j SNAT
--to-source 192.168.0.2

    iptables -t mangle -A INPUT   -j CONNMARK --restore-mark

    iptables -t mangle -A OUTPUT -m state --state NEW \
        -p tcp --dport 8554 -d 147.83.47.178 -j CONNMARK --set-mark 1
    iptables -t mangle -A OUTPUT   -j CONNMARK --restore-mark


If you want to load balance connections from the local net you need
to use PREROUTING like Jan does. See the chain traversal diagrams I
posted in the reply to Lloyd, understanding which packets pass thru
which chains is really important for stuff like this.

On Mon, 2009-04-20 at 15:08 +0200, Javier G=C3=A1lvez Guerrero wrote:
> Thanks for your answer, Thomas.
>=20
> Once I explained to Jan what I had to implement, he pointed me to the
> item 5 in http://dev.medozas.de/NF-Cookbook.txt, so I've also used
> CONNTRACK with no success:
>=20
> "I'll try to explain what I need to implement. I'm developing a daemo=
n
> application that manages WiFi handovers between two private networks
> (192.168.0.0/24 and 192.168.1.0/24) using two different WiFi NICs.
> When the link RSSI becomes low enough, the application triggers the
> handover in order to keep a seamless video streaming service, so firs=
t
> I must attach to the new network with the inactive NIC, ask for the
> media content through it (the video session configuration is done
> through the server port 8554) and, once I'm receiving the content
> through the new link (the media content is actually sent from and to
> ports differents from 8554), detach de old one.
>=20
> In order to do this in a seamless way I need to play with ip route, i=
p
> rule and iptables. Marking traffic with iptables is not enough as it
> is done in POSTROUTING, so the kernel previously decides which IP the
> packets will have according to the default route in the main ip
> routing table. Using MARK I send the packet through the interface I
> want in each specific moment, while with SNAT I change the source IP
> to the one attached to the used interface (thus changing the IP given
> by the default routing table in case the new interface is not the one
> configured as the default one). The received (answer) packets should
> come through the same interface with the corresponding IP but they
> just follow the route configured in the default ip routing table (the=
n
> not matching the connection established according to my custom setup)=
,
> so I need to setup more MARKing and ip rules so the local application
> receives and delivers packets accordingly. This is where MARK fails
> and TOS success, but I don't want to mess TOS network configuration
> and use a more proper packet mangling with MARK as the only device
> that should care about the handover is the client device."
>=20
>=20
>=20
> Anyway, it didn't work: as soon as I change the default route in the
> main table the old connection is broken. Instead, connections should
> be established and maintained through the links pointed in the
> respective tables (not the main one), according with the marking rule=
s
> (that's what I need, to have two connections established with
> different interfaces and to different networks and dynamically chose
> one of both to send and receive the video stream).
>=20
> Time for ASCII art (quite "simple"):
>=20
>                                ,''''''''''''''`.
>                                |  Server |
>                                L_______J  147.83.47.178
>                                  _/__
>                               ,-'       `-.
>                             ,'               `.
>                            |                   '.
>                            |     Network  |
>                           /\                   /
>                          /  \                /.
>                        ,'    `._        _,'  `.
>                       /         `----'          `.
>                  |---'--------Y           ....:.............
>                  |              |          |                   |
>                  |Router A|           |    Router B |
>                  '------------            `.................'
>          192.168.0.0/24             192.168.1.0/24
>=20
>=20
>                                        ,'''''''''''''''''''|
>                          ra0        |               |  ra1
>                                       |     Client |
>                   192.168.0.2  L________|  192.168.1.2
>=20
>=20
>=20
> The rules with TOS are exactly the same just changing the marking
> parameters by the TOS ones:
>=20
> ip rule add from all tos 0x10 table 1 prio 1
> ip rule add from all tos 0x04 table 2 prio 1
>=20
> iptables -t nat -A POSTROUTING -p tcp --dport 8554 -j SNAT --to-sourc=
e
> 192.168.0.2
> iptables -A OUTPUT -t mangle -p tcp --dport 8554 -j TOS --set-tos 0x1=
0
> iptables -A PREROUTING -t mangle -s 147.83.47.178 -j TOS --set-tos 0x=
10
>=20
> iptables -t nat -R POSTROUTING 1 -p tcp --dport 8554 -j SNAT
> --to-source 192.168.1.2
> iptables -R OUTPUT 1 -t mangle -p tcp --dport 8554 -j TOS --set-tos 0=
x04
> iptables -R PREROUTING 1 -t mangle -s 147.83.47.178 -j TOS --set-tos =
0x04
>=20
>=20
> This works but, as said before, I don't what this TOS stuff to be use=
d.
>=20
>=20
> So... any idea why the previous "item 5" didn't work for my
> environment? What should I try?
>=20
>=20
> Thank you for your help,
> Javi
>=20
>=20
> El d=C3=ADa 20 de abril de 2009 13:44, Thomas Jacob <jacob@internet24=
=2Ede> escribi=C3=B3:
> > I haven't read thru all this, and you also haven't posted
> > your TOS variant, but a few observations:
> >
> > You should use CONNMARK like Lloyd does, MARK does not
> > affect the connection, just a single packet, and you have to
> > reconstruct your MARK values for each packet.
> >
> > Your TOS rules most likely change the packet TOS field, and that
> > is sort of "sticky" if all the intermediate hosts play ball,
> > according to the standards, i.e. does do something like CONNMARK
> > does.
> >
> > Also be aware of the different paths thru the various
> > chains taken by packets from/to the local host and
> > by forwarded packets.
> >
> > A small ascii diagram for your setup would be very helpful.
> >
> > On Mon, 2009-04-20 at 10:48 +0200, Javier G=C3=A1lvez Guerrero wrot=
e:
> >> Hi,
> >>
> >> I've been trying something similar to Lloyd's configuration for a =
long
> >> time with no success. I want to reach a host (server) from my lapt=
op
> >> with two WiFi interfaces attached to different subnetworks/routers=
;
> >> the server is in the public network, both routers have public IPs =
(the
> >> same domain than the server) while setting up two different privat=
e
> >> networks (192.168.0.0/24 and 192.168.1.0/24), so each WiFi interfa=
ce
> >> in my laptop are attached to each one of them.
> >>
> >> The problem is that I can't manage to dynamically configure which
> >> interface to be chosen to redirect my traffic. In my case, I want =
the
> >> packets with destination port 8554 to be routed to one or other
> >> interface as I want (so load one network or the other), so I tried=
 to
> >> change MARK iptables rules accordingly with no success, just getti=
ng
> >> what Lloyd had: packets are routed through the default route in th=
e
> >> main ip routing table, while if I have not this route configured I
> >> lose network access, despite having the corresponding tables and r=
ules
> >> properly configured. What I ended figuring out is that using the T=
OS
> >> target it worked properly, but this is not what I'd like to preser=
ve
> >> as TOS changes the type of service parameter and could affect netw=
ork
> >> management beyond my laptop; I need to use MARK to manage my outgo=
ing
> >> and incoming traffic.
> >>
> >> This is the script I'm currently using (stripped):
> >>
> >>     ip route flush table 1
> >>     ip route flush table 2
> >>     ip rule del prio 1
> >>     ip rule del prio 1
> >>     iptables -F OUTPUT -t mangle
> >>     iptables -F POSTROUTING -t nat
> >>     iptables -F PREROUTING -t nat
> >>
> >>     ip route add default via 192.168.0.1 dev ra0 ---> I need a
> >> configure a route in the main table! Why?
> >>     ip route add table 1 192.168.0.0/24 dev ra0
> >>     ip route add table 1 default via 192.168.0.1 dev ra0
> >>     ip route add table 2 192.168.1.0/24 dev ra1
> >>     ip route add table 2 default via 192.168.1.1 dev ra1
> >>
> >>     ip rule add from all fwmark 1 table 1 prio 1
> >>     ip rule add from all fwmark 2 table 2 prio 1
> >>
> >>     iptables -t nat -A POSTROUTING -p tcp --dport 8554 -j SNAT
> >> --to-source 192.168.0.2
> >>     iptables -A OUTPUT -t mangle -p tcp --dport 8554 -j MARK --set=
-mark 1
> >>     iptables -t mangle -A PREROUTING -s 147.83.47.178 -j MARK --se=
t-mark 1
> >>
> >>
> >> So, when I want to change the marking rules:
> >>
> >>       iptables -t nat -R POSTROUTING 1 -p tcp --dport 8554 -j SNAT
> >> --to-source 192.168.1.2
> >>       iptables -R OUTPUT 1 -t mangle -p tcp --dport 8554 -j MARK -=
-set-mark 2
> >>       iptables -t mangle -R PREROUTING 1 -s 147.83.47.178 -j MARK =
--set-mark 2
> >>
> >>
> >> Anyway, I'm not able to get this working, but only when the select=
ed
> >> IP matches the default IP in the main routing table, so... it does=
n't
> >> work. Changing MARKing rules with TOS works.
> >>
> >> So, I can't dynamically change the used interface for the selected=
 packets.
> >>
> >>
> >> I opened a bug (#589) in the Netfilter bugzilla system and Jan
> >> Engelhardt has kindly tried to help me but I haven't been able to
> >> solve it yet.
> >>
> >> By the way, I'm using kernel 2.6.27-11 wit iptables 1.4.0.
> >>
> >>
> >> Any help would be much appreciated, as I'm not sure if this is rea=
lly
> >> a bug or just a problem with iptables rules understanding or misus=
e.
> >>
> >>
> >> Regards,
> >> Javi
> >>
> >> 2009/4/20 Lloyd Standish <lloyd@crnatural.net>
> >> >
> >> > On Sun, 19 Apr 2009 03:00:17 -0600, Thomas Jacob <jacob@internet=
24.de> wrote:
> >> >
> >> > >>Well, I want to load-balance packets from the local machine, w=
hich is serving as gateway for a home LAN (eth0).  The local machine is=
 192.168.1.1 on the LAN.
> >> > >
> >> > > Then your current setup in PREROUTING is what you want to go f=
or, just keep
> >> > > in mind that this does not give you load balancing for connect=
ions originating
> >> > > from your router box, just the ones from your LAN.
> >> >
> >> > I'm sorry, I don't understand.   According to what you are sayin=
g, I should not get any load balancing, since all my testing up until n=
ow has been with connections (to the Internet) originating on the route=
r box.  (I haven't even tried connecting from the LAN.)
> >> >
> >> > However, the packets originating on the router box *are* showing=
 up in the conntrack table with the fwmark, put there by my prerouting =
rules.  Is there a reason why they should not be pushed out the interfa=
ce specified by the rt_link1/2 tables?  (As far as I can tell, my user-=
defined routing tables are ignored, and the default route in the "main"=
 table is always used.)
> >> >
> >> > >
> >> > > C.f.: http://ebtables.sourceforge.net/br_fw_ia/bridge3b.png
> >> > >
> >> > > I'm not sure why you need NAT on your eth0 though then, what a=
re you
> >> > > trying to achieve with this? But that should not be the cause
> >> > > of the load balancing failure.
> >> >
> >> > I was trying to masquerade any LAN-connected machine so it could=
 connect to the Internet through the router box, but I mistakenly speci=
fied "-o eth0" instead of Internet connected interface.
> >> >
> >> > The lines:
> >> > iptables -t nat -A POSTROUTING -o ppp0 -j SNAT1
> >> > iptables -t nat -A POSTROUTING -o ppp1 -j SNAT2
> >> > should do the masquerading I suppose, although the idea was not =
that, but rather to fix the source address of outgoing packets to coinc=
ide with the IP of the interface (ppp0 or ppp1).
> >> >
> >> > >
> >> > >> When I remove the default route in the main routing table, I =
completely lose Internet connectivity.   My logic tells me that a defau=
lt "main" route should not be necessary at all if all packets are marke=
d and sent to my 2 custom routing tables (rt_link1/2), each of which ha=
s a default route.
> >> > >
> >> > > That's right, but if all your /proc/net/ip_conntrack entries c=
ontain mark values
> >> > > then there really must be something wrong with the fw mark <->=
 route interaction.
> >> > >
> >> > > My suggestion is to try this with the lastest IPtables user sp=
ace and 2.6.27.X for
> >> > > instance, then maybe more people have a comparable setup to lo=
ok at.
> >> > That's good advice, although I can't use kernel 2.6.27 I'm afrai=
d.  At some point after 2.6.21 the code for a USB serial driver changed=
=2E  I have to patch that driver to make my USB-connected GPRS (ppp ove=
r GSM cell phone) modem work.  (I already hacked the patch once, after =
the driver code changed between kernel 2.4 and 2.6, and I don't want to=
 have to do it again.)  GPRS is my only Internet option in my remote ar=
ea of Costa Rica.
> >> >
> >> > My idea was to download the 2.6.18.8 kernel and use it with ipta=
bles v1.3.6, which as you pointed out previously ought to have the func=
tionality I need.  (It is a drag to be tied to an old kernel version du=
e to hardware dependency.)
> >> > >
> >> > > Do you know about LARTC? The best way to get started IMO: http=
://lartc.org/
> >> >
> >> > Yes, I downloaded the tutorial a couple of days ago, thanks!
> >> >
> >> > --
> >> > Lloyd
> >> > --
> >> > To unsubscribe from this list: send the line "unsubscribe netfil=
ter" in
> >> > the body of a message to majordomo@vger.kernel.org
> >> > More majordomo info at  http://vger.kernel.org/majordomo-info.ht=
ml
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe netfilte=
r" in
> >> the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> >

