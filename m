From: "Daniel Beckham" <danbeck-netfilter@dealnews.com>
Subject: Re: DNAT and VPN Tunnel problems, traffic checks in, but doesn't check out
Date: Wed, 5 Mar 2003 10:31:40 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000401c2e334$bc987db0$0a02010a@danbeck>
References: <OFB7840FE4.C0F00E27-ON80256CE0.0031E466@start-global.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_008A_01C2E302.68BC3600"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_008A_01C2E302.68BC3600
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I'm sending this in html format hoping the dump lines won't wrap.  And =
sorry for the length of the dumps. =3D)

Using the configuration you suggested below, (the original configuration =
I tried and the one that made the most sense to me also) I've dumped =
both sides of the tunnel.  Below is the output.   From the data below, =
it's obvious that any outgoing packets with a full payload (the payload =
size is 1460)

i.e. 09:29:05.797718 10.1.2.10.3969 > 129.41.69.137.smtp: . =
165:1625(1460) ack 125 win 64116 (DF)

never make it to the tunnel interface.   This is why incoming imap =
appears to work just fine, but sending mail doesn't.

Again, this seems a bit crazy as my FORWARD chain specifically allows =
any traffic to and from eth1 and tun0.

$IPTABLES -A FORWARD -i tun+ -j ACCEPT       =20
$IPTABLES -A FORWARD -i tap+ -j ACCEPT
$IPTABLES -A FORWARD -i eth1 -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

tcpdump data:

Firewall on the local side of the tunnel: (tun0)

09:29:04.986164 10.1.2.10.3969 > 10.1.1.7.smtp: S 266730469:266730469(0) =
win 64240 <mss 1460,nop,nop,sackOK> (DF)
09:29:05.031684 10.1.1.7.smtp > 10.1.2.10.3969: S 361700781:361700781(0) =
ack 266730470 win 5840 <mss 1460,nop,nop,sackOK> (DF)
09:29:05.032048 10.1.2.10.3969 > 10.1.1.7.smtp: . ack 1 win 64240 (DF)
09:29:05.070314 10.1.1.7.smtp > 10.1.2.10.3969: P 1:30(29) ack 1 win =
5840 (DF)
09:29:05.071048 10.1.2.10.3969 > 10.1.1.7.smtp: P 1:15(14) ack 30 win =
64211 (DF)
09:29:05.116340 10.1.1.7.smtp > 10.1.2.10.3969: . ack 15 win 5840 (DF)
09:29:05.117105 10.1.1.7.smtp > 10.1.2.10.3969: P 30:53(23) ack 15 win =
5840 (DF)
09:29:05.122915 10.1.2.10.3969 > 10.1.1.7.smtp: P 15:50(35) ack 53 win =
64188 (DF)
09:29:05.158822 10.1.1.7.smtp > 10.1.2.10.3969: P 53:61(8) ack 50 win =
5840 (DF)
09:29:05.159389 10.1.2.10.3969 > 10.1.1.7.smtp: P 50:81(31) ack 61 win =
64180 (DF)
09:29:05.199339 10.1.1.7.smtp > 10.1.2.10.3969: P 61:69(8) ack 81 win =
5840 (DF)
09:29:05.217269 10.1.2.10.3969 > 10.1.1.7.smtp: P 81:87(6) ack 69 win =
64172 (DF)
09:29:05.253722 10.1.1.7.smtp > 10.1.2.10.3969: P 69:82(13) ack 87 win =
5840 (DF)
09:29:05.461527 10.1.2.10.3969 > 10.1.1.7.smtp: . ack 82 win 64159 (DF)
09:29:05.489089 10.1.1.7.smtp > 10.1.2.10.3969: P 69:82(13) ack 87 win =
5840 (DF)
09:29:05.489324 10.1.2.10.3969 > 10.1.1.7.smtp: . ack 82 win 64159 (DF)
09:29:05.637836 10.1.2.10.3969 > 10.1.1.7.smtp: P 87:93(6) ack 82 win =
64159 (DF)
09:29:05.674820 10.1.1.7.smtp > 10.1.2.10.3969: P 82:95(13) ack 93 win =
5840 (DF)
09:29:05.675137 10.1.2.10.3969 > 10.1.1.7.smtp: P 93:128(35) ack 95 win =
64146 (DF)
09:29:05.711645 10.1.1.7.smtp > 10.1.2.10.3969: P 95:103(8) ack 128 win =
5840 (DF)
09:29:05.712153 10.1.2.10.3969 > 10.1.1.7.smtp: P 128:159(31) ack 103 =
win 64138 (DF)
09:29:05.760162 10.1.1.7.smtp > 10.1.2.10.3969: P 103:111(8) ack 159 win =
5840 (DF)
09:29:05.760485 10.1.2.10.3969 > 10.1.1.7.smtp: P 159:165(6) ack 111 win =
64130 (DF)
09:29:05.796928 10.1.1.7.smtp > 10.1.2.10.3969: P 111:125(14) ack 165 =
win 5840 (DF)
09:29:05.798040 10.1.2.10.3969 > 10.1.1.7.smtp: P 4545:4763(218) ack 125 =
win 64116 (DF)
09:29:05.798086 10.1.2.10.3969 > 10.1.1.7.smtp: P 4763:4768(5) ack 125 =
win 64116 (DF)
09:29:05.834350 10.1.1.7.smtp > 10.1.2.10.3969: . ack 165 win 5840 =
<nop,nop,sack sack 1 {4545:4763} > (DF)
09:29:05.846786 10.1.1.7.smtp > 10.1.2.10.3969: . ack 165 win 5840 =
<nop,nop,sack sack 1 {4545:4768} > (DF)

Remote side of the tunnel: (tun0)

12:08:10.673521 10.1.2.10.3969 > 10.1.1.7.smtp: S 266730469:266730469(0) =
win 64240 <mss 1460,nop,nop,sackOK> (DF)
12:08:10.674685 10.1.1.7.smtp > 10.1.2.10.3969: S 361700781:361700781(0) =
ack 266730470 win 5840 <mss 1460,nop,nop,sackOK> (DF)
12:08:10.718701 10.1.2.10.3969 > 10.1.1.7.smtp: . ack 1 win 64240 (DF)
12:08:10.722990 10.1.1.7.smtp > 10.1.2.10.3969: P 1:30(29) ack 1 win =
5840 (DF)
12:08:10.761777 10.1.2.10.3969 > 10.1.1.7.smtp: P 1:15(14) ack 30 win =
64211 (DF)
12:08:10.762026 10.1.1.7.smtp > 10.1.2.10.3969: . ack 15 win 5840 (DF)
12:08:10.762144 10.1.1.7.smtp > 10.1.2.10.3969: P 30:53(23) ack 15 win =
5840 (DF)
12:08:10.809779 10.1.2.10.3969 > 10.1.1.7.smtp: P 15:50(35) ack 53 win =
64188 (DF)
12:08:10.810126 10.1.1.7.smtp > 10.1.2.10.3969: P 53:61(8) ack 50 win =
5840 (DF)
12:08:10.846437 10.1.2.10.3969 > 10.1.1.7.smtp: P 50:81(31) ack 61 win =
64180 (DF)
12:08:10.851162 10.1.1.7.smtp > 10.1.2.10.3969: P 61:69(8) ack 81 win =
5840 (DF)
12:08:10.905777 10.1.2.10.3969 > 10.1.1.7.smtp: P 81:87(6) ack 69 win =
64172 (DF)
12:08:10.906068 10.1.1.7.smtp > 10.1.2.10.3969: P 69:82(13) ack 87 win =
5840 (DF)
12:08:11.139331 10.1.1.7.smtp > 10.1.2.10.3969: P 69:82(13) ack 87 win =
5840 (DF)
12:08:11.148104 10.1.2.10.3969 > 10.1.1.7.smtp: . ack 82 win 64159 (DF)
12:08:11.177095 10.1.2.10.3969 > 10.1.1.7.smtp: . ack 82 win 64159 (DF)
12:08:11.324853 10.1.2.10.3969 > 10.1.1.7.smtp: P 87:93(6) ack 82 win =
64159 (DF)
12:08:11.325240 10.1.1.7.smtp > 10.1.2.10.3969: P 82:95(13) ack 93 win =
5840 (DF)
12:08:11.363484 10.1.2.10.3969 > 10.1.1.7.smtp: P 93:128(35) ack 95 win =
64146 (DF)
12:08:11.363818 10.1.1.7.smtp > 10.1.2.10.3969: P 95:103(8) ack 128 win =
5840 (DF)
12:08:11.412066 10.1.2.10.3969 > 10.1.1.7.smtp: P 128:159(31) ack 103 =
win 64138 (DF)
12:08:11.412477 10.1.1.7.smtp > 10.1.2.10.3969: P 103:111(8) ack 159 win =
5840 (DF)
12:08:11.447083 10.1.2.10.3969 > 10.1.1.7.smtp: P 159:165(6) ack 111 win =
64130 (DF)
12:08:11.449412 10.1.1.7.smtp > 10.1.2.10.3969: P 111:125(14) ack 165 =
win 5840 (DF)
12:08:11.486836 10.1.2.10.3969 > 10.1.1.7.smtp: P 4545:4763(218) ack 125 =
win 64116 (DF)


Here is the interesting part:
Local side of the tunnel, but the eth1 (private network) interface:

09:29:04.986096 10.1.2.10.3969 > 129.41.69.137.smtp: S =
266730469:266730469(0) win 64240 <mss 1460,nop,nop,sackOK> (DF)
09:29:05.031723 129.41.69.137.smtp > 10.1.2.10.3969: S =
361700781:361700781(0) ack 266730470 win 5840 <mss 1460,nop,nop,sackOK> =
(DF)
09:29:05.032012 10.1.2.10.3969 > 129.41.69.137.smtp: . ack 1 win 64240 =
(DF)
09:29:05.070351 129.41.69.137.smtp > 10.1.2.10.3969: P 1:30(29) ack 1 =
win 5840 (DF)
09:29:05.071015 10.1.2.10.3969 > 129.41.69.137.smtp: P 1:15(14) ack 30 =
win 64211 (DF)
09:29:05.116376 129.41.69.137.smtp > 10.1.2.10.3969: . ack 15 win 5840 =
(DF)
09:29:05.117139 129.41.69.137.smtp > 10.1.2.10.3969: P 30:53(23) ack 15 =
win 5840 (DF)
09:29:05.122880 10.1.2.10.3969 > 129.41.69.137.smtp: P 15:50(35) ack 53 =
win 64188 (DF)
09:29:05.158861 129.41.69.137.smtp > 10.1.2.10.3969: P 53:61(8) ack 50 =
win 5840 (DF)
09:29:05.159354 10.1.2.10.3969 > 129.41.69.137.smtp: P 50:81(31) ack 61 =
win 64180 (DF)
09:29:05.199376 129.41.69.137.smtp > 10.1.2.10.3969: P 61:69(8) ack 81 =
win 5840 (DF)
09:29:05.217234 10.1.2.10.3969 > 129.41.69.137.smtp: P 81:87(6) ack 69 =
win 64172 (DF)
09:29:05.253760 129.41.69.137.smtp > 10.1.2.10.3969: P 69:82(13) ack 87 =
win 5840 (DF)
09:29:05.461468 10.1.2.10.3969 > 129.41.69.137.smtp: . ack 82 win 64159 =
(DF)
09:29:05.489124 129.41.69.137.smtp > 10.1.2.10.3969: P 69:82(13) ack 87 =
win 5840 (DF)
09:29:05.489289 10.1.2.10.3969 > 129.41.69.137.smtp: . ack 82 win 64159 =
(DF)
09:29:05.637796 10.1.2.10.3969 > 129.41.69.137.smtp: P 87:93(6) ack 82 =
win 64159 (DF)
09:29:05.674856 129.41.69.137.smtp > 10.1.2.10.3969: P 82:95(13) ack 93 =
win 5840 (DF)
09:29:05.675104 10.1.2.10.3969 > 129.41.69.137.smtp: P 93:128(35) ack 95 =
win 64146 (DF)
09:29:05.711681 129.41.69.137.smtp > 10.1.2.10.3969: P 95:103(8) ack 128 =
win 5840 (DF)
09:29:05.712122 10.1.2.10.3969 > 129.41.69.137.smtp: P 128:159(31) ack =
103 win 64138 (DF)
09:29:05.760198 129.41.69.137.smtp > 10.1.2.10.3969: P 103:111(8) ack =
159 win 5840 (DF)
09:29:05.760453 10.1.2.10.3969 > 129.41.69.137.smtp: P 159:165(6) ack =
111 win 64130 (DF)
09:29:05.796963 129.41.69.137.smtp > 10.1.2.10.3969: P 111:125(14) ack =
165 win 5840 (DF)
09:29:05.797718 10.1.2.10.3969 > 129.41.69.137.smtp: . 165:1625(1460) =
ack 125 win 64116 (DF)
09:29:05.797843 10.1.2.10.3969 > 129.41.69.137.smtp: . 1625:3085(1460) =
ack 125 win 64116 (DF)
09:29:05.797966 10.1.2.10.3969 > 129.41.69.137.smtp: . 3085:4545(1460) =
ack 125 win 64116 (DF)
09:29:05.797994 10.1.2.10.3969 > 129.41.69.137.smtp: P 4545:4763(218) =
ack 125 win 64116 (DF)
09:29:05.798031 10.1.2.10.3969 > 129.41.69.137.smtp: P 4763:4768(5) ack =
125 win 64116 (DF)
09:29:05.834387 129.41.69.137.smtp > 10.1.2.10.3969: . ack 165 win 5840 =
<nop,nop,sack sack 1 {4545:4763} > (DF)
09:29:05.846822 129.41.69.137.smtp > 10.1.2.10.3969: . ack 165 win 5840 =
<nop,nop,sack sack 1 {4545:4768} > (DF)
09:29:05.847323 10.1.2.10.3969 > 129.41.69.137.smtp: . 165:1625(1460) =
ack 125 win 64116 (DF)
09:29:05.847445 10.1.2.10.3969 > 129.41.69.137.smtp: . 1625:3085(1460) =
ack 125 win 64116 (DF)
09:29:05.847568 10.1.2.10.3969 > 129.41.69.137.smtp: . 3085:4545(1460) =
ack 125 win 64116 (DF)
09:29:06.555338 10.1.2.10.3969 > 129.41.69.137.smtp: . 165:1625(1460) =
ack 125 win 64116 (DF)
09:29:08.195721 10.1.2.10.3969 > 129.41.69.137.smtp: . 165:1625(1460) =
ack 125 win 64116 (DF)
09:29:11.367205 10.1.2.10.3969 > 129.41.69.137.smtp: . 165:1625(1460) =
ack 125 win 64116 (DF)
09:29:17.819496 10.1.2.10.3969 > 129.41.69.137.smtp: . 165:1625(1460) =
ack 125 win 64116 (DF)
09:29:30.614817 10.1.2.10.3969 > 129.41.69.137.smtp: . 165:1625(1460) =
ack 125 win 64116 (DF)



----- Original Message -----=20
From: <richardo@start-global.com>
To: "Daniel Beckham" <danbeck-netfilter@dealnews.com>
Sent: Wednesday, March 05, 2003 3:58 AM
Subject: Re: DNAT and VPN Tunnel problems, traffic checks in, but =
doesn't check out


>=20
> Hi Daniel,
>=20
> What a bitch of a problem ;-) Seeing as you haven't mentioned external
> clients connecting to the mail server (via the eth0 interface), I =
assume
> that they can connect ok, right ? so the problem must lie somewhere in =
the
> tun0<->eth1 routing/DNAT/ip setup.
>=20
> Having re-read through the posts below, you should have two (NAT) =
rules
> that govern the interaction between these two interfaces, one to allow =
your
> 10.1.2.10 client to connect to the 129.... address space (actually =
using a
> 10.1.1... address), and one to allow the 129..... address space to =
connect
> back to the 10.1.2... clients, right ?, so you'll need two rules, as
> follows :
>=20
> iptables -t nat -A PREROUTING -s 10.1.2.10 -d 129.41.69.137 -j DNAT =
--to
> 10.1.1.7            #this is for eth1->tun0 connections
>=20
> iptables -t nat POSTROUTING -s 10.1.1.7 -d 10.1.2.10 -j SNAT --to
> 129.41.69.137            # this is for tun0->eth1 connections
>=20
> ... I don't know if you've tried this combination yet, but if my =
thinking
> of your network setup is correct, this should be the definative set of
> SNAT/DNAT rules that you should use (and should work).
>=20
> As for the filtering part of your setup, that all looks fine to me, I =
mean
> you basically just allow anything from tun0 and eth1 to be forwarded
> across, right ? so there should be no problems there ....
>=20
> Another idea, you say that you have dumped the tcp stuff at the remote
> network, have you run a tcpdump on the local firewall to see what =
happens
> as the packets come back (ie they could be being routed through eth0,
> instead of eth1 for some reason) .... can you tell I'm now clutching =
at
> straws ;-)
>=20
> Apart from the revised NAT rules above, and trawling through a couple =
of
> tcpdumps (one at the remote end, one at the firewall end), I can't =
really
> think of anything else that could be causing the behaviour you are
> experiencing (the upload/download and small emails issues are really
> wierd), if the above rules do not solve it I would be looking towards =
the
> routing tables in the firewall, mail server and client machines, and =
also
> be looking to see if there are any old static hosts file entries etc =
... ie
> looking at it from more of a tcp/ip based problem, rather than a =
purely
> iptables based problem, which the tcpdumps should help you with.
>=20
> Hope this helps,
> Richard.
>=20
> Richard Oatridge
> Head of IT, Start-global Ltd
> http://www.start-global.com.
> tel :  +44 1564 779297
> email : richardo@start-global.com
>=20
>=20
> |--------+----------------------------------->
> |        |          "Daniel Beckham"         |
> |        |          <danbeck-netfilter@dealne|
> |        |          ws.com>                  |
> |        |          Sent by:                 |
> |        |          netfilter-admin@lists.net|
> |        |          filter.org               |
> |        |                                   |
> |        |                                   |
> |        |          04/03/2003 17:26         |
> |        |                                   |
> |--------+----------------------------------->
>   =
>------------------------------------------------------------------------=
-------------------------------------------------|
>   |                                                                    =
                                                     |
>   |       To:     "Netfilter" <netfilter@lists.netfilter.org>          =
                                                     |
>   |       cc:                                                          =
                                                     |
>   |       Subject:     Re: DNAT and VPN Tunnel problems, traffic =
checks in, but doesn't check out                           |
>   =
>------------------------------------------------------------------------=
-------------------------------------------------|
>=20
>=20
>=20
>=20
> Yeah, I actually DNAT and SNAT private addresses to public addresses =
on the
> public interface on the firewall for some of the developers here, so I =
know
> that using that SNAT line *should* work, as it does in practice =
already.
>=20
> To answer your questions, here is the interface setup on the firewall.
>=20
> eth0 -- public interface (207.111.175.64/26) to the external router
> (internet) and normal traffic from and to the 129.41.69.128/26 subnet =
comes
> over this wire
> eth1 -- private interface to local network using 10.1.2.0/24 address =
space
> tun0 -- a openvpn tunnel between the remote 10.1.1.0/24 network and =
private
> 10.1.2.0/24 network
>=20
> The remote network is a private address space behind a router in the =
public
> 129.41.69.128/26 address space.  The eth0 interface does not =
specifically
> listen for traffic from 129.41.69.137, instead it's just the gateway =
for
> any
> external public traffic incoming to the 207.111.175.64/26 subnet.  =
There
> are
> also several eth0:N aliases for local private machines that are
> DNAT/SNAT'ed
> to public addresses for different reasons.
>=20
> I use the following lines to allow all traffic to be forwarded from =
the
> private interface (eth1) and the openvpn tunnel (tun0):
> $IPTABLES -A FORWARD -i tun+ -j ACCEPT
> $IPTABLES -A FORWARD -i tap+ -j ACCEPT
> $IPTABLES -A FORWARD -i eth1 -j ACCEPT
> $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>=20
> The line for the tap device isn't really necessary for my setup, but =
it is
> just there in case I decide to fool with bridging.
>=20
> As far as I can tell, things should be working correctly.  And the =
funny
> thing is that they do, sort of.  Responses to the DNAT'ed traffic =
initiated
> by the client returns over the tunnel, but only part of the response
> traffic
> by the client goes back out.  I.e. I can send very tiny emails, but =
nothing
> large like a reply.  I can download files via ftp, but can not upload.
> And
> I've confirmed that traffic outgoing from the client is going over the
> tunnel.
>=20
> This is driving me crazy. =3D)
>=20
> Daniel Beckham
> dealnews.com
>=20
>=20
> ----- Original Message -----
> From: <richardo@start-global.com>
> To: "Daniel Beckham" <danbeck-netfilter@dealnews.com>
> Sent: Tuesday, March 04, 2003 10:32 AM
> Subject: Re: DNAT and VPN Tunnel problems, traffic checks in, but =
doesn't
> check out
>=20
>=20
> >
> > Hi Daniel.
> >
> > The second rule you mention below would be correct and needed for =
these
> > connections to work properly, so keep it in there ..... a couple of
> things
> > I thought about, though ..... .did you setup an alias on the =
firewall
> box's
> > 'external' network card to listen for packets destined for =
129.41.69.137
> ?
> > ..... as follows :
> >
> > ifconfig ethWHATEVER:0 129.41.69.137 netmask your.mask.goes.here
> >
> > ... also, what does your filter table look like, is the FORWARD =
chain
> setup
> > correctly to allow the connection through the firewall ?
> >
> > Regards,
> > Richard.
> >
> > Richard Oatridge
> > Head of IT, Start-global Ltd
> > http://www.start-global.com
> > tel :  +44 1564 779297
> > email : richardo@start-global.com
> >
> >
> > |--------+----------------------------------->
> > |        |          "Daniel Beckham"         |
> > |        |          <danbeck-netfilter@dealne|
> > |        |          ws.com>                  |
> > |        |          Sent by:                 |
> > |        |          netfilter-admin@lists.net|
> > |        |          filter.org               |
> > |        |                                   |
> > |        |                                   |
> > |        |          04/03/2003 15:29         |
> > |        |                                   |
> > |--------+----------------------------------->
> >
> >
> =
-------------------------------------------------------------------------=
--
> ----------------------------------------------|
> >   |
> |
> >   |       To:     "Netfilter" <netfilter@lists.netfilter.org>
> |
> >   |       cc:
> |
> >   |       Subject:     Re: DNAT and VPN Tunnel problems, traffic =
checks
> in, but doesn't check out                           |
> >
> >
> =
-------------------------------------------------------------------------=
--
> ----------------------------------------------|
> >
> >
> >
> >
> > Thank you for your help, but I don't really understand what you are
> trying
> > to tell me.  The first config line makes sense and that is similar =
to
> what
> > I'm doing now.  Although, I'm not using any specific ports because =
I'm
> > testing at the moment.
> >
> > The second line is confusing though.  Why would I SNAT a 10.1.1.0/24
> > address
> > to another 10.1.1.0/24 address?  I was thinking you may have meant a
> > 10.1.2.0/24 address, but that makes even less sense as that is the =
client
> > trying to connect in the first place.  Also, why would you use a =
10.1.1.7
> > as
> > the -d option, the destination address?  Btw, I tried several
> combinations
> > including your example just for the hell of it, but none of them =
work. =3D)
> >
> > Something that I did not mention before though is that I have tried =
this:
> > iptables -t nat -A POSTROUTING -s 10.1.1.7 -p tcp -j SNAT --to
> > 129.41.69.137
> >
> > I would think this would solve the problem, but this doesn't help.
> Anyone
> > else have any ideas?
> >
> > Thank you for your help,
> >
> > Daniel Beckham
> > dealnews.com
> >
> >
> >
> > ----- Original Message -----
> > From: "Pavan Gokarn" <pavang@techknowledge.ws>
> > To: "Daniel Beckham" <danbeck-netfilter@dealnews.com>
> > Sent: Tuesday, March 04, 2003 12:15 AM
> > Subject: Re: DNAT and VPN Tunnel problems, traffic checks in, but =
doesn't
> > check out
> >
> >
> > > yes daniel you'll need a rule to get the packets back from the =
remote
> > > network back into your network.
> > > these will be the rules substitute them eoth you desired ip =
addresses
> > > for outgoing connection
> > > # iptables -t nat -A PREROUTING -d 129.41.69.137 -p tcp --dport 25 =
-j
> > > DNAT --to 10.1.1.7
> > > for incomming replies
> > > # iptables -t nat -A POSTROUTING -d 10.1.1.7 -p tcp --dport 25 -j
> > SNAT --to
> > > 10.1.1.something
> > >
> > > remember not to allow all types of connections to in and out =
because
> this
> > > might cause a security threat. substitute the 10.1.1.something ip
> address
> > > with the ip that connects/talks to the 10.1.1.7 address.
> > > this might work
> > > hope this was helpful
> > > regards
> > >
> > > ----- Original Message -----
> > > From: Daniel Beckham <danbeck-netfilter@dealnews.com>
> > > To: <netfilter@lists.netfilter.org>
> > > Sent: Tuesday, March 04, 2003 3:53 AM
> > > Subject: DNAT and VPN Tunnel problems, traffic checks in, but =
doesn't
> > check
> > > out
> > >
> > >
> > > > I'm seeing a strange issue with DNAT'ed traffic over a VPN.  =
Incoming
> > > > packets arrive just fine, but outgoing traffic has trouble for =
large
> > > streams
> > > > of tcp data.
> > > >
> > > > My setup is fairly simple.   A group of machines on a private =
network
> > > behind
> > > > a gateway/firewall (netfilter) connect through an OpenVPN tunnel =
to a
> > > remote
> > > > group of machines on a different private network.
> > > >
> > > > Local subnet: 10.1.2.0/24
> > > > Remote Subnet 10.1.1.0/24
> > > >
> > > > Client machines on the local subnet can freely talk to servers =
on the
> > > remote
> > > > subnet through the vpn with out any problems.
> > > >
> > > > Until the vpn tunnel was functional, client machines on the =
local
> > private
> > > > network connected to mail.dealnews.com to retrieve and send =
mail, a
> > public
> > > > interface of the mail server on the remote private network.  Now =
that
> > the
> > > > vpn is working, they need to retrieve and send mail using the =
private
> > > > address 10.1.1.7.
> > > >
> > > > For several reasons, one being laptop administration, I don't =
want to
> > > change
> > > > all of the mail client's ip addresses to 10.1.1.7.  I want to =
use
> > iptables
> > > > to DNAT packets headed for the public mail address
> (mail.dealnews.com)
> > to
> > > > the private mail address 10.1.1.7 so that packets are routed =
over the
> > vpn
> > > > instead of the internet.
> > > >
> > > > This is how I attempted to configure iptables:
> > > > iptables -t nat -A PREROUTING -s 10.1.2.10 -d 129.41.69.137 -p =
all -j
> > > > DNAT --to-destination 10.1.1.7
> > > >
> > > > The -s option is there so that I can test the config myself =
without
> > > Borking
> > > > the rest of the network.
> > > >
> > > > This seems to work at first as I can see traffic sent from the =
client
> > to
> > > > mail.dealnews.com over the tunnel interface on the remote =
network.
> > What
> > > > happens though, is although that I can connect to the remote =
mail
> > server
> >
> > > > just fine through IMAP and even send out a very small email =
message
> > > through
> > > > SMTP, large mail messages just stall and fail.  Ftp is the same =
way.
> I
> > > can
> > > > transfer files from the remote server, but I can not send any
> sizeable
> > > file
> > > > to the server.  I know for sure that traffic is traveling over =
the
> vpn
> > > > tunnel because I'm dumping the tunnel interface up at the remote
> > network.
> > > > This sounds like something to do with fragmentation or possibly
> > something
> > > > along that line of thinking, but I can not for the life of me =
figure
> > out
> > > > what this is.
> > > >
> > > > I wondered if possibly, I needed another rule to DNAT packets =
coming
> > from
> > > > the remote network over the tunnel back to the public
> mail.dealnews.com
> > ip
> > > > address:
> > > > iptables -t nat -A PREROUTING -s 129.41.69.37 -d 10.1.2.10 -p =
all -j
> > > > DNAT --to-destination 129.41.69.137
> > > >
> > > > But this didn't seem to help anything.
> > > >
> > > > Could anyone help me figure out how I can work around this?  =
Again,
> > > incoming
> > > > traffic through the tunnel seems to work just fine, but outgoing
> > traffic
> > > > only half seems to work.  As strange as that sounds.
> > > >
> > > > Thanks,
> > > >
> > > > Daniel
> > > > dealnews.com
> > > >
> > > >
> > > >
> > > >
> > >
> > >
> >
> >
> >
> >
> >
> >
> >
> >
> >
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20

------=_NextPart_000_008A_01C2E302.68BC3600
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2723.2500" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I'm sending this in html format hoping =
the dump=20
lines won't wrap.&nbsp; And sorry for the length of the dumps. =
=3D)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Using the configuration you suggested=20
below,&nbsp;(the original configuration I tried and the one that made =
the most=20
sense to me also)&nbsp;I've dumped both sides of the tunnel.&nbsp; Below =
is the=20
output.&nbsp;&nbsp; F</FONT><FONT face=3DArial size=3D2>rom the data =
below, it's=20
obvious that any outgoing packets with a full payload (the =
payload&nbsp;size is=20
1460)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>i.e. 09:29:05.797718 10.1.2.10.3969 =
&gt;=20
129.41.69.137.smtp: . 165:1625(1460) ack 125 win 64116 =
(DF)<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>never make it to the tunnel =
interface.&nbsp;&nbsp;=20
This is why incoming imap appears to work just fine, but sending mail=20
doesn't.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Again, this seems a bit crazy as my =
FORWARD chain=20
specifically allows any traffic to and from eth1 and tun0.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>$IPTABLES -A FORWARD -i tun+ -j=20
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <BR>$IPTABLES -A =
FORWARD -i=20
tap+ -j ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>$IPTABLES -A FORWARD -i eth1 -j =
ACCEPT<BR>$IPTABLES=20
-A FORWARD -m state --state ESTABLISHED,RELATED -j =
ACCEPT<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>tcpdump data:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;</DIV></FONT>
<DIV><FONT face=3DArial size=3D2>Firewall on the local side of the =
tunnel:=20
(tun0)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>09:29:04.986164 10.1.2.10.3969 &gt; =
10.1.1.7.smtp:=20
S 266730469:266730469(0) win 64240 &lt;mss 1460,nop,nop,sackOK&gt;=20
(DF)<BR>09:29:05.031684 10.1.1.7.smtp &gt; 10.1.2.10.3969: S=20
361700781:361700781(0) ack 266730470 win 5840 &lt;mss =
1460,nop,nop,sackOK&gt;=20
(DF)<BR>09:29:05.032048 10.1.2.10.3969 &gt; 10.1.1.7.smtp: . ack 1 win =
64240=20
(DF)<BR>09:29:05.070314 10.1.1.7.smtp &gt; 10.1.2.10.3969: P 1:30(29) =
ack 1 win=20
5840 (DF)<BR>09:29:05.071048 10.1.2.10.3969 &gt; 10.1.1.7.smtp: P =
1:15(14) ack=20
30 win 64211 (DF)<BR>09:29:05.116340 10.1.1.7.smtp &gt; 10.1.2.10.3969: =
. ack 15=20
win 5840 (DF)<BR>09:29:05.117105 10.1.1.7.smtp &gt; 10.1.2.10.3969: P =
30:53(23)=20
ack 15 win 5840 (DF)<BR>09:29:05.122915 10.1.2.10.3969 &gt; =
10.1.1.7.smtp: P=20
15:50(35) ack 53 win 64188 (DF)<BR>09:29:05.158822 10.1.1.7.smtp &gt;=20
10.1.2.10.3969: P 53:61(8) ack 50 win 5840 (DF)<BR>09:29:05.159389=20
10.1.2.10.3969 &gt; 10.1.1.7.smtp: P 50:81(31) ack 61 win 64180=20
(DF)<BR>09:29:05.199339 10.1.1.7.smtp &gt; 10.1.2.10.3969: P 61:69(8) =
ack 81 win=20
5840 (DF)<BR>09:29:05.217269 10.1.2.10.3969 &gt; 10.1.1.7.smtp: P =
81:87(6) ack=20
69 win 64172 (DF)<BR>09:29:05.253722 10.1.1.7.smtp &gt; 10.1.2.10.3969: =
P=20
69:82(13) ack 87 win 5840 (DF)<BR>09:29:05.461527 10.1.2.10.3969 &gt;=20
10.1.1.7.smtp: . ack 82 win 64159 (DF)<BR>09:29:05.489089 10.1.1.7.smtp =
&gt;=20
10.1.2.10.3969: P 69:82(13) ack 87 win 5840 (DF)<BR>09:29:05.489324=20
10.1.2.10.3969 &gt; 10.1.1.7.smtp: . ack 82 win 64159 =
(DF)<BR>09:29:05.637836=20
10.1.2.10.3969 &gt; 10.1.1.7.smtp: P 87:93(6) ack 82 win 64159=20
(DF)<BR>09:29:05.674820 10.1.1.7.smtp &gt; 10.1.2.10.3969: P 82:95(13) =
ack 93=20
win 5840 (DF)<BR>09:29:05.675137 10.1.2.10.3969 &gt; 10.1.1.7.smtp: P =
93:128(35)=20
ack 95 win 64146 (DF)<BR>09:29:05.711645 10.1.1.7.smtp &gt; =
10.1.2.10.3969: P=20
95:103(8) ack 128 win 5840 (DF)<BR>09:29:05.712153 10.1.2.10.3969 &gt;=20
10.1.1.7.smtp: P 128:159(31) ack 103 win 64138 (DF)<BR>09:29:05.760162=20
10.1.1.7.smtp &gt; 10.1.2.10.3969: P 103:111(8) ack 159 win 5840=20
(DF)<BR>09:29:05.760485 10.1.2.10.3969 &gt; 10.1.1.7.smtp: P 159:165(6) =
ack 111=20
win 64130 (DF)<BR>09:29:05.796928 10.1.1.7.smtp &gt; 10.1.2.10.3969: P=20
111:125(14) ack 165 win 5840 (DF)<BR>09:29:05.798040 10.1.2.10.3969 &gt; =

10.1.1.7.smtp: P 4545:4763(218) ack 125 win 64116 =
(DF)<BR>09:29:05.798086=20
10.1.2.10.3969 &gt; 10.1.1.7.smtp: P 4763:4768(5) ack 125 win 64116=20
(DF)<BR>09:29:05.834350 10.1.1.7.smtp &gt; 10.1.2.10.3969: . ack 165 win =
5840=20
&lt;nop,nop,sack sack 1 {4545:4763} &gt; (DF)<BR>09:29:05.846786 =
10.1.1.7.smtp=20
&gt; 10.1.2.10.3969: . ack 165 win 5840 &lt;nop,nop,sack sack 1 =
{4545:4768} &gt;=20
(DF)<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Remote side of the tunnel: =
(tun0)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>12:08:10.673521 10.1.2.10.3969 &gt; =
10.1.1.7.smtp:=20
S 266730469:266730469(0) win 64240 &lt;mss 1460,nop,nop,sackOK&gt;=20
(DF)<BR>12:08:10.674685 10.1.1.7.smtp &gt; 10.1.2.10.3969: S=20
361700781:361700781(0) ack 266730470 win 5840 &lt;mss =
1460,nop,nop,sackOK&gt;=20
(DF)<BR>12:08:10.718701 10.1.2.10.3969 &gt; 10.1.1.7.smtp: . ack 1 win =
64240=20
(DF)<BR>12:08:10.722990 10.1.1.7.smtp &gt; 10.1.2.10.3969: P 1:30(29) =
ack 1 win=20
5840 (DF)<BR>12:08:10.761777 10.1.2.10.3969 &gt; 10.1.1.7.smtp: P =
1:15(14) ack=20
30 win 64211 (DF)<BR>12:08:10.762026 10.1.1.7.smtp &gt; 10.1.2.10.3969: =
. ack 15=20
win 5840 (DF)<BR>12:08:10.762144 10.1.1.7.smtp &gt; 10.1.2.10.3969: P =
30:53(23)=20
ack 15 win 5840 (DF)<BR>12:08:10.809779 10.1.2.10.3969 &gt; =
10.1.1.7.smtp: P=20
15:50(35) ack 53 win 64188 (DF)<BR>12:08:10.810126 10.1.1.7.smtp &gt;=20
10.1.2.10.3969: P 53:61(8) ack 50 win 5840 (DF)<BR>12:08:10.846437=20
10.1.2.10.3969 &gt; 10.1.1.7.smtp: P 50:81(31) ack 61 win 64180=20
(DF)<BR>12:08:10.851162 10.1.1.7.smtp &gt; 10.1.2.10.3969: P 61:69(8) =
ack 81 win=20
5840 (DF)<BR>12:08:10.905777 10.1.2.10.3969 &gt; 10.1.1.7.smtp: P =
81:87(6) ack=20
69 win 64172 (DF)<BR>12:08:10.906068 10.1.1.7.smtp &gt; 10.1.2.10.3969: =
P=20
69:82(13) ack 87 win 5840 (DF)<BR>12:08:11.139331 10.1.1.7.smtp &gt;=20
10.1.2.10.3969: P 69:82(13) ack 87 win 5840 (DF)<BR>12:08:11.148104=20
10.1.2.10.3969 &gt; 10.1.1.7.smtp: . ack 82 win 64159 =
(DF)<BR>12:08:11.177095=20
10.1.2.10.3969 &gt; 10.1.1.7.smtp: . ack 82 win 64159 =
(DF)<BR>12:08:11.324853=20
10.1.2.10.3969 &gt; 10.1.1.7.smtp: P 87:93(6) ack 82 win 64159=20
(DF)<BR>12:08:11.325240 10.1.1.7.smtp &gt; 10.1.2.10.3969: P 82:95(13) =
ack 93=20
win 5840 (DF)<BR>12:08:11.363484 10.1.2.10.3969 &gt; 10.1.1.7.smtp: P =
93:128(35)=20
ack 95 win 64146 (DF)<BR>12:08:11.363818 10.1.1.7.smtp &gt; =
10.1.2.10.3969: P=20
95:103(8) ack 128 win 5840 (DF)<BR>12:08:11.412066 10.1.2.10.3969 &gt;=20
10.1.1.7.smtp: P 128:159(31) ack 103 win 64138 (DF)<BR>12:08:11.412477=20
10.1.1.7.smtp &gt; 10.1.2.10.3969: P 103:111(8) ack 159 win 5840=20
(DF)<BR>12:08:11.447083 10.1.2.10.3969 &gt; 10.1.1.7.smtp: P 159:165(6) =
ack 111=20
win 64130 (DF)<BR>12:08:11.449412 10.1.1.7.smtp &gt; 10.1.2.10.3969: P=20
111:125(14) ack 165 win 5840 (DF)<BR>12:08:11.486836 10.1.2.10.3969 &gt; =

10.1.1.7.smtp: P 4545:4763(218) ack 125 win 64116 (DF)<BR></FONT><FONT=20
face=3DArial size=3D2></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Here is the interesting =
part:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Local side of the tunnel, but the eth1 =
(private=20
network) interface:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>09:29:04.986096 10.1.2.10.3969 &gt;=20
129.41.69.137.smtp: S 266730469:266730469(0) win 64240 &lt;mss=20
1460,nop,nop,sackOK&gt; (DF)<BR>09:29:05.031723 129.41.69.137.smtp &gt;=20
10.1.2.10.3969: S 361700781:361700781(0) ack 266730470 win 5840 &lt;mss=20
1460,nop,nop,sackOK&gt; (DF)<BR>09:29:05.032012 10.1.2.10.3969 &gt;=20
129.41.69.137.smtp: . ack 1 win 64240 (DF)<BR>09:29:05.070351 =
129.41.69.137.smtp=20
&gt; 10.1.2.10.3969: P 1:30(29) ack 1 win 5840 (DF)<BR>09:29:05.071015=20
10.1.2.10.3969 &gt; 129.41.69.137.smtp: P 1:15(14) ack 30 win 64211=20
(DF)<BR>09:29:05.116376 129.41.69.137.smtp &gt; 10.1.2.10.3969: . ack 15 =
win=20
5840 (DF)<BR>09:29:05.117139 129.41.69.137.smtp &gt; 10.1.2.10.3969: P =
30:53(23)=20
ack 15 win 5840 (DF)<BR>09:29:05.122880 10.1.2.10.3969 &gt; =
129.41.69.137.smtp:=20
P 15:50(35) ack 53 win 64188 (DF)<BR>09:29:05.158861 129.41.69.137.smtp =
&gt;=20
10.1.2.10.3969: P 53:61(8) ack 50 win 5840 (DF)<BR>09:29:05.159354=20
10.1.2.10.3969 &gt; 129.41.69.137.smtp: P 50:81(31) ack 61 win 64180=20
(DF)<BR>09:29:05.199376 129.41.69.137.smtp &gt; 10.1.2.10.3969: P =
61:69(8) ack=20
81 win 5840 (DF)<BR>09:29:05.217234 10.1.2.10.3969 &gt; =
129.41.69.137.smtp: P=20
81:87(6) ack 69 win 64172 (DF)<BR>09:29:05.253760 129.41.69.137.smtp =
&gt;=20
10.1.2.10.3969: P 69:82(13) ack 87 win 5840 (DF)<BR>09:29:05.461468=20
10.1.2.10.3969 &gt; 129.41.69.137.smtp: . ack 82 win 64159=20
(DF)<BR>09:29:05.489124 129.41.69.137.smtp &gt; 10.1.2.10.3969: P =
69:82(13) ack=20
87 win 5840 (DF)<BR>09:29:05.489289 10.1.2.10.3969 &gt; =
129.41.69.137.smtp: .=20
ack 82 win 64159 (DF)<BR>09:29:05.637796 10.1.2.10.3969 &gt; =
129.41.69.137.smtp:=20
P 87:93(6) ack 82 win 64159 (DF)<BR>09:29:05.674856 129.41.69.137.smtp =
&gt;=20
10.1.2.10.3969: P 82:95(13) ack 93 win 5840 (DF)<BR>09:29:05.675104=20
10.1.2.10.3969 &gt; 129.41.69.137.smtp: P 93:128(35) ack 95 win 64146=20
(DF)<BR>09:29:05.711681 129.41.69.137.smtp &gt; 10.1.2.10.3969: P =
95:103(8) ack=20
128 win 5840 (DF)<BR>09:29:05.712122 10.1.2.10.3969 &gt; =
129.41.69.137.smtp: P=20
128:159(31) ack 103 win 64138 (DF)<BR>09:29:05.760198 129.41.69.137.smtp =
&gt;=20
10.1.2.10.3969: P 103:111(8) ack 159 win 5840 (DF)<BR>09:29:05.760453=20
10.1.2.10.3969 &gt; 129.41.69.137.smtp: P 159:165(6) ack 111 win 64130=20
(DF)<BR>09:29:05.796963 129.41.69.137.smtp &gt; 10.1.2.10.3969: P =
111:125(14)=20
ack 165 win 5840 (DF)<BR>09:29:05.797718 10.1.2.10.3969 &gt; =
129.41.69.137.smtp:=20
. 165:1625(1460) ack 125 win 64116 (DF)<BR>09:29:05.797843 =
10.1.2.10.3969 &gt;=20
129.41.69.137.smtp: . 1625:3085(1460) ack 125 win 64116 =
(DF)<BR>09:29:05.797966=20
10.1.2.10.3969 &gt; 129.41.69.137.smtp: . 3085:4545(1460) ack 125 win =
64116=20
(DF)<BR>09:29:05.797994 10.1.2.10.3969 &gt; 129.41.69.137.smtp: P =
4545:4763(218)=20
ack 125 win 64116 (DF)<BR>09:29:05.798031 10.1.2.10.3969 &gt;=20
129.41.69.137.smtp: P 4763:4768(5) ack 125 win 64116 =
(DF)<BR>09:29:05.834387=20
129.41.69.137.smtp &gt; 10.1.2.10.3969: . ack 165 win 5840 =
&lt;nop,nop,sack sack=20
1 {4545:4763} &gt; (DF)<BR>09:29:05.846822 129.41.69.137.smtp &gt;=20
10.1.2.10.3969: . ack 165 win 5840 &lt;nop,nop,sack sack 1 {4545:4768} =
&gt;=20
(DF)<BR>09:29:05.847323 10.1.2.10.3969 &gt; 129.41.69.137.smtp: . =
165:1625(1460)=20
ack 125 win 64116 (DF)<BR>09:29:05.847445 10.1.2.10.3969 &gt;=20
129.41.69.137.smtp: . 1625:3085(1460) ack 125 win 64116 =
(DF)<BR>09:29:05.847568=20
10.1.2.10.3969 &gt; 129.41.69.137.smtp: . 3085:4545(1460) ack 125 win =
64116=20
(DF)<BR>09:29:06.555338 10.1.2.10.3969 &gt; 129.41.69.137.smtp: . =
165:1625(1460)=20
ack 125 win 64116 (DF)<BR>09:29:08.195721 10.1.2.10.3969 &gt;=20
129.41.69.137.smtp: . 165:1625(1460) ack 125 win 64116 =
(DF)<BR>09:29:11.367205=20
10.1.2.10.3969 &gt; 129.41.69.137.smtp: . 165:1625(1460) ack 125 win =
64116=20
(DF)<BR>09:29:17.819496 10.1.2.10.3969 &gt; 129.41.69.137.smtp: . =
165:1625(1460)=20
ack 125 win 64116 (DF)<BR>09:29:30.614817 10.1.2.10.3969 &gt;=20
129.41.69.137.smtp: . 165:1625(1460) ack 125 win 64116 =
(DF)<BR></DIV></FONT>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>----- Original Message ----- </FONT>
<DIV><FONT face=3DArial size=3D2>From: &lt;</FONT><A=20
href=3D"mailto:richardo@start-global.com"><FONT face=3DArial=20
size=3D2>richardo@start-global.com</FONT></A><FONT face=3DArial=20
size=3D2>&gt;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>To: "Daniel Beckham" &lt;</FONT><A=20
href=3D"mailto:danbeck-netfilter@dealnews.com"><FONT face=3DArial=20
size=3D2>danbeck-netfilter@dealnews.com</FONT></A><FONT face=3DArial=20
size=3D2>&gt;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Sent: Wednesday, March 05, 2003 3:58=20
AM</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Subject: Re: DNAT and VPN Tunnel =
problems, traffic=20
checks in, but doesn't check out</FONT></DIV></DIV>
<DIV><FONT face=3DArial><BR><FONT size=3D2></FONT></FONT></DIV><FONT =
face=3DArial=20
size=3D2>&gt; <BR>&gt; Hi Daniel,<BR>&gt; <BR>&gt; What a bitch of a =
problem ;-)=20
Seeing as you haven't mentioned external<BR>&gt; clients connecting to =
the mail=20
server (via the eth0 interface), I assume<BR>&gt; that they can connect =
ok,=20
right ? so the problem must lie somewhere in the<BR>&gt; =
tun0&lt;-&gt;eth1=20
routing/DNAT/ip setup.<BR>&gt; <BR>&gt; Having re-read through the posts =
below,=20
you should have two (NAT) rules<BR>&gt; that govern the interaction =
between=20
these two interfaces, one to allow your<BR>&gt; 10.1.2.10 client to =
connect to=20
the 129.... address space (actually using a<BR>&gt; 10.1.1... address), =
and one=20
to allow the 129..... address space to connect<BR>&gt; back to the =
10.1.2...=20
clients, right ?, so you'll need two rules, as<BR>&gt; follows :<BR>&gt; =

<BR>&gt; iptables -t nat -A PREROUTING -s 10.1.2.10 -d 129.41.69.137 -j =
DNAT=20
--to<BR>&gt;=20
10.1.1.7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; #this=20
is for eth1-&gt;tun0 connections<BR>&gt; <BR>&gt; iptables -t nat =
POSTROUTING -s=20
10.1.1.7 -d 10.1.2.10 -j SNAT --to<BR>&gt;=20
129.41.69.137&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;=20
# this is for tun0-&gt;eth1 connections<BR>&gt; <BR>&gt; ... I don't =
know if=20
you've tried this combination yet, but if my thinking<BR>&gt; of your =
network=20
setup is correct, this should be the definative set of<BR>&gt; SNAT/DNAT =
rules=20
that you should use (and should work).<BR>&gt; <BR>&gt; As for the =
filtering=20
part of your setup, that all looks fine to me, I mean<BR>&gt; you =
basically just=20
allow anything from tun0 and eth1 to be forwarded<BR>&gt; across, right =
? so=20
there should be no problems there ....<BR>&gt; <BR>&gt; Another idea, =
you say=20
that you have dumped the tcp stuff at the remote<BR>&gt; network, have =
you run a=20
tcpdump on the local firewall to see what happens<BR>&gt; as the packets =
come=20
back (ie they could be being routed through eth0,<BR>&gt; instead of =
eth1 for=20
some reason) .... can you tell I'm now clutching at<BR>&gt; straws =
;-)<BR>&gt;=20
<BR>&gt; Apart from the revised NAT rules above, and trawling through a =
couple=20
of<BR>&gt; tcpdumps (one at the remote end, one at the firewall end), I =
can't=20
really<BR>&gt; think of anything else that could be causing the =
behaviour you=20
are<BR>&gt; experiencing (the upload/download and small emails issues =
are=20
really<BR>&gt; wierd), if the above rules do not solve it I would be =
looking=20
towards the<BR>&gt; routing tables in the firewall, mail server and =
client=20
machines, and also<BR>&gt; be looking to see if there are any old static =
hosts=20
file entries etc ... ie<BR>&gt; looking at it from more of a tcp/ip =
based=20
problem, rather than a purely<BR>&gt; iptables based problem, which the =
tcpdumps=20
should help you with.<BR>&gt; <BR>&gt; Hope this helps,<BR>&gt; =
Richard.<BR>&gt;=20
<BR>&gt; Richard Oatridge<BR>&gt; Head of IT, Start-global Ltd<BR>&gt; =
</FONT><A=20
href=3D"http://www.start-global.com"><FONT face=3DArial=20
size=3D2>http://www.start-global.com</FONT></A><FONT face=3DArial =
size=3D2>.<BR>&gt;=20
tel :&nbsp; +44 1564 779297<BR>&gt; email : </FONT><A=20
href=3D"mailto:richardo@start-global.com"><FONT face=3DArial=20
size=3D2>richardo@start-global.com</FONT></A><BR><FONT face=3DArial =
size=3D2>&gt;=20
<BR>&gt; <BR>&gt; =
|--------+-----------------------------------&gt;<BR>&gt;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "Daniel=20
Beckham"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<BR>&gt;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;</FONT><A=20
href=3D"mailto:danbeck-netfilter@dealne"><FONT face=3DArial=20
size=3D2>danbeck-netfilter@dealne</FONT></A><FONT face=3DArial =
size=3D2>|<BR>&gt;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ws.com&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|<BR>&gt; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sent=20
by:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;=20
|<BR>&gt; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT><A=20
href=3D"mailto:netfilter-admin@lists.net"><FONT face=3DArial=20
size=3D2>netfilter-admin@lists.net</FONT></A><FONT face=3DArial =
size=3D2>|<BR>&gt;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
filter.org&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
|<BR>&gt; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|<BR>&gt; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|<BR>&gt; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 04/03/2003=20
17:26&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<BR>&gt;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|<BR>&gt; |--------+-----------------------------------&gt;<BR>&gt; =
&nbsp;=20
&gt;---------------------------------------------------------------------=
----------------------------------------------------|<BR>&gt;=20
&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|<BR>&gt; &nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
To:&nbsp;&nbsp;&nbsp;&nbsp; "Netfilter" &lt;</FONT><A=20
href=3D"mailto:netfilter@lists.netfilter.org"><FONT face=3DArial=20
size=3D2>netfilter@lists.netfilter.org</FONT></A><FONT face=3DArial=20
size=3D2>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
|<BR>&gt; &nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
cc:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;=20
|<BR>&gt; &nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Subject:&nbsp;&nbsp;&nbsp;&nbsp; Re: DNAT and VPN Tunnel problems, =
traffic=20
checks in, but doesn't check=20
out&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
|<BR>&gt; &nbsp;=20
&gt;---------------------------------------------------------------------=
----------------------------------------------------|<BR>&gt;=20
<BR>&gt; <BR>&gt; <BR>&gt; <BR>&gt; Yeah, I actually DNAT and SNAT =
private=20
addresses to public addresses on the<BR>&gt; public interface on the =
firewall=20
for some of the developers here, so I know<BR>&gt; that using that SNAT =
line=20
*should* work, as it does in practice already.<BR>&gt; <BR>&gt; To =
answer your=20
questions, here is the interface setup on the firewall.<BR>&gt; <BR>&gt; =
eth0 --=20
public interface (207.111.175.64/26) to the external router<BR>&gt; =
(internet)=20
and normal traffic from and to the 129.41.69.128/26 subnet comes<BR>&gt; =
over=20
this wire<BR>&gt; eth1 -- private interface to local network using =
10.1.2.0/24=20
address space<BR>&gt; tun0 -- a openvpn tunnel between the remote =
10.1.1.0/24=20
network and private<BR>&gt; 10.1.2.0/24 network<BR>&gt; <BR>&gt; The =
remote=20
network is a private address space behind a router in the public<BR>&gt; =

129.41.69.128/26 address space.&nbsp; The eth0 interface does not=20
specifically<BR>&gt; listen for traffic from 129.41.69.137, instead it's =
just=20
the gateway for<BR>&gt; any<BR>&gt; external public traffic incoming to =
the=20
207.111.175.64/26 subnet.&nbsp; There<BR>&gt; are<BR>&gt; also several =
eth0:N=20
aliases for local private machines that are<BR>&gt; DNAT/SNAT'ed<BR>&gt; =
to=20
public addresses for different reasons.<BR>&gt; <BR>&gt; I use the =
following=20
lines to allow all traffic to be forwarded from the<BR>&gt; private =
interface=20
(eth1) and the openvpn tunnel (tun0):<BR>&gt; $IPTABLES -A FORWARD -i =
tun+ -j=20
ACCEPT<BR>&gt; $IPTABLES -A FORWARD -i tap+ -j ACCEPT<BR>&gt; $IPTABLES =
-A=20
FORWARD -i eth1 -j ACCEPT<BR>&gt; $IPTABLES -A FORWARD -m state --state=20
ESTABLISHED,RELATED -j ACCEPT<BR>&gt; <BR>&gt; The line for the tap =
device isn't=20
really necessary for my setup, but it is<BR>&gt; just there in case I =
decide to=20
fool with bridging.<BR>&gt; <BR>&gt; As far as I can tell, things should =
be=20
working correctly.&nbsp; And the funny<BR>&gt; thing is that they do, =
sort=20
of.&nbsp; Responses to the DNAT'ed traffic initiated<BR>&gt; by the =
client=20
returns over the tunnel, but only part of the response<BR>&gt; =
traffic<BR>&gt;=20
by the client goes back out.&nbsp; I.e. I can send very tiny emails, but =

nothing<BR>&gt; large like a reply.&nbsp; I can download files via ftp, =
but can=20
not upload.<BR>&gt; And<BR>&gt; I've confirmed that traffic outgoing =
from the=20
client is going over the<BR>&gt; tunnel.<BR>&gt; <BR>&gt; This is =
driving me=20
crazy. =3D)<BR>&gt; <BR>&gt; Daniel Beckham<BR>&gt; dealnews.com<BR>&gt; =
<BR>&gt;=20
<BR>&gt; ----- Original Message -----<BR>&gt; From: &lt;</FONT><A=20
href=3D"mailto:richardo@start-global.com"><FONT face=3DArial=20
size=3D2>richardo@start-global.com</FONT></A><FONT face=3DArial =
size=3D2>&gt;<BR>&gt;=20
To: "Daniel Beckham" &lt;</FONT><A=20
href=3D"mailto:danbeck-netfilter@dealnews.com"><FONT face=3DArial=20
size=3D2>danbeck-netfilter@dealnews.com</FONT></A><FONT face=3DArial=20
size=3D2>&gt;<BR>&gt; Sent: Tuesday, March 04, 2003 10:32 AM<BR>&gt; =
Subject: Re:=20
DNAT and VPN Tunnel problems, traffic checks in, but doesn't<BR>&gt; =
check=20
out<BR>&gt; <BR>&gt; <BR>&gt; &gt;<BR>&gt; &gt; Hi Daniel.<BR>&gt; =
&gt;<BR>&gt;=20
&gt; The second rule you mention below would be correct and needed for=20
these<BR>&gt; &gt; connections to work properly, so keep it in there =
..... a=20
couple of<BR>&gt; things<BR>&gt; &gt; I thought about, though ..... .did =
you=20
setup an alias on the firewall<BR>&gt; box's<BR>&gt; &gt; 'external' =
network=20
card to listen for packets destined for 129.41.69.137<BR>&gt; ?<BR>&gt; =
&gt;=20
..... as follows :<BR>&gt; &gt;<BR>&gt; &gt; ifconfig ethWHATEVER:0=20
129.41.69.137 netmask your.mask.goes.here<BR>&gt; &gt;<BR>&gt; &gt; ... =
also,=20
what does your filter table look like, is the FORWARD chain<BR>&gt;=20
setup<BR>&gt; &gt; correctly to allow the connection through the =
firewall=20
?<BR>&gt; &gt;<BR>&gt; &gt; Regards,<BR>&gt; &gt; Richard.<BR>&gt; =
&gt;<BR>&gt;=20
&gt; Richard Oatridge<BR>&gt; &gt; Head of IT, Start-global Ltd<BR>&gt; =
&gt;=20
</FONT><A href=3D"http://www.start-global.com"><FONT face=3DArial=20
size=3D2>http://www.start-global.com</FONT></A><BR><FONT face=3DArial =
size=3D2>&gt;=20
&gt; tel :&nbsp; +44 1564 779297<BR>&gt; &gt; email : </FONT><A=20
href=3D"mailto:richardo@start-global.com"><FONT face=3DArial=20
size=3D2>richardo@start-global.com</FONT></A><BR><FONT face=3DArial =
size=3D2>&gt;=20
&gt;<BR>&gt; &gt;<BR>&gt; &gt;=20
|--------+-----------------------------------&gt;<BR>&gt; &gt;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "Daniel=20
Beckham"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<BR>&gt; &gt;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;</FONT><A=20
href=3D"mailto:danbeck-netfilter@dealne"><FONT face=3DArial=20
size=3D2>danbeck-netfilter@dealne</FONT></A><FONT face=3DArial =
size=3D2>|<BR>&gt; &gt;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ws.com&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|<BR>&gt; &gt; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sent=20
by:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;=20
|<BR>&gt; &gt; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT><A=20
href=3D"mailto:netfilter-admin@lists.net"><FONT face=3DArial=20
size=3D2>netfilter-admin@lists.net</FONT></A><FONT face=3DArial =
size=3D2>|<BR>&gt;=20
&gt; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
filter.org&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
|<BR>&gt; &gt; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|<BR>&gt; &gt; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|<BR>&gt; &gt; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 04/03/2003=20
15:29&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<BR>&gt; &gt;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|<BR>&gt; &gt; |--------+-----------------------------------&gt;<BR>&gt; =

&gt;<BR>&gt; &gt;<BR>&gt;=20
-------------------------------------------------------------------------=
--<BR>&gt;=20
----------------------------------------------|<BR>&gt; &gt;&nbsp;&nbsp; =

|<BR>&gt; |<BR>&gt; &gt;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
To:&nbsp;&nbsp;&nbsp;&nbsp; "Netfilter" &lt;</FONT><A=20
href=3D"mailto:netfilter@lists.netfilter.org"><FONT face=3DArial=20
size=3D2>netfilter@lists.netfilter.org</FONT></A><FONT face=3DArial=20
size=3D2>&gt;<BR>&gt; |<BR>&gt; &gt;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cc:<BR>&gt; |<BR>&gt; =
&gt;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Subject:&nbsp;&nbsp;&nbsp;&nbsp; =
Re: DNAT=20
and VPN Tunnel problems, traffic checks<BR>&gt; in, but doesn't check=20
out&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
|<BR>&gt; &gt;<BR>&gt; &gt;<BR>&gt;=20
-------------------------------------------------------------------------=
--<BR>&gt;=20
----------------------------------------------|<BR>&gt; &gt;<BR>&gt;=20
&gt;<BR>&gt; &gt;<BR>&gt; &gt;<BR>&gt; &gt; Thank you for your help, but =
I don't=20
really understand what you are<BR>&gt; trying<BR>&gt; &gt; to tell =
me.&nbsp; The=20
first config line makes sense and that is similar to<BR>&gt; =
what<BR>&gt; &gt;=20
I'm doing now.&nbsp; Although, I'm not using any specific ports because=20
I'm<BR>&gt; &gt; testing at the moment.<BR>&gt; &gt;<BR>&gt; &gt; The =
second=20
line is confusing though.&nbsp; Why would I SNAT a 10.1.1.0/24<BR>&gt; =
&gt;=20
address<BR>&gt; &gt; to another 10.1.1.0/24 address?&nbsp; I was =
thinking you=20
may have meant a<BR>&gt; &gt; 10.1.2.0/24 address, but that makes even =
less=20
sense as that is the client<BR>&gt; &gt; trying to connect in the first=20
place.&nbsp; Also, why would you use a 10.1.1.7<BR>&gt; &gt; as<BR>&gt; =
&gt; the=20
-d option, the destination address?&nbsp; Btw, I tried several<BR>&gt;=20
combinations<BR>&gt; &gt; including your example just for the hell of =
it, but=20
none of them work. =3D)<BR>&gt; &gt;<BR>&gt; &gt; Something that I did =
not mention=20
before though is that I have tried this:<BR>&gt; &gt; iptables -t nat -A =

POSTROUTING -s 10.1.1.7 -p tcp -j SNAT --to<BR>&gt; &gt; =
129.41.69.137<BR>&gt;=20
&gt;<BR>&gt; &gt; I would think this would solve the problem, but this =
doesn't=20
help.<BR>&gt; Anyone<BR>&gt; &gt; else have any ideas?<BR>&gt; =
&gt;<BR>&gt; &gt;=20
Thank you for your help,<BR>&gt; &gt;<BR>&gt; &gt; Daniel =
Beckham<BR>&gt; &gt;=20
dealnews.com<BR>&gt; &gt;<BR>&gt; &gt;<BR>&gt; &gt;<BR>&gt; &gt; ----- =
Original=20
Message -----<BR>&gt; &gt; From: "Pavan Gokarn" &lt;</FONT><A=20
href=3D"mailto:pavang@techknowledge.ws"><FONT face=3DArial=20
size=3D2>pavang@techknowledge.ws</FONT></A><FONT face=3DArial =
size=3D2>&gt;<BR>&gt;=20
&gt; To: "Daniel Beckham" &lt;</FONT><A=20
href=3D"mailto:danbeck-netfilter@dealnews.com"><FONT face=3DArial=20
size=3D2>danbeck-netfilter@dealnews.com</FONT></A><FONT face=3DArial=20
size=3D2>&gt;<BR>&gt; &gt; Sent: Tuesday, March 04, 2003 12:15 =
AM<BR>&gt; &gt;=20
Subject: Re: DNAT and VPN Tunnel problems, traffic checks in, but=20
doesn't<BR>&gt; &gt; check out<BR>&gt; &gt;<BR>&gt; &gt;<BR>&gt; &gt; =
&gt; yes=20
daniel you'll need a rule to get the packets back from the =
remote<BR>&gt; &gt;=20
&gt; network back into your network.<BR>&gt; &gt; &gt; these will be the =
rules=20
substitute them eoth you desired ip addresses<BR>&gt; &gt; &gt; for =
outgoing=20
connection<BR>&gt; &gt; &gt; # iptables -t nat -A PREROUTING -d =
129.41.69.137 -p=20
tcp --dport 25 -j<BR>&gt; &gt; &gt; DNAT --to 10.1.1.7<BR>&gt; &gt; &gt; =
for=20
incomming replies<BR>&gt; &gt; &gt; # iptables -t nat -A POSTROUTING -d =
10.1.1.7=20
-p tcp --dport 25 -j<BR>&gt; &gt; SNAT --to<BR>&gt; &gt; &gt;=20
10.1.1.something<BR>&gt; &gt; &gt;<BR>&gt; &gt; &gt; remember not to =
allow all=20
types of connections to in and out because<BR>&gt; this<BR>&gt; &gt; =
&gt; might=20
cause a security threat. substitute the 10.1.1.something ip<BR>&gt;=20
address<BR>&gt; &gt; &gt; with the ip that connects/talks to the =
10.1.1.7=20
address.<BR>&gt; &gt; &gt; this might work<BR>&gt; &gt; &gt; hope this =
was=20
helpful<BR>&gt; &gt; &gt; regards<BR>&gt; &gt; &gt;<BR>&gt; &gt; &gt; =
-----=20
Original Message -----<BR>&gt; &gt; &gt; From: Daniel Beckham =
&lt;</FONT><A=20
href=3D"mailto:danbeck-netfilter@dealnews.com"><FONT face=3DArial=20
size=3D2>danbeck-netfilter@dealnews.com</FONT></A><FONT face=3DArial=20
size=3D2>&gt;<BR>&gt; &gt; &gt; To: &lt;</FONT><A=20
href=3D"mailto:netfilter@lists.netfilter.org"><FONT face=3DArial=20
size=3D2>netfilter@lists.netfilter.org</FONT></A><FONT face=3DArial=20
size=3D2>&gt;<BR>&gt; &gt; &gt; Sent: Tuesday, March 04, 2003 3:53 =
AM<BR>&gt; &gt;=20
&gt; Subject: DNAT and VPN Tunnel problems, traffic checks in, but=20
doesn't<BR>&gt; &gt; check<BR>&gt; &gt; &gt; out<BR>&gt; &gt; =
&gt;<BR>&gt; &gt;=20
&gt;<BR>&gt; &gt; &gt; &gt; I'm seeing a strange issue with DNAT'ed =
traffic over=20
a VPN.&nbsp; Incoming<BR>&gt; &gt; &gt; &gt; packets arrive just fine, =
but=20
outgoing traffic has trouble for large<BR>&gt; &gt; &gt; streams<BR>&gt; =
&gt;=20
&gt; &gt; of tcp data.<BR>&gt; &gt; &gt; &gt;<BR>&gt; &gt; &gt; &gt; My =
setup is=20
fairly simple.&nbsp;&nbsp; A group of machines on a private =
network<BR>&gt; &gt;=20
&gt; behind<BR>&gt; &gt; &gt; &gt; a gateway/firewall (netfilter) =
connect=20
through an OpenVPN tunnel to a<BR>&gt; &gt; &gt; remote<BR>&gt; &gt; =
&gt; &gt;=20
group of machines on a different private network.<BR>&gt; &gt; &gt; =
&gt;<BR>&gt;=20
&gt; &gt; &gt; Local subnet: 10.1.2.0/24<BR>&gt; &gt; &gt; &gt; Remote =
Subnet=20
10.1.1.0/24<BR>&gt; &gt; &gt; &gt;<BR>&gt; &gt; &gt; &gt; Client =
machines on the=20
local subnet can freely talk to servers on the<BR>&gt; &gt; &gt; =
remote<BR>&gt;=20
&gt; &gt; &gt; subnet through the vpn with out any problems.<BR>&gt; =
&gt; &gt;=20
&gt;<BR>&gt; &gt; &gt; &gt; Until the vpn tunnel was functional, client =
machines=20
on the local<BR>&gt; &gt; private<BR>&gt; &gt; &gt; &gt; network =
connected to=20
mail.dealnews.com to retrieve and send mail, a<BR>&gt; &gt; =
public<BR>&gt; &gt;=20
&gt; &gt; interface of the mail server on the remote private =
network.&nbsp; Now=20
that<BR>&gt; &gt; the<BR>&gt; &gt; &gt; &gt; vpn is working, they need =
to=20
retrieve and send mail using the private<BR>&gt; &gt; &gt; &gt; address=20
10.1.1.7.<BR>&gt; &gt; &gt; &gt;<BR>&gt; &gt; &gt; &gt; For several =
reasons, one=20
being laptop administration, I don't want to<BR>&gt; &gt; &gt; =
change<BR>&gt;=20
&gt; &gt; &gt; all of the mail client's ip addresses to 10.1.1.7.&nbsp; =
I want=20
to use<BR>&gt; &gt; iptables<BR>&gt; &gt; &gt; &gt; to DNAT packets =
headed for=20
the public mail address<BR>&gt; (mail.dealnews.com)<BR>&gt; &gt; =
to<BR>&gt; &gt;=20
&gt; &gt; the private mail address 10.1.1.7 so that packets are routed =
over=20
the<BR>&gt; &gt; vpn<BR>&gt; &gt; &gt; &gt; instead of the =
internet.<BR>&gt;=20
&gt; &gt; &gt;<BR>&gt; &gt; &gt; &gt; This is how I attempted to =
configure=20
iptables:<BR>&gt; &gt; &gt; &gt; iptables -t nat -A PREROUTING -s =
10.1.2.10 -d=20
129.41.69.137 -p all -j<BR>&gt; &gt; &gt; &gt; DNAT --to-destination=20
10.1.1.7<BR>&gt; &gt; &gt; &gt;<BR>&gt; &gt; &gt; &gt; The -s option is =
there so=20
that I can test the config myself without<BR>&gt; &gt; &gt; =
Borking<BR>&gt; &gt;=20
&gt; &gt; the rest of the network.<BR>&gt; &gt; &gt; &gt;<BR>&gt; &gt; =
&gt; &gt;=20
This seems to work at first as I can see traffic sent from the =
client<BR>&gt;=20
&gt; to<BR>&gt; &gt; &gt; &gt; mail.dealnews.com over the tunnel =
interface on=20
the remote network.<BR>&gt; &gt; What<BR>&gt; &gt; &gt; &gt; happens =
though, is=20
although that I can connect to the remote mail<BR>&gt; &gt; =
server<BR>&gt;=20
&gt;<BR>&gt; &gt; &gt; &gt; just fine through IMAP and even send out a =
very=20
small email message<BR>&gt; &gt; &gt; through<BR>&gt; &gt; &gt; &gt; =
SMTP, large=20
mail messages just stall and fail.&nbsp; Ftp is the same way.<BR>&gt; =
I<BR>&gt;=20
&gt; &gt; can<BR>&gt; &gt; &gt; &gt; transfer files from the remote =
server, but=20
I can not send any<BR>&gt; sizeable<BR>&gt; &gt; &gt; file<BR>&gt; &gt; =
&gt;=20
&gt; to the server.&nbsp; I know for sure that traffic is traveling over =

the<BR>&gt; vpn<BR>&gt; &gt; &gt; &gt; tunnel because I'm dumping the =
tunnel=20
interface up at the remote<BR>&gt; &gt; network.<BR>&gt; &gt; &gt; &gt; =
This=20
sounds like something to do with fragmentation or possibly<BR>&gt; &gt;=20
something<BR>&gt; &gt; &gt; &gt; along that line of thinking, but I can =
not for=20
the life of me figure<BR>&gt; &gt; out<BR>&gt; &gt; &gt; &gt; what this=20
is.<BR>&gt; &gt; &gt; &gt;<BR>&gt; &gt; &gt; &gt; I wondered if =
possibly, I=20
needed another rule to DNAT packets coming<BR>&gt; &gt; from<BR>&gt; =
&gt; &gt;=20
&gt; the remote network over the tunnel back to the public<BR>&gt;=20
mail.dealnews.com<BR>&gt; &gt; ip<BR>&gt; &gt; &gt; &gt; =
address:<BR>&gt; &gt;=20
&gt; &gt; iptables -t nat -A PREROUTING -s 129.41.69.37 -d 10.1.2.10 -p =
all=20
-j<BR>&gt; &gt; &gt; &gt; DNAT --to-destination 129.41.69.137<BR>&gt; =
&gt; &gt;=20
&gt;<BR>&gt; &gt; &gt; &gt; But this didn't seem to help =
anything.<BR>&gt; &gt;=20
&gt; &gt;<BR>&gt; &gt; &gt; &gt; Could anyone help me figure out how I =
can work=20
around this?&nbsp; Again,<BR>&gt; &gt; &gt; incoming<BR>&gt; &gt; &gt; =
&gt;=20
traffic through the tunnel seems to work just fine, but outgoing<BR>&gt; =
&gt;=20
traffic<BR>&gt; &gt; &gt; &gt; only half seems to work.&nbsp; As strange =
as that=20
sounds.<BR>&gt; &gt; &gt; &gt;<BR>&gt; &gt; &gt; &gt; Thanks,<BR>&gt; =
&gt; &gt;=20
&gt;<BR>&gt; &gt; &gt; &gt; Daniel<BR>&gt; &gt; &gt; &gt; =
dealnews.com<BR>&gt;=20
&gt; &gt; &gt;<BR>&gt; &gt; &gt; &gt;<BR>&gt; &gt; &gt; &gt;<BR>&gt; =
&gt; &gt;=20
&gt;<BR>&gt; &gt; &gt;<BR>&gt; &gt; &gt;<BR>&gt; &gt;<BR>&gt; =
&gt;<BR>&gt;=20
&gt;<BR>&gt; &gt;<BR>&gt; &gt;<BR>&gt; &gt;<BR>&gt; &gt;<BR>&gt; =
&gt;<BR>&gt;=20
&gt;<BR>&gt; <BR>&gt; <BR>&gt; <BR>&gt; <BR>&gt; <BR>&gt; <BR>&gt; =
<BR>&gt;=20
<BR>&gt; <BR>&gt; </FONT></BODY></HTML>

------=_NextPart_000_008A_01C2E302.68BC3600--



