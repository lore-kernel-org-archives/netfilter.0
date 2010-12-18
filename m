From: "Alec Matusis" <matusis@matusis.com>
Subject: RE: PREROUTING DNAT *inconsistent* behavior
Date: Fri, 17 Dec 2010 17:55:13 -0800
Message-ID: <06f901cb9e56$9cb7fa30$d627ee90$@com>
References: <032601cb9c12$7d1a4890$774ed9b0$@com> <4D0BE21C.7030905@plouf.fr.eu.org> <06c201cb9e46$b4d13560$1e73a020$@com> <4D0BFD0D.2070406@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D0BFD0D.2070406@plouf.fr.eu.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Pascal Hambourg' <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

> Do you mean that REDIRECT did not alter the destination address when =
it
> was different from the primary address on eth0 ?

I cannot confirm or deny this, since currently all our production serve=
rs
run with:
-A PREROUTING -d server.ip -p tcp --dport 443 -j DNAT --to-destination
server.ip:5228
The REDIRECT rule is something we tried in the past, to see if these st=
range
packets from port 5228 would go away.

> As I suggested, DROP packets in the INVALID state. If you don't see
> them
> any more, you'll know.

I added the following logging rules:
-I OUTPUT 1 -p tcp --sport 5228 -m state --state INVALID -j LOG
and
-I INPUT 1 -p tcp -m state --state INVALID -j LOG

It turns out, that every strange packet that we see in tcpdump, that go=
es
out from port 5228, e.g.
17:34:05.147063 IP server.ip.5228 > client.ip.35263: F 65950323:6595032=
3(0)
ack 4249584466 win 5840
is in the INVALID state as you suggested, since that client IP is found=
 in
the INVALID state output log, and has the same timestamp:
#grep client.ip /var/log/messages
Dec 17 17:32:22 serv6 kernel: [9021890.300104] IN=3D OUT=3Deth0 SRC=3Ds=
erver.ip
DST=3Dclient.ip LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D13916 DF =
PROTO=3DTCP
SPT=3D5228 DPT=3D35263 WINDOW=3D5840 RES=3D0x00 ACK FIN URGP=3D0=20
Dec 17 17:32:30 serv6 kernel: [9021898.213417] IN=3D OUT=3Deth0 SRC=3Ds=
erver.ip
DST=3Dclient.ip LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D45133 DF =
PROTO=3DTCP
SPT=3D5228 DPT=3D35312 WINDOW=3D5840 RES=3D0x00 ACK FIN URGP=3D0=20
Dec 17 17:33:41 serv6 kernel: [9021968.570562] IN=3D OUT=3Deth0 SRC=3Ds=
erver.ip
DST=3Dclient.ip LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D45134 DF =
PROTO=3DTCP
SPT=3D5228 DPT=3D35312 WINDOW=3D5840 RES=3D0x00 ACK FIN URGP=3D0=20
Dec 17 17:34:05 serv6 kernel: [9021992.637769] IN=3D OUT=3Deth0 SRC=3Ds=
erver.ip
DST=3Dclient.ip LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D13917 DF =
PROTO=3DTCP
SPT=3D5228 DPT=3D35263 WINDOW=3D5840 RES=3D0x00 ACK FIN URGP=3D0

What is strange however, is that even though I am also logging all inco=
ming
packets in the INVALID state, there are no such packets with this clien=
t.ip.
This suggests that the server responds to a *normal* packet from this
client.ip with a packet in the INVALID state? Is there any way to track=
 down
the reason why these INVALID state packets are generated in the server?


> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-
> owner@vger.kernel.org] On Behalf Of Pascal Hambourg
> Sent: Friday, December 17, 2010 4:15 PM
> To: Alec Matusis
> Cc: netfilter@vger.kernel.org
> Subject: Re: PREROUTING DNAT *inconsistent* behavior
>=20
> Alec Matusis a =E9crit :
> >> I would have used DNAT instead to make sure
> >> the destination address is not changed.
> >
> > Instead of REDIRECT, we used:
> > -A PREROUTING -d server.ip -p tcp --dport 443 -j DNAT --to-
> destination
> > server.ip:5228
> > The result is exactly the same.
>=20
> Do you mean that REDIRECT did not alter the destination address when =
it
> was different from the primary address on eth0 ?
>=20
> >> What are the other 5% then ?
> >
> > They are mostly RST packets from various clients:
>=20
> Sure, RSTs are sent in reply to the bogus packets from the servers.
>=20
> >> They are probably packets classified in the INVALID state by the
> >> connection tracking, which are ignored by the nat table. In a NAT
> >> setup,
> >> INVALID packets should be dropped because of this. Now the real
> >> question
> >> is : why are they classified in the INVALID state ?
> >
> > How can I verify that  these packets have been classified as in the
> INVALID
> > state? That may be the key to this problem.
>=20
> As I suggested, DROP packets in the INVALID state. If you don't see
> them
> any more, you'll know.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

