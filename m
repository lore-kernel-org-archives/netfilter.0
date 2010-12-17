From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: PREROUTING DNAT *inconsistent* behavior
Date: Fri, 17 Dec 2010 23:20:12 +0100
Message-ID: <4D0BE21C.7030905@plouf.fr.eu.org>
References: <032601cb9c12$7d1a4890$774ed9b0$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <032601cb9c12$7d1a4890$774ed9b0$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alec Matusis <matusis@matusis.com>
Cc: netfilter@vger.kernel.org

Hello,

Alec Matusis a =E9crit :
> We are operating large TCP chat servers: 8 servers per machine, about=
 70,000
> outbound pps per machine. On each machine, all servers are listening =
on port
> 5228, and each server is listening on its own IP address. All IP addr=
esses
> are assigned to the same physical WAN interface, with virtual interfa=
ces
> eth0:*.=20

Note : eth0:* are not virtual interfaces, they are just IP aliases.

> The clients connect to an IP address of the server on port 443, and w=
e have
> the following port-forwarding rule in the NAT table:
> *nat
> :PREROUTING ACCEPT [0:0]
> :POSTROUTING ACCEPT [0:0]
> :OUTPUT ACCEPT [0:0]
> -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 5228

Hmm, I wouldn't have used REDIRECT if you want to preserve the
destination address. man iptables states : "It redirects the packet to
the machine itself by changing the destination IP to the primary addres=
s
of the incoming interface." I would have used DNAT instead to make sure
the destination address is not changed.

> The problem is that there is some very odd *rare* packets that tcpdum=
p
> shows, between the port 5228 on the server, and the clients. This is =
NOT
> expected, since 5228 is forwarded to 443. The rate of this unexpected
> traffic is about 2pps, or about 0.003% of the total number of packets=
=2E Most
> of these packets (about 95% of them) are from the server to the clien=
t, with
> NOTHING from the client to the server.=20

What are the other 5% then ?

> #tcpdump  -n -ieth0 'port 5228'
> 20:22:34.657672 IP server.ip.5228 > client1.ip.49892: P
> 3242847898:3242847907(9) ack 3767768131 win 5840
> 20:22:36.308379 IP server.ip.5228 > client2.ip.57065: P
> 3305194993:3305195001(8) ack 579435130 win 46 <nop,nop,timestamp 2680=
337205
> 794384040>
> 20:22:37.237683 IP server.ip.5228 > client3.34992: F
> 2841447925:2841447925(0) ack 691623366 win 5840
> 20:22:37.794555 IP server.ip.87.5228 > client5.52491: F
> 3958524831:3958524831(0) ack 1914557806 win 46
> These look like some martian packets, as if the firewall port-forward=
ing
> rule has been ignored for them.

They are probably packets classified in the INVALID state by the
connection tracking, which are ignored by the nat table. In a NAT setup=
,
INVALID packets should be dropped because of this. Now the real questio=
n
is : why are they classified in the INVALID state ?
