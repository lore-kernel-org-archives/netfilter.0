From: Jay Levitt <lists-netfilter@shopwatch.org>
Subject: Interaction of Ethereal and iptables?
Date: Sun, 11 Apr 2004 01:38:24 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <065601c41f87$34f209e0$9701a8c0@office>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0653_01C41F65.ADCFC810"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0653_01C41F65.ADCFC810
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I'm occasionally seeing lines like the following, always to the same =
machine which is on my internal network:

Apr 11 01:11:52 linux kernel: Rejected output by default:IN=3D =
OUT=3Deth0 SRC=3D192.168.1.150 DST=3D192.168.1.151 LEN=3D40 TOS=3D0x00 =
PREC=3D0x00 TTL=3D64 ID=3D30662 DF PROTO=3DTCP SPT=3D993 DPT=3D3736 =
WINDOW=3D6432 RES=3D0x00 ACK FIN URGP=3D0=20

This corresponds to a LOG and then a DROP rule.  So I set up Ethereal to =
capture the packet trace.  I didn't see the packet there, so I changed =
the DROP to an ACCEPT, assuming that iptables is probably dropping the =
outbound packet before Ethereal (ok, libpcap) can see it. =20

The weird thing is - even with just a LOG/ACCEPT rule, the packet is =
STILL missing from Ethereal's trace!  All other packets from that time =
frame are there, but this particular one isn't.  Could iptables be =
imagining it somehow?  I'm using libpcap 0.7.2, which was current till a =
few days ago...  I've done an iptables --list OUTPUT and verified that =
the last item on the OUTPUT chain is an ACCEPT of all packets, although =
the default policy is still technically DROP.

Any clues?

Jay Levitt


------=_NextPart_000_0653_01C41F65.ADCFC810
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I'm occasionally seeing lines like the =
following,=20
always to the same machine which is on my internal network:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Apr 11 01:11:52 linux kernel: Rejected =
output by=20
default:IN=3D OUT=3Deth0 SRC=3D192.168.1.150 DST=3D192.168.1.151 =
LEN=3D40 TOS=3D0x00=20
PREC=3D0x00 TTL=3D64 ID=3D30662 DF PROTO=3DTCP SPT=3D993 DPT=3D3736 =
WINDOW=3D6432 RES=3D0x00 ACK=20
FIN URGP=3D0 </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>This corresponds to a LOG and then a =
DROP=20
rule.&nbsp; </FONT><FONT face=3DArial size=3D2>So I set up Ethereal to =
capture the=20
packet trace.&nbsp; I didn't see the packet there, so I changed the DROP =
to an=20
ACCEPT, assuming that iptables is probably dropping the outbound packet =
before=20
Ethereal (ok, libpcap) can see it.&nbsp; </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The weird thing is - even with just a =
LOG/ACCEPT=20
rule, the packet is STILL missing from Ethereal's trace!&nbsp; All other =
packets=20
from that time frame are there, but this particular one isn't.&nbsp; =
Could=20
iptables be imagining it somehow?&nbsp; I'm using libpcap 0.7.2, which =
was=20
current till a few days ago...&nbsp; I've done an iptables --list OUTPUT =
and=20
verified that the last item on the OUTPUT chain is an ACCEPT of all =
packets,=20
although the default policy is still technically DROP.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Any clues?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Jay Levitt</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0653_01C41F65.ADCFC810--


