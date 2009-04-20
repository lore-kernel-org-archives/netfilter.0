From: =?ISO-8859-1?Q?Javier_G=E1lvez_Guerrero?= 
	<javier.galvez.guerrero@gmail.com>
Subject: Re: still can't route using fwmark
Date: Mon, 20 Apr 2009 17:15:21 +0200
Message-ID: <145d4e1a0904200815q3176c9e2m2dfef314b205f348@mail.gmail.com>
References: <op.uskfabufx1lyi3@localhost> <op.uslkl80px1lyi3@localhost>
	 <20090418205802.GA16790@internet24.de> <op.uslqwresx1lyi3@localhost>
	 <20090419090016.GA19987@internet24.de> <op.usn740lix1lyi3@localhost>
	 <145d4e1a0904200148p23d66274h8c0eb0a28ccf568b@mail.gmail.com>
	 <1240227862.27336.43.camel@enterprise.ims-firmen.de>
	 <145d4e1a0904200608i45d9cf09sce1c38ab42cd316@mail.gmail.com>
	 <1240234658.27336.66.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=FjjaLteFMGcsrIKITVWbOyh711K1wZS1MK5/rvKq1u8=;
        b=xrpy7xgDJvwig+ujkSyvpHGdadUFw8uOag/xNlwZ1TYA8zctuDRbLgU6+juTLf4Gt0
         OqP34/ko3PbQNyxISoRRbw6kov/1hhCthcS//Z12RUZBanSlkA5gEoBNKAEQypA86DyJ
         iQpmT8o8qCTyeY6mUrfsuWx1vGyMVpOPZV1Ps=
In-Reply-To: <1240234658.27336.66.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

Thanks for your suggestions.

As said before, customizing Jan's proposal didn't work:

#!/bin/sh

# Adapted from http://dev.medozas.de/NF-Cookbook.txt

-t mangle -N preferra0
-t mangle -A preferra0 -j CONNMARK --set-mark 10

-t mangle -N preferra1
-t mangle -A preferra1 -j CONNMARK --set-mark 11

# For connections coming from the Internet
-t mangle -N prefin
-t mangle -A prefin -i ra0 -g preferra0
-t mangle -A prefin -i ra1 -g preferra1

# For connections initiated from the LAN
-t mangle -N prefout
-t mangle -A prefout -o ra0 -g preferra0
-t mangle -A prefout -o ra1 -g preferra1

-t mangle -A PREROUTING -m connmark --mark 0 -m conntrack --ctstate
NEW -j prefin
-t mangle -A PREROUTING -j CONNMARK --restore-mark

-t mangle -A FORWARD -m connmark --mark 0 -m conntrack --ctstate NEW -j=
 prefout
-t mangle -A OUTPUT -m connmark --mark 0 -m conntrack --ctstate NEW -j =
prefout

ip rule add fwmark 10 table 10
ip rule add fwmark 11 table 11
ip route add default via 192.168.0.1 table 10
ip route add default via 192.168.1.1 table 11


Using your rules I get this setup:

$ sudo iptables -L -t mangle
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
CONNMARK   tcp  --  anywhere             anywhere            state NEW
tcp spt:rtsp CONNMARK set 0x1

Chain INPUT (policy ACCEPT)
target     prot opt source               destination
CONNMARK   all  --  anywhere             anywhere            CONNMARK r=
estore

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
CONNMARK   tcp  --  anywhere             jet.local           state NEW
tcp dpt:rtsp CONNMARK set 0x1
CONNMARK   all  --  anywhere             anywhere            CONNMARK r=
estore

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination


$ sudo iptables -L -t nat
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT       tcp  --  anywhere             anywhere            tcp
dpt:rtsp to:192.168.1.2

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

$ sudo ip rule
0:	from all lookup local
32764:	from all fwmark 0x2 lookup 2
32765:	from all fwmark 0x1 lookup 1
32766:	from all lookup main
32767:	from all lookup default

$ sudo ip route show table 1
default via 192.168.1.1 dev ra1

$ sudo ip route show table 2
default via 192.168.0.1 dev ra0

$ sudo ip route
192.168.1.0/24 dev ra1  proto kernel  scope link  src 192.168.1.2
192.168.0.0/24 dev ra0  proto kernel  scope link  src 192.168.0.2
default via 192.168.0.1 dev ra0


With this environment I get the same results. I send the first TCP
packet (SYN, dport 8554) through the interface ra1 (OK) with the IP
bound to this interface (SNAT OK) and I get the (SYN,ACK) to the same
IP and through the same interface (OK!), but my application does not
send the final acknowledgement to the TCP connection establishment
(ACK), so the RTSP messages are not sent and the client retries over
and over again the TCP session establishment. This happens when the
default route in the main routing table is not the marked one (in this
case, 192.168.0.1 - ra0 is the one in the default table, while I mark
the connection to be established through 192.168.1.1 - ra1).

I don't really need to balance the load, just to decide which
interface configure the streaming session through and start it while
preserving the previous streaming sessions; this is: changing the
interface through which I ask and receive video streaming while not
messing up old connections with other videos. I can't understand how
this can be so difficult to configure. I must be missing something in
my rules...


Any help would be much appreciated. Thanks,
Javi


El d=EDa 20 de abril de 2009 15:37, Thomas Jacob <jacob@internet24.de> =
escribi=F3:
> Nice diagram ;)
>
> Well, it is as thought, your TOS rules set TOS fields in the packets
> and those are usually bounced back to you from the reply direction,
> so effectively you are using something like CONNMARK already.
>
> Jan's item 5 description is definitely a good starting point.
>
> Maybe you could try this, I am assuming that you really
> are talking only about connections originating from client
> here:
>
>
> =A0 =A0iptables -F OUTPUT -t mangle
> =A0 =A0iptables -F POSTROUTING -t nat
> =A0 =A0iptables -F PREROUTING -t nat
>
>
> =A0 =A0iptables -t nat -A POSTROUTING -p tcp --dport 8554 -j SNAT
> --to-source 192.168.0.2
>
> =A0 =A0iptables -t mangle -A INPUT =A0 -j CONNMARK --restore-mark
>
> =A0 =A0iptables -t mangle -A OUTPUT -m state --state NEW \
> =A0 =A0 =A0 =A0-p tcp --dport 8554 -d 147.83.47.178 -j CONNMARK --set=
-mark 1
> =A0 =A0iptables -t mangle -A OUTPUT =A0 -j CONNMARK --restore-mark
>
>
> If you want to load balance connections from the local net you need
> to use PREROUTING like Jan does. See the chain traversal diagrams I
> posted in the reply to Lloyd, understanding which packets pass thru
> which chains is really important for stuff like this.
>
> On Mon, 2009-04-20 at 15:08 +0200, Javier G=E1lvez Guerrero wrote:
>> Thanks for your answer, Thomas.
>>
>> Once I explained to Jan what I had to implement, he pointed me to th=
e
>> item 5 in http://dev.medozas.de/NF-Cookbook.txt, so I've also used
>> CONNTRACK with no success:
>>
>> "I'll try to explain what I need to implement. I'm developing a daem=
on
>> application that manages WiFi handovers between two private networks
>> (192.168.0.0/24 and 192.168.1.0/24) using two different WiFi NICs.
>> When the link RSSI becomes low enough, the application triggers the
>> handover in order to keep a seamless video streaming service, so fir=
st
>> I must attach to the new network with the inactive NIC, ask for the
>> media content through it (the video session configuration is done
>> through the server port 8554) and, once I'm receiving the content
>> through the new link (the media content is actually sent from and to
>> ports differents from 8554), detach de old one.
>>
>> In order to do this in a seamless way I need to play with ip route, =
ip
>> rule and iptables. Marking traffic with iptables is not enough as it
>> is done in POSTROUTING, so the kernel previously decides which IP th=
e
>> packets will have according to the default route in the main ip
>> routing table. Using MARK I send the packet through the interface I
>> want in each specific moment, while with SNAT I change the source IP
>> to the one attached to the used interface (thus changing the IP give=
n
>> by the default routing table in case the new interface is not the on=
e
>> configured as the default one). The received (answer) packets should
>> come through the same interface with the corresponding IP but they
>> just follow the route configured in the default ip routing table (th=
en
>> not matching the connection established according to my custom setup=
),
>> so I need to setup more MARKing and ip rules so the local applicatio=
n
>> receives and delivers packets accordingly. This is where MARK fails
>> and TOS success, but I don't want to mess TOS network configuration
>> and use a more proper packet mangling with MARK as the only device
>> that should care about the handover is the client device."
>>
>>
>>
>> Anyway, it didn't work: as soon as I change the default route in the
>> main table the old connection is broken. Instead, connections should
>> be established and maintained through the links pointed in the
>> respective tables (not the main one), according with the marking rul=
es
>> (that's what I need, to have two connections established with
>> different interfaces and to different networks and dynamically chose
>> one of both to send and receive the video stream).
>>
>> Time for ASCII art (quite "simple"):
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0,''''=
''''''''''`.
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
Server |
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0L____=
___J =A0147.83.47.178
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0_=
/__
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ,-' =A0 =
=A0 =A0 `-.
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ,' =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 `.
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 '.
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0 Net=
work =A0|
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /\ =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 /
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/ =A0\ =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0/.
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0,' =A0 =A0`._ =A0 =A0=
 =A0 =A0_,' =A0`.
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 / =A0 =A0 =A0 =A0 `----'=
 =A0 =A0 =A0 =A0 =A0`.
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|---'--------Y =A0 =A0 =A0 =A0 =A0=
 ....:.............
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A0 =A0 =A0 =A0| =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|Router A| =A0 =A0 =A0 =A0 =A0 | =
=A0 =A0Router B |
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0'------------ =A0 =A0 =A0 =A0 =A0=
 =A0`.................'
>> =A0 =A0 =A0 =A0 =A0192.168.0.0/24 =A0 =A0 =A0 =A0 =A0 =A0 192.168.1.=
0/24
>>
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0,'''''''''''''''''''|
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ra0 =A0 =A0 =A0 =A0=
| =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0ra1
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 =A0 Client |
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 192.168.0.2 =A0L________| =A0192=
=2E168.1.2
>>
>>
>>
>> The rules with TOS are exactly the same just changing the marking
>> parameters by the TOS ones:
>>
>> ip rule add from all tos 0x10 table 1 prio 1
>> ip rule add from all tos 0x04 table 2 prio 1
>>
>> iptables -t nat -A POSTROUTING -p tcp --dport 8554 -j SNAT --to-sour=
ce
>> 192.168.0.2
>> iptables -A OUTPUT -t mangle -p tcp --dport 8554 -j TOS --set-tos 0x=
10
>> iptables -A PREROUTING -t mangle -s 147.83.47.178 -j TOS --set-tos 0=
x10
>>
>> iptables -t nat -R POSTROUTING 1 -p tcp --dport 8554 -j SNAT
>> --to-source 192.168.1.2
>> iptables -R OUTPUT 1 -t mangle -p tcp --dport 8554 -j TOS --set-tos =
0x04
>> iptables -R PREROUTING 1 -t mangle -s 147.83.47.178 -j TOS --set-tos=
 0x04
>>
>>
>> This works but, as said before, I don't what this TOS stuff to be us=
ed.
>>
>>
>> So... any idea why the previous "item 5" didn't work for my
>> environment? What should I try?
>>
>>
>> Thank you for your help,
>> Javi
>>
>>
>> El d=EDa 20 de abril de 2009 13:44, Thomas Jacob <jacob@internet24.d=
e> escribi=F3:
>> > I haven't read thru all this, and you also haven't posted
>> > your TOS variant, but a few observations:
>> >
>> > You should use CONNMARK like Lloyd does, MARK does not
>> > affect the connection, just a single packet, and you have to
>> > reconstruct your MARK values for each packet.
>> >
>> > Your TOS rules most likely change the packet TOS field, and that
>> > is sort of "sticky" if all the intermediate hosts play ball,
>> > according to the standards, i.e. does do something like CONNMARK
>> > does.
>> >
>> > Also be aware of the different paths thru the various
>> > chains taken by packets from/to the local host and
>> > by forwarded packets.
>> >
>> > A small ascii diagram for your setup would be very helpful.
>> >
>> > On Mon, 2009-04-20 at 10:48 +0200, Javier G=E1lvez Guerrero wrote:
>> >> Hi,
>> >>
>> >> I've been trying something similar to Lloyd's configuration for a=
 long
>> >> time with no success. I want to reach a host (server) from my lap=
top
>> >> with two WiFi interfaces attached to different subnetworks/router=
s;
>> >> the server is in the public network, both routers have public IPs=
 (the
>> >> same domain than the server) while setting up two different priva=
te
>> >> networks (192.168.0.0/24 and 192.168.1.0/24), so each WiFi interf=
ace
>> >> in my laptop are attached to each one of them.
>> >>
>> >> The problem is that I can't manage to dynamically configure which
>> >> interface to be chosen to redirect my traffic. In my case, I want=
 the
>> >> packets with destination port 8554 to be routed to one or other
>> >> interface as I want (so load one network or the other), so I trie=
d to
>> >> change MARK iptables rules accordingly with no success, just gett=
ing
>> >> what Lloyd had: packets are routed through the default route in t=
he
>> >> main ip routing table, while if I have not this route configured =
I
>> >> lose network access, despite having the corresponding tables and =
rules
>> >> properly configured. What I ended figuring out is that using the =
TOS
>> >> target it worked properly, but this is not what I'd like to prese=
rve
>> >> as TOS changes the type of service parameter and could affect net=
work
>> >> management beyond my laptop; I need to use MARK to manage my outg=
oing
>> >> and incoming traffic.
>> >>
>> >> This is the script I'm currently using (stripped):
>> >>
>> >> =A0 =A0 ip route flush table 1
>> >> =A0 =A0 ip route flush table 2
>> >> =A0 =A0 ip rule del prio 1
>> >> =A0 =A0 ip rule del prio 1
>> >> =A0 =A0 iptables -F OUTPUT -t mangle
>> >> =A0 =A0 iptables -F POSTROUTING -t nat
>> >> =A0 =A0 iptables -F PREROUTING -t nat
>> >>
>> >> =A0 =A0 ip route add default via 192.168.0.1 dev ra0 ---> I need =
a
>> >> configure a route in the main table! Why?
>> >> =A0 =A0 ip route add table 1 192.168.0.0/24 dev ra0
>> >> =A0 =A0 ip route add table 1 default via 192.168.0.1 dev ra0
>> >> =A0 =A0 ip route add table 2 192.168.1.0/24 dev ra1
>> >> =A0 =A0 ip route add table 2 default via 192.168.1.1 dev ra1
>> >>
>> >> =A0 =A0 ip rule add from all fwmark 1 table 1 prio 1
>> >> =A0 =A0 ip rule add from all fwmark 2 table 2 prio 1
>> >>
>> >> =A0 =A0 iptables -t nat -A POSTROUTING -p tcp --dport 8554 -j SNA=
T
>> >> --to-source 192.168.0.2
>> >> =A0 =A0 iptables -A OUTPUT -t mangle -p tcp --dport 8554 -j MARK =
--set-mark 1
>> >> =A0 =A0 iptables -t mangle -A PREROUTING -s 147.83.47.178 -j MARK=
 --set-mark 1
>> >>
>> >>
>> >> So, when I want to change the marking rules:
>> >>
>> >> =A0 =A0 =A0 iptables -t nat -R POSTROUTING 1 -p tcp --dport 8554 =
-j SNAT
>> >> --to-source 192.168.1.2
>> >> =A0 =A0 =A0 iptables -R OUTPUT 1 -t mangle -p tcp --dport 8554 -j=
 MARK --set-mark 2
>> >> =A0 =A0 =A0 iptables -t mangle -R PREROUTING 1 -s 147.83.47.178 -=
j MARK --set-mark 2
>> >>
>> >>
>> >> Anyway, I'm not able to get this working, but only when the selec=
ted
>> >> IP matches the default IP in the main routing table, so... it doe=
sn't
>> >> work. Changing MARKing rules with TOS works.
>> >>
>> >> So, I can't dynamically change the used interface for the selecte=
d packets.
>> >>
>> >>
>> >> I opened a bug (#589) in the Netfilter bugzilla system and Jan
>> >> Engelhardt has kindly tried to help me but I haven't been able to
>> >> solve it yet.
>> >>
>> >> By the way, I'm using kernel 2.6.27-11 wit iptables 1.4.0.
>> >>
>> >>
>> >> Any help would be much appreciated, as I'm not sure if this is re=
ally
>> >> a bug or just a problem with iptables rules understanding or misu=
se.
>> >>
>> >>
>> >> Regards,
>> >> Javi
>> >>
>> >> 2009/4/20 Lloyd Standish <lloyd@crnatural.net>
>> >> >
>> >> > On Sun, 19 Apr 2009 03:00:17 -0600, Thomas Jacob <jacob@interne=
t24.de> wrote:
>> >> >
>> >> > >>Well, I want to load-balance packets from the local machine, =
which is serving as gateway for a home LAN (eth0). =A0The local machine=
 is 192.168.1.1 on the LAN.
>> >> > >
>> >> > > Then your current setup in PREROUTING is what you want to go =
for, just keep
>> >> > > in mind that this does not give you load balancing for connec=
tions originating
>> >> > > from your router box, just the ones from your LAN.
>> >> >
>> >> > I'm sorry, I don't understand. =A0 According to what you are sa=
ying, I should not get any load balancing, since all my testing up unti=
l now has been with connections (to the Internet) originating on the ro=
uter box. =A0(I haven't even tried connecting from the LAN.)
>> >> >
>> >> > However, the packets originating on the router box *are* showin=
g up in the conntrack table with the fwmark, put there by my prerouting=
 rules. =A0Is there a reason why they should not be pushed out the inte=
rface specified by the rt_link1/2 tables? =A0(As far as I can tell, my =
user-defined routing tables are ignored, and the default route in the "=
main" table is always used.)
>> >> >
>> >> > >
>> >> > > C.f.: http://ebtables.sourceforge.net/br_fw_ia/bridge3b.png
>> >> > >
>> >> > > I'm not sure why you need NAT on your eth0 though then, what =
are you
>> >> > > trying to achieve with this? But that should not be the cause
>> >> > > of the load balancing failure.
>> >> >
>> >> > I was trying to masquerade any LAN-connected machine so it coul=
d connect to the Internet through the router box, but I mistakenly spec=
ified "-o eth0" instead of Internet connected interface.
>> >> >
>> >> > The lines:
>> >> > iptables -t nat -A POSTROUTING -o ppp0 -j SNAT1
>> >> > iptables -t nat -A POSTROUTING -o ppp1 -j SNAT2
>> >> > should do the masquerading I suppose, although the idea was not=
 that, but rather to fix the source address of outgoing packets to coin=
cide with the IP of the interface (ppp0 or ppp1).
>> >> >
>> >> > >
>> >> > >> When I remove the default route in the main routing table, I=
 completely lose Internet connectivity. =A0 My logic tells me that a de=
fault "main" route should not be necessary at all if all packets are ma=
rked and sent to my 2 custom routing tables (rt_link1/2), each of which=
 has a default route.
>> >> > >
>> >> > > That's right, but if all your /proc/net/ip_conntrack entries =
contain mark values
>> >> > > then there really must be something wrong with the fw mark <-=
> route interaction.
>> >> > >
>> >> > > My suggestion is to try this with the lastest IPtables user s=
pace and 2.6.27.X for
>> >> > > instance, then maybe more people have a comparable setup to l=
ook at.
>> >> > That's good advice, although I can't use kernel 2.6.27 I'm afra=
id. =A0At some point after 2.6.21 the code for a USB serial driver chan=
ged. =A0I have to patch that driver to make my USB-connected GPRS (ppp =
over GSM cell phone) modem work. =A0(I already hacked the patch once, a=
fter the driver code changed between kernel 2.4 and 2.6, and I don't wa=
nt to have to do it again.) =A0GPRS is my only Internet option in my re=
mote area of Costa Rica.
>> >> >
>> >> > My idea was to download the 2.6.18.8 kernel and use it with ipt=
ables v1.3.6, which as you pointed out previously ought to have the fun=
ctionality I need. =A0(It is a drag to be tied to an old kernel version=
 due to hardware dependency.)
>> >> > >
>> >> > > Do you know about LARTC? The best way to get started IMO: htt=
p://lartc.org/
>> >> >
>> >> > Yes, I downloaded the tutorial a couple of days ago, thanks!
>> >> >
>> >> > --
>> >> > Lloyd
>> >> > --
>> >> > To unsubscribe from this list: send the line "unsubscribe netfi=
lter" in
>> >> > the body of a message to majordomo@vger.kernel.org
>> >> > More majordomo info at =A0http://vger.kernel.org/majordomo-info=
=2Ehtml
>> >> --
>> >> To unsubscribe from this list: send the line "unsubscribe netfilt=
er" in
>> >> the body of a message to majordomo@vger.kernel.org
>> >> More majordomo info at =A0http://vger.kernel.org/majordomo-info.h=
tml
>> >
>> >
>
>
