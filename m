From: =?ISO-8859-1?Q?Javier_G=E1lvez_Guerrero?= 
	<javier.galvez.guerrero@gmail.com>
Subject: Re: still can't route using fwmark
Date: Mon, 20 Apr 2009 15:08:13 +0200
Message-ID: <145d4e1a0904200608i45d9cf09sce1c38ab42cd316@mail.gmail.com>
References: <op.uskfabufx1lyi3@localhost> <op.usld3aqfx1lyi3@localhost>
	 <20090418184809.GA15649@internet24.de> <op.uslkl80px1lyi3@localhost>
	 <20090418205802.GA16790@internet24.de> <op.uslqwresx1lyi3@localhost>
	 <20090419090016.GA19987@internet24.de> <op.usn740lix1lyi3@localhost>
	 <145d4e1a0904200148p23d66274h8c0eb0a28ccf568b@mail.gmail.com>
	 <1240227862.27336.43.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=OshLUGWHL/Qiy/i/hW/7xWKLb33bPLsK4hYA39jz2Yc=;
        b=beyI1qPfTG46rTn2O8WNHCn9ZIaXQHZ2Wo2f7FUwOXGxxwmCcET147wTboeF2+1iV5
         sjBVC8CEAOY0YYy3o6FDOr22qkhuZ3zKmHlHol5TWDwxmt6hMY9Ogzn/rgc65MfzqcZf
         D1KxG2knpplmQb84uUq0Kr8rCKRJ5yIKhTLq8=
In-Reply-To: <1240227862.27336.43.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Jacob <jacob@internet24.de>
Cc: Lloyd Standish <lloyd@crnatural.net>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Thanks for your answer, Thomas.

Once I explained to Jan what I had to implement, he pointed me to the
item 5 in http://dev.medozas.de/NF-Cookbook.txt, so I've also used
CONNTRACK with no success:

"I'll try to explain what I need to implement. I'm developing a daemon
application that manages WiFi handovers between two private networks
(192.168.0.0/24 and 192.168.1.0/24) using two different WiFi NICs.
When the link RSSI becomes low enough, the application triggers the
handover in order to keep a seamless video streaming service, so first
I must attach to the new network with the inactive NIC, ask for the
media content through it (the video session configuration is done
through the server port 8554) and, once I'm receiving the content
through the new link (the media content is actually sent from and to
ports differents from 8554), detach de old one.

In order to do this in a seamless way I need to play with ip route, ip
rule and iptables. Marking traffic with iptables is not enough as it
is done in POSTROUTING, so the kernel previously decides which IP the
packets will have according to the default route in the main ip
routing table. Using MARK I send the packet through the interface I
want in each specific moment, while with SNAT I change the source IP
to the one attached to the used interface (thus changing the IP given
by the default routing table in case the new interface is not the one
configured as the default one). The received (answer) packets should
come through the same interface with the corresponding IP but they
just follow the route configured in the default ip routing table (then
not matching the connection established according to my custom setup),
so I need to setup more MARKing and ip rules so the local application
receives and delivers packets accordingly. This is where MARK fails
and TOS success, but I don't want to mess TOS network configuration
and use a more proper packet mangling with MARK as the only device
that should care about the handover is the client device."



Anyway, it didn't work: as soon as I change the default route in the
main table the old connection is broken. Instead, connections should
be established and maintained through the links pointed in the
respective tables (not the main one), according with the marking rules
(that's what I need, to have two connections established with
different interfaces and to different networks and dynamically chose
one of both to send and receive the video stream).

Time for ASCII art (quite "simple"):

                               ,''''''''''''''`.
                               |  Server |
                               L_______J  147.83.47.178
                                 _/__
                              ,-'       `-.
                            ,'               `.
                           |                   '.
                           |     Network  |
                          /\                   /
                         /  \                /.
                       ,'    `._        _,'  `.
                      /         `----'          `.
                 |---'--------Y           ....:.............
                 |              |          |                   |
                 |Router A|           |    Router B |
                 '------------            `.................'
         192.168.0.0/24             192.168.1.0/24


                                       ,'''''''''''''''''''|
                         ra0        |               |  ra1
                                      |     Client |
                  192.168.0.2  L________|  192.168.1.2



The rules with TOS are exactly the same just changing the marking
parameters by the TOS ones:

ip rule add from all tos 0x10 table 1 prio 1
ip rule add from all tos 0x04 table 2 prio 1

iptables -t nat -A POSTROUTING -p tcp --dport 8554 -j SNAT --to-source
192.168.0.2
iptables -A OUTPUT -t mangle -p tcp --dport 8554 -j TOS --set-tos 0x10
iptables -A PREROUTING -t mangle -s 147.83.47.178 -j TOS --set-tos 0x10

iptables -t nat -R POSTROUTING 1 -p tcp --dport 8554 -j SNAT
--to-source 192.168.1.2
iptables -R OUTPUT 1 -t mangle -p tcp --dport 8554 -j TOS --set-tos 0x0=
4
iptables -R PREROUTING 1 -t mangle -s 147.83.47.178 -j TOS --set-tos 0x=
04


This works but, as said before, I don't what this TOS stuff to be used.


So... any idea why the previous "item 5" didn't work for my
environment? What should I try?


Thank you for your help,
Javi


El d=EDa 20 de abril de 2009 13:44, Thomas Jacob <jacob@internet24.de> =
escribi=F3:
> I haven't read thru all this, and you also haven't posted
> your TOS variant, but a few observations:
>
> You should use CONNMARK like Lloyd does, MARK does not
> affect the connection, just a single packet, and you have to
> reconstruct your MARK values for each packet.
>
> Your TOS rules most likely change the packet TOS field, and that
> is sort of "sticky" if all the intermediate hosts play ball,
> according to the standards, i.e. does do something like CONNMARK
> does.
>
> Also be aware of the different paths thru the various
> chains taken by packets from/to the local host and
> by forwarded packets.
>
> A small ascii diagram for your setup would be very helpful.
>
> On Mon, 2009-04-20 at 10:48 +0200, Javier G=E1lvez Guerrero wrote:
>> Hi,
>>
>> I've been trying something similar to Lloyd's configuration for a lo=
ng
>> time with no success. I want to reach a host (server) from my laptop
>> with two WiFi interfaces attached to different subnetworks/routers;
>> the server is in the public network, both routers have public IPs (t=
he
>> same domain than the server) while setting up two different private
>> networks (192.168.0.0/24 and 192.168.1.0/24), so each WiFi interface
>> in my laptop are attached to each one of them.
>>
>> The problem is that I can't manage to dynamically configure which
>> interface to be chosen to redirect my traffic. In my case, I want th=
e
>> packets with destination port 8554 to be routed to one or other
>> interface as I want (so load one network or the other), so I tried t=
o
>> change MARK iptables rules accordingly with no success, just getting
>> what Lloyd had: packets are routed through the default route in the
>> main ip routing table, while if I have not this route configured I
>> lose network access, despite having the corresponding tables and rul=
es
>> properly configured. What I ended figuring out is that using the TOS
>> target it worked properly, but this is not what I'd like to preserve
>> as TOS changes the type of service parameter and could affect networ=
k
>> management beyond my laptop; I need to use MARK to manage my outgoin=
g
>> and incoming traffic.
>>
>> This is the script I'm currently using (stripped):
>>
>> =A0 =A0 ip route flush table 1
>> =A0 =A0 ip route flush table 2
>> =A0 =A0 ip rule del prio 1
>> =A0 =A0 ip rule del prio 1
>> =A0 =A0 iptables -F OUTPUT -t mangle
>> =A0 =A0 iptables -F POSTROUTING -t nat
>> =A0 =A0 iptables -F PREROUTING -t nat
>>
>> =A0 =A0 ip route add default via 192.168.0.1 dev ra0 ---> I need a
>> configure a route in the main table! Why?
>> =A0 =A0 ip route add table 1 192.168.0.0/24 dev ra0
>> =A0 =A0 ip route add table 1 default via 192.168.0.1 dev ra0
>> =A0 =A0 ip route add table 2 192.168.1.0/24 dev ra1
>> =A0 =A0 ip route add table 2 default via 192.168.1.1 dev ra1
>>
>> =A0 =A0 ip rule add from all fwmark 1 table 1 prio 1
>> =A0 =A0 ip rule add from all fwmark 2 table 2 prio 1
>>
>> =A0 =A0 iptables -t nat -A POSTROUTING -p tcp --dport 8554 -j SNAT
>> --to-source 192.168.0.2
>> =A0 =A0 iptables -A OUTPUT -t mangle -p tcp --dport 8554 -j MARK --s=
et-mark 1
>> =A0 =A0 iptables -t mangle -A PREROUTING -s 147.83.47.178 -j MARK --=
set-mark 1
>>
>>
>> So, when I want to change the marking rules:
>>
>> =A0 =A0 =A0 iptables -t nat -R POSTROUTING 1 -p tcp --dport 8554 -j =
SNAT
>> --to-source 192.168.1.2
>> =A0 =A0 =A0 iptables -R OUTPUT 1 -t mangle -p tcp --dport 8554 -j MA=
RK --set-mark 2
>> =A0 =A0 =A0 iptables -t mangle -R PREROUTING 1 -s 147.83.47.178 -j M=
ARK --set-mark 2
>>
>>
>> Anyway, I'm not able to get this working, but only when the selected
>> IP matches the default IP in the main routing table, so... it doesn'=
t
>> work. Changing MARKing rules with TOS works.
>>
>> So, I can't dynamically change the used interface for the selected p=
ackets.
>>
>>
>> I opened a bug (#589) in the Netfilter bugzilla system and Jan
>> Engelhardt has kindly tried to help me but I haven't been able to
>> solve it yet.
>>
>> By the way, I'm using kernel 2.6.27-11 wit iptables 1.4.0.
>>
>>
>> Any help would be much appreciated, as I'm not sure if this is reall=
y
>> a bug or just a problem with iptables rules understanding or misuse.
>>
>>
>> Regards,
>> Javi
>>
>> 2009/4/20 Lloyd Standish <lloyd@crnatural.net>
>> >
>> > On Sun, 19 Apr 2009 03:00:17 -0600, Thomas Jacob <jacob@internet24=
=2Ede> wrote:
>> >
>> > >>Well, I want to load-balance packets from the local machine, whi=
ch is serving as gateway for a home LAN (eth0). =A0The local machine is=
 192.168.1.1 on the LAN.
>> > >
>> > > Then your current setup in PREROUTING is what you want to go for=
, just keep
>> > > in mind that this does not give you load balancing for connectio=
ns originating
>> > > from your router box, just the ones from your LAN.
>> >
>> > I'm sorry, I don't understand. =A0 According to what you are sayin=
g, I should not get any load balancing, since all my testing up until n=
ow has been with connections (to the Internet) originating on the route=
r box. =A0(I haven't even tried connecting from the LAN.)
>> >
>> > However, the packets originating on the router box *are* showing u=
p in the conntrack table with the fwmark, put there by my prerouting ru=
les. =A0Is there a reason why they should not be pushed out the interfa=
ce specified by the rt_link1/2 tables? =A0(As far as I can tell, my use=
r-defined routing tables are ignored, and the default route in the "mai=
n" table is always used.)
>> >
>> > >
>> > > C.f.: http://ebtables.sourceforge.net/br_fw_ia/bridge3b.png
>> > >
>> > > I'm not sure why you need NAT on your eth0 though then, what are=
 you
>> > > trying to achieve with this? But that should not be the cause
>> > > of the load balancing failure.
>> >
>> > I was trying to masquerade any LAN-connected machine so it could c=
onnect to the Internet through the router box, but I mistakenly specifi=
ed "-o eth0" instead of Internet connected interface.
>> >
>> > The lines:
>> > iptables -t nat -A POSTROUTING -o ppp0 -j SNAT1
>> > iptables -t nat -A POSTROUTING -o ppp1 -j SNAT2
>> > should do the masquerading I suppose, although the idea was not th=
at, but rather to fix the source address of outgoing packets to coincid=
e with the IP of the interface (ppp0 or ppp1).
>> >
>> > >
>> > >> When I remove the default route in the main routing table, I co=
mpletely lose Internet connectivity. =A0 My logic tells me that a defau=
lt "main" route should not be necessary at all if all packets are marke=
d and sent to my 2 custom routing tables (rt_link1/2), each of which ha=
s a default route.
>> > >
>> > > That's right, but if all your /proc/net/ip_conntrack entries con=
tain mark values
>> > > then there really must be something wrong with the fw mark <-> r=
oute interaction.
>> > >
>> > > My suggestion is to try this with the lastest IPtables user spac=
e and 2.6.27.X for
>> > > instance, then maybe more people have a comparable setup to look=
 at.
>> > That's good advice, although I can't use kernel 2.6.27 I'm afraid.=
 =A0At some point after 2.6.21 the code for a USB serial driver changed=
=2E =A0I have to patch that driver to make my USB-connected GPRS (ppp o=
ver GSM cell phone) modem work. =A0(I already hacked the patch once, af=
ter the driver code changed between kernel 2.4 and 2.6, and I don't wan=
t to have to do it again.) =A0GPRS is my only Internet option in my rem=
ote area of Costa Rica.
>> >
>> > My idea was to download the 2.6.18.8 kernel and use it with iptabl=
es v1.3.6, which as you pointed out previously ought to have the functi=
onality I need. =A0(It is a drag to be tied to an old kernel version du=
e to hardware dependency.)
>> > >
>> > > Do you know about LARTC? The best way to get started IMO: http:/=
/lartc.org/
>> >
>> > Yes, I downloaded the tutorial a couple of days ago, thanks!
>> >
>> > --
>> > Lloyd
>> > --
>> > To unsubscribe from this list: send the line "unsubscribe netfilte=
r" in
>> > the body of a message to majordomo@vger.kernel.org
>> > More majordomo info at =A0http://vger.kernel.org/majordomo-info.ht=
ml
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
>
