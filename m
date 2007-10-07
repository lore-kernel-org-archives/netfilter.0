From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: NAT problem with iptables
Date: Sun, 07 Oct 2007 21:26:52 +0200
Message-ID: <470932FC.7090801@plouf.fr.eu.org>
References: <4709153B.8060309@may.be>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4709153B.8060309@may.be>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Cliff Stanford a =E9crit :
>=20
> I have just built a Linux (Fedora 7) box to act as an ADSL router and
> NAT for two private (10.0.0.0) networks.
>=20
> The problem I have is that I have a PBX running Asterisk behind the
> router which must connect using iax2 to a box outside of the network.
> Similarly, the remote switchboard must be able to connect using iax2 =
to
> my nat'ed PBX.
>=20
> My entire iptables setup at he moment looks like this:
>=20
> [root@gw ~]# iptables -L --line-numbers

Note : Input and output interfaces are not shown. Use the "-v" option o=
r=20
- better IMHO - use iptables-save which displays all the tables in a=20
single command in a more readable format.

> I would expect all NEW UDP packets coming in on port 4569 (iax) to be
> redirected to 10.20.30.14 after being logged as NAT: and subsequent
> packets to be redirected via conntrack but not to be logged.

So would I.

> In practice, I am getting a continual stream of the INPUT: log messag=
es:
>=20
> Oct  7 18:48:35 gw kernel: INPUT (NEW): IN=3Datm0 OUT=3D
> MAC=3Daa:aa:03:00:00:00:08:00 SRC=3D194.70.36.201 DST=3D217.125.3.73 =
LEN=3D40
> TOS=3D0x00 PREC=3D0x00 TTL=3D53 ID=3D0 DF PROTO=3DUDP SPT=3D4569 DPT=3D=
4569 LEN=3D20
> Oct  7 18:49:15 gw last message repeated 4 times
> Oct  7 18:50:16 gw last message repeated 7 times
> Oct  7 18:51:35 gw last message repeated 7 times
>=20
> The output from conntrack is:
>=20
> [root@gw ~]# conntrack -L -s 194.70.36.201
> udp      17 23 src=3D194.70.36.201 dst=3D217.125.3.73 sport=3D4569 dp=
ort=3D4569
> packets=3D1332 bytes=3D53280 [UNREPLIED] src=3D217.125.3.73 dst=3D194=
=2E70.36.201
> sport=3D4569 dport=3D4569 packets=3D0 bytes=3D0 mark=3D0 use=3D1
> [root@gw ~]# conntrack -L -d 194.70.36.201 -s 10.20.30.14
> udp      17 122 src=3D10.20.30.14 dst=3D194.70.36.201 sport=3D4569 dp=
ort=3D4569
> packets=3D701 bytes=3D36932 src=3D194.70.36.201 dst=3D217.125.3.73 sp=
ort=3D4569
> dport=3D1024 packets=3D491 bytes=3D28742 [ASSURED] mark=3D0 use=3D1
>=20
> The second row is the outbound IAX which is working fine.  So it
> definitely seems that this rule is not working:
>=20
> iptables -A PREROUTING -p udp -m udp --dport 4569 -j DNAT
> - --to-destination 10.20.30.14

I think it is a bit more complicated. The incoming packets logged in th=
e=20
INPUT chain are dropped by REJECT, so they should not create a conntrac=
k=20
entry.

A possible explanation may be the following.
The remote box sends a continuous stream of UDP packets. The first=20
packet was received before the ruleset was installed but after the=20
conntrack was loaded, so a conntrack entry was created with no NAT, and=
=20
does not expire because of the continuous stream.
Anyway this happened before your Asterisk sent the first packet, becaus=
e=20
you can see that the outgoing SNATed stream has an implicit source port=
=20
NAT (original source port 4569 is replaced with 1024) in order to avoid=
=20
a clash with an existing conntrack entry, actually the one related to=20
the incoming stream.

Clear the conntrack table by any means and see what happens.
