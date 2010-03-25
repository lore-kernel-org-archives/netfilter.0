From: hyperbatus@gmx.de
Subject: Netfilter internal packet flow
Date: Thu, 25 Mar 2010 10:03:29 +0100
Message-ID: <20100325090329.11170@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Dear list,

thanks to googling and RTFMing and some very instructive graphics, I th=
ink I have understood the netfilter packet flow in principle.

But all material I have found only seems to describe the journey of pac=
kets which really come from the "outside" or go to the "outside". I wou=
ld be strongly interested in some documentation describing what happens=
 to packets that are internally generated and absorbed.

=46or example, even with one NIC and one IP address, there are packets =
going from the IP address to loopback and vice versa, so the packets ar=
e generated locally and received locally.

According to my testing so far (linux kernel 2.6.26 / debian lenny), th=
e behaviour of these packets seems to contradict the documents and grap=
hics I have seen. Such packets seem to go through the INPUT and OUTPUT =
chains of the FILTER table and through one or two chains of the NAT tab=
le (I just can't remember exactly at the moment), but not through the P=
REROUTING chain of the NAT table. This is confusing ...

I would be grateful if somebody could give a comprehensive explanation =
of that or a hint regarding further documentation.

By the way, the graphics I have mentioned are:

http://jengelh.medozas.de/images/nf-packet-flow.png
http://dmiessler.com/images/DM_NF.PNG
http://linux-ip.net/nf/nfk-traversal.png
http://ebtables.sourceforge.net/br_fw_ia/PacketFlow.png
http://xkr47.outerspace.dyndns.org/netfilter/packet_flow/packet_flow10.=
png

Perhaps it would be sufficient for understanding if somebody, refering =
to the first of these graphics, could just explain which part of the gr=
aph "purely internal" packets have to travel through.

Thank you very much,

Peter


--=20
GMX.at - =D6sterreichs FreeMail-Dienst mit =FCber 2 Mio Mitgliedern
E-Mail, SMS & mehr! Kostenlos: http://portal.gmx.net/de/go/atfreemail
