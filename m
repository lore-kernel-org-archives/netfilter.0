From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Should "Transparent web-caching" work with ppp0/pptp? (It   
 doesn't...)
Date: Sat, 25 Apr 2009 16:38:43 +0200
Message-ID: <49F32073.9040207@plouf.fr.eu.org>
References: <d17c5b140904250034x4b73cd8dsf91846eb5f9dda32@mail.gmail.com>	 <49F2D789.6090301@plouf.fr.eu.org> <d17c5b140904250631h4278233dh8989758b38ea2831@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d17c5b140904250631h4278233dh8989758b38ea2831@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Aleksey Tsalolikhin a =E9crit :
>=20
> [my server] ---pptp--> [VPN server] --> website
>=20
>> Where is the squid proxy ?
>=20
> There is none.  Instead of going through squid, the packets must go
> through the VPN.

IIUC, the PPTP server acts as a router and forwards the packets to thei=
r=20
destination.

> There is some kind of transparent proxy in the VPN,
> because when I route packets destined to a particular website (by
> static route using the website's IP address) via the VPN server, the
> webserver records HTTP access from the VPN server.

Maybe it's not transparent proxy but plain source NAT/masquerading.
If I traceroute to the IP address that I believe is the PPTP server, I=20
can see the last two hops with that same address :

17  69.15.192.18  176.584 ms  175.154 ms  176.838 ms
18  69.15.192.18 [open]  176.160 ms  2855.959 ms *

This could mean that the address belongs to a NAT device which forwards=
=20
the PPTP session to the actual PPTP server behind it. So when the PPTP=20
server forwards the packets to the HTTP server through the NAT device,=20
they are masqueraded with the NAT device address.

> Ok.  Here is my trouble:  Connection times out.
>=20
> # telnet www.google.com 80
> Trying 74.125.93.99...
> telnet: connect to address 74.125.93.99: Connection timed out

Can you capture the network traffic on the PPTP interface of your serve=
r=20
(ppp0) e.g. using tcpdump or wireshark/tshark ? Then can you check=20
whether outgoing HTTP connection requests and replies go through this=20
interface ? Can you check what is the source address of the requests ?

If you didn't SNAT or MASQUERADE packets going out through the PPTP=20
tunnel, here is a possible scenario :

- telnet asks for a HTTP connection to 74.125.93.99.
- initial routing selects the output interface and default source=20
address according to the default route in the main routing table : eth0=
=20
and its address.
- rerouting due to the mark changes the output interface to ppp0 but=20
does not alter the source address.
- the packet travels through the PPTP tunnel to the PPTP server.

Depending on the PPTP server's behaviour, a lot of different scenarios=20
may then happen. Here are some.

1a) the PPTP server sees a source address different from the remote=20
endpoint address and drops the packet because of rp_filter=3D1 or iptab=
les=20
filtering. So the connection times out.
1b) or the server does not care about the source address and forwards=20
the packet to the HTTP server. So far so good.

2a) The PPTP server is not behind a NAT device and does not do SNAT or=20
masquerading itself, so the packet reaches the HTTP server with its=20
original source address.
3a) The HTTP server sends a reply to this address, so the packet arrive=
s=20
to your box on eth0. You may want to check this with a packet sniffer.=20
If you don't drop the packet because of rp_filter or iptables, the=20
connection should work.
This is not what seems to happen however, as you wrote that the server=20
sees the PPTP server's address and the connection times out.

2b) Or the PPTP server is behind a NAT device or does SNAT or=20
masquerading itself, so the packet reaches the HTTP server with the=20
source address of the PPTP server or its NAT device.
3b) The HTTP server sends a reply to this address, so the packet arrive=
s=20
to the PPTP server (or its NAT device). It is un-masqueraded so its=20
destination is now your eth0's address. The PPTP server then forwards=20
the packet back to its destination, i.e. your box.

4a) If the PPTP server is not behind a NAT device and does not do "dumb=
"=20
SNAT/masquerading itself, the source address of the reply packet is not=
=20
altered. The packet reaches eth0 on your box and the connection should=20
work unless you filter too hard. Check with a packet sniffer on eth0.

4b) If the PPTP server is behind a NAT device, note that the device did=
=20
not see the request packet which was encapsuled in the PPTP tunnel, so=20
it considers the reply packet as a "new" connection and masquerades it.=
=20
The reply arrives at your box with the wrong source address and is=20
discarded.

4c) Alternatively, the NAT device seeing the reply packet without seein=
g=20
the request packets may consider it invalid and drop it. End of the jou=
rney.

The problem in this scenario is that the reply packet does not travel=20
trough the PPTP tunnel because you didn't use ppp0's address as source=20
address.

As a test, you can try to force the source address in the telnet comman=
d=20
line :

$ telnet -b 192.168.2.131 www.google.com 80

If it works, you know what to do : SNAT or MASQUERADE on ppp0.
