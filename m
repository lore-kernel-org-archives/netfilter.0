From: "jelenkovic" <jelenkovic@siol.net>
Subject: iptables error
Date: Tue, 12 Nov 2002 01:07:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001201c289df$80e81180$286bfea9@OBLIVION>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000F_01C289E7.E273DD50"
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

------=_NextPart_000_000F_01C289E7.E273DD50
Content-Type: text/plain;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

ok i'm having problems with the new iptables and 1.4.19 kernel.
here is the log error:
Nov 11 04:55:29 BAKER kernel: ASSERT ip_conntrack_core.c:1063 =
&ip_conntrack_lock not readlocked
Nov 11 04:55:29 BAKER kernel: ASSERT: ip_nat_core.c:839 =
&ip_conntrack_lock not readlocked

and then this is what happens later at some point:
Nov 11 20:57:58 BAKER kernel: IPTABLES Dead Input: IN=3Deth0 OUT=3D =
MAC=3D00:50:04:55:d1:a4:00:02:4b:13:33:60:08:00 SRC=3D213.250.59.123 =
DST=3D************ LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D125 ID=3D19471 =
DF PROTO=3DTCP SPT=3D4682 DPT=3D10 WINDOW=3D16384 RES=3D0x00 SYN =
URGP=3D0=20

notice that the destination port is 10.it shows that for all ports i =
think?
this was logged when i tried to use the web server.
so it should have recognized port 80 and not logged anything.
I've seen other ppl having the same problem (searched google) but no one =
knows what the problem might be.

any ideas?
------=_NextPart_000_000F_01C289E7.E273DD50
Content-Type: text/html;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-2">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>ok i'm having problems with the new =
iptables and=20
1.4.19 kernel.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>here is the log error:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Nov 11 04:55:29 BAKER kernel: ASSERT=20
ip_conntrack_core.c:1063 &amp;ip_conntrack_lock not readlocked<BR>Nov 11 =

04:55:29 BAKER kernel: ASSERT: ip_nat_core.c:839 &amp;ip_conntrack_lock =
not=20
readlocked</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>and then this is what happens later at =
some=20
point:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Nov 11 20:57:58 BAKER kernel: IPTABLES =
Dead Input:=20
IN=3Deth0 OUT=3D MAC=3D00:50:04:55:d1:a4:00:02:4b:13:33:60:08:00 =
SRC=3D213.250.59.123=20
DST=3D************ LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D125 ID=3D19471 =
DF PROTO=3DTCP=20
SPT=3D4682 DPT=3D10 WINDOW=3D16384 RES=3D0x00 SYN URGP=3D0 </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>notice that the destination port is =
10.it shows=20
that for all ports i think?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>this was logged when i tried to use the =
web=20
server.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>so it should have recognized port 80 =
and not logged=20
anything.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I've seen other ppl having the same =
problem=20
(searched google) but no one knows what the problem might =
be.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>any ideas?</FONT></DIV></BODY></HTML>

------=_NextPart_000_000F_01C289E7.E273DD50--


