From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: UNTRACKED packets are identified as INVALID
Date: Thu, 27 Mar 2008 16:38:20 +0100
Message-ID: <47EBBF6C.9050302@plouf.fr.eu.org>
References: <004b01c88f45$79bcf080$0a00a8c0@webplanet.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <004b01c88f45$79bcf080$0a00a8c0@webplanet.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Sharon Tal <shatal@websplanet.com>
Cc: netfilter@vger.kernel.org

Hello,

Sharon Tal a =E9crit :
> I have 2 web servers behind an iptables based load-balancer, and I'm =
trying
> to setup a graphics web server on the load-balancer, so that if a sim=
ple
> static file is requested it will be able to respond instead of forwar=
ding
> the request to the web servers.
> =20
> I've been trying to do that by matching packets at the raw table, set=
ting
> them to be UNTRACKED and leaving them on the LB.
> The problem is that all UNTRACKED packets are identified as INVALID a=
s soon
> as they get to the mangle chain and dropped.
> [...]
> # JPG requests should be answered by LB
> $IPTABLES -t raw -A PREROUTING -i $EXTFACE -p tcp --dport 80 -m strin=
g
> --algo bm --string "GET /" -m string --algo bm --string ".jpg HTTP/1.=
" -j
> NOTRACK
> $IPTABLES -t mangle -A PREROUTING -i $EXTFACE -p tcp --dport 80 -m st=
ate
> --state UNTRACKED -j MARK --set-mark 0x11

IMHO, the packets caught by the NOTRACK target are not the same as the=20
packets in the INVALID state. The important thing is that only the=20
individual packet containing the string will have the UNTRACKED state,=20
not the whole connection. Allow me to guess what happens.

A SYN packet starting a new connection is received by the load-balancer=
=2E=20
It contains no data, so it cannot match the NOTRACK rule. The conntrack=
=20
creates a new entry for that connection. Then the packet - and the whol=
e=20
connection - is DNATed to one web server, and the conntrack entry is=20
updated accordingly. This means that all subsequent incoming packets=20
identified by the conntrack as belonging to that connection will be=20
DNATed to the same web server.

The 3-way TCP handshake (SYN/ACK from the server, ACK from the client)=20
completes. Then comes the packet carrying the HTTP request containing=20
the string. This packet is UNTRACKED, so it is not DNATed and reaches=20
the TCP layer of the load balancer. But it is not a SYN packet, and it=20
does not match any local socket because the local TCP layer did not see=
=20
the 3-way handshake. So it is dropped, maybe triggering a TCP RST packe=
t=20
back to the client (not sure about that).

I guess that the segment being UNTRACKED may disturb the TCP sequence=20
number tracking, so at some point subsequent segments may be considered=
=20
INVALID.

Anyway, NOTRACK won't do what you want. You can't change the destinatio=
n=20
of a whole TCP connection after it has started. I'm afraid that the onl=
y=20
way to achieve what you want is to set up load balancing using a revers=
e=20
proxy instead of NAT.
