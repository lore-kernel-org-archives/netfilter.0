From: "Bill Brennick" <bill@brennick.com>
Subject: NetFilter log-parser
Date: Wed, 10 Jul 2002 12:14:16 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <00ed01c2282c$d8cada00$0200a8c0@motherfucker2>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00EA_01C2280B.4F8D0B30"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_00EA_01C2280B.4F8D0B30
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi All,

I just upgraded to 2.4.18 kernel w/IPTABLES.

(Previously, I was using 2.4.4 kernel, w/IPCHAINS...)

I used to use "PMFirewall" and parsed my firewall-log
with "FwLogWatch" to have a web-reporting page.

NOW, since I've upgraded, I don't have anything that
parses my netfilter log...  Any suggestions for a
parser?

ALSO,  since I've upgraded, I now get a message
EVERY 4 seconds in my firewall log...=20
(My internal interface on my firewall, eth1, is 192.168.0.1,
is this coming from my firewall itself??):


Jul 10 12:12:42 firewall-host kernel: martian source 255.255.255.255 =
from 192.168.0.1, on dev eth0
Jul 10 12:12:42 firewall-host kernel: ll header: =
ff:ff:ff:ff:ff:ff:00:40:05:6c:e1:85:08:00


TIA,
- Bill



=3D------------------------------------------------------------=3D
Bill Brennick         -         'Builder of networks...'
bill at brennick dot com
brennick at keepandbeararms dot com
=3D------------------------------------------------------------=3D

"I don't have to take this abuse from you!
I've got hundreds of people waiting to abuse me."

=3D------------------------------------------------------------=3D

------=_NextPart_000_00EA_01C2280B.4F8D0B30
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4916.2300" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT size=3D2>Hi All,</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>I just upgraded to 2.4.18 kernel =
w/IPTABLES.</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>(Previously, I was using 2.4.4 kernel,=20
w/IPCHAINS...)</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>I used to use "PMFirewall" and parsed my=20
firewall-log</FONT></DIV>
<DIV><FONT size=3D2>with "FwLogWatch" to have a web-reporting =
page.</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>NOW, since I've upgraded, I don't have anything=20
that</FONT></DIV>
<DIV><FONT size=3D2>parses my netfilter log...&nbsp; Any suggestions for =

a</FONT></DIV>
<DIV><FONT size=3D2>parser?</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>ALSO,&nbsp; since I've upgraded, I now get a=20
message</FONT></DIV>
<DIV><FONT size=3D2>EVERY 4 seconds in my firewall log... </FONT></DIV>
<DIV><FONT size=3D2>(My internal interface on my firewall, eth1, is=20
192.168.0.1,</FONT></DIV>
<DIV><FONT size=3D2>is this coming from my firewall =
itself??):</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>Jul 10 12:12:42&nbsp;firewall-host kernel: martian =
source=20
255.255.255.255 from 192.168.0.1, on dev eth0<BR>Jul 10=20
12:12:42&nbsp;firewall-host kernel: ll header:=20
ff:ff:ff:ff:ff:ff:00:40:05:6c:e1:85:08:00</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>TIA,</FONT></DIV>
<DIV><FONT size=3D2>- Bill</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT=20
size=3D2>=3D------------------------------------------------------------=3D=
<BR>Bill=20
Brennick&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'Builder of=20
networks...'<BR>bill at brennick dot com<BR>brennick at keepandbeararms =
dot=20
com<BR>=3D------------------------------------------------------------=3D=
</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>"I don't have to take this abuse from you!<BR>I've =
got=20
hundreds of people waiting to abuse me."</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT=20
size=3D2>=3D------------------------------------------------------------=3D=
<BR></FONT></DIV></BODY></HTML>

------=_NextPart_000_00EA_01C2280B.4F8D0B30--


