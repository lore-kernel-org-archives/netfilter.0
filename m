From: "Alec Matusis" <matusis@matusis.com>
Subject: RE: PREROUTING DNAT *inconsistent* behavior
Date: Fri, 17 Dec 2010 16:01:21 -0800
Message-ID: <06c201cb9e46$b4d13560$1e73a020$@com>
References: <032601cb9c12$7d1a4890$774ed9b0$@com> <4D0BE21C.7030905@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D0BE21C.7030905@plouf.fr.eu.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Pascal Hambourg' <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

>I would have used DNAT instead to make sure
> the destination address is not changed.

Instead of REDIRECT, we used:=20
-A PREROUTING -d server.ip -p tcp --dport 443 -j DNAT --to-destination
server.ip:5228
The result is exactly the same.

> What are the other 5% then ?

They are mostly RST packets from various clients:

root@serv6:~# tcpdump -nn -s2048 -A -ieth0 'port 5228 and dst host
server.ip'                        =20
tcpdump: verbose output suppressed, use -v or -vv for full protocol dec=
ode
listening on eth0, link-type EN10MB (Ethernet), capture size 2048 bytes
15:27:50.368876 IP client.ip1.10548 > server.ip.5228: R
3729545609:3729545609(0) win 0
E..(A......HM.~.H..V)4.l.LY.....P...<.........
15:28:54.077335 IP client.ip2.10566 > server.ip.5228: R
1354979512:1354979512(0) win 0
E..(A......=3DM.~.H..V)F.lP.X.....P.............
15:29:42.109229 IP client.ip3.12477 > server.ip.5228: R
1932917654:1932917654(0) win 0
E..(.|@.0....kT.H..V0..ls5......P....h........
15:32:04.729505 IP client.ip4.52554 > server.ip.5228: R
563692688:563692688(0) win 0
E..(..@.,..._...H..V.J.l!.D.....P.............
15:35:30.660292 IP client.ip5.3702 > server.ip.5228: R
3115365672:3115365672(0) win 0
E..(~_@....K.K(.H..V.v.l...(....P.............
15:39:34.739543 IP client.ip6.50657 > server.ip.5228: R
3859022157:3859022157(0) win 0
E..(Iu.....a[h%.H..V...l...M????P.............
15:41:33.761420 IP client.ip7.35088 > server.ip.5228: R
3766839986:3766839986(0) win 0
E..(J.@./.....vBH..V...l..j.....P...V.........


> They are probably packets classified in the INVALID state by the
> connection tracking, which are ignored by the nat table. In a NAT
> setup,
> INVALID packets should be dropped because of this. Now the real
> question
> is : why are they classified in the INVALID state ?

How can I verify that  these packets have been classified as in the INV=
ALID
state? That may be the key to this problem.



> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-
> owner@vger.kernel.org] On Behalf Of Pascal Hambourg
> Sent: Friday, December 17, 2010 2:20 PM
> To: Alec Matusis
> Cc: netfilter@vger.kernel.org
> Subject: Re: PREROUTING DNAT *inconsistent* behavior
>=20
> Hello,
>=20
> Alec Matusis a =E9crit :
> > We are operating large TCP chat servers: 8 servers per machine, abo=
ut
> 70,000
> > outbound pps per machine. On each machine, all servers are listenin=
g
> on port
> > 5228, and each server is listening on its own IP address. All IP
> addresses
> > are assigned to the same physical WAN interface, with virtual
> interfaces
> > eth0:*.
>=20
> Note : eth0:* are not virtual interfaces, they are just IP aliases.
>=20
> > The clients connect to an IP address of the server on port 443, and
> we have
> > the following port-forwarding rule in the NAT table:
> > *nat
> > :PREROUTING ACCEPT [0:0]
> > :POSTROUTING ACCEPT [0:0]
> > :OUTPUT ACCEPT [0:0]
> > -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 5228
>=20
> Hmm, I wouldn't have used REDIRECT if you want to preserve the
> destination address. man iptables states : "It redirects the packet t=
o
> the machine itself by changing the destination IP to the primary
> address
> of the incoming interface." I would have used DNAT instead to make su=
re
> the destination address is not changed.
>=20
> > The problem is that there is some very odd *rare* packets that
> tcpdump
> > shows, between the port 5228 on the server, and the clients. This i=
s
> NOT
> > expected, since 5228 is forwarded to 443. The rate of this unexpect=
ed
> > traffic is about 2pps, or about 0.003% of the total number of
> packets. Most
> > of these packets (about 95% of them) are from the server to the
> client, with
> > NOTHING from the client to the server.
>=20
> What are the other 5% then ?
>=20
> > #tcpdump  -n -ieth0 'port 5228'
> > 20:22:34.657672 IP server.ip.5228 > client1.ip.49892: P
> > 3242847898:3242847907(9) ack 3767768131 win 5840
> > 20:22:36.308379 IP server.ip.5228 > client2.ip.57065: P
> > 3305194993:3305195001(8) ack 579435130 win 46 <nop,nop,timestamp
> 2680337205
> > 794384040>
> > 20:22:37.237683 IP server.ip.5228 > client3.34992: F
> > 2841447925:2841447925(0) ack 691623366 win 5840
> > 20:22:37.794555 IP server.ip.87.5228 > client5.52491: F
> > 3958524831:3958524831(0) ack 1914557806 win 46
> > These look like some martian packets, as if the firewall port-
> forwarding
> > rule has been ignored for them.
>=20
> They are probably packets classified in the INVALID state by the
> connection tracking, which are ignored by the nat table. In a NAT
> setup,
> INVALID packets should be dropped because of this. Now the real
> question
> is : why are they classified in the INVALID state ?
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

