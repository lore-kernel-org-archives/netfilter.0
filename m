From: =?Windows-1252?Q?Francisco_Andr=E9_Barbosa_Neto?= <andre@connecton.com.br>
Subject: NAT Problems FTP (maybe a newbie question)
Date: Wed, 19 Nov 2003 22:11:39 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002201c3aefa$df26b9e0$0af2d3c8@admin1>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001F_01C3AEEA.1B49D670"
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

------=_NextPart_000_001F_01C3AEEA.1B49D670
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi all, I've installed Slackware 9.1 in 2 diferent pc's, in 2 different =
clients. These machines are doing nat to all the internal network. I'm =
running only a single rule described below, but when any of the client =
machines try to connect to any ftp site, the connection was ok but when =
the user gives an ls command the server respond 500 ilegal command.

            I've checked all the modules (one of the machines are =
running with all the iptables code compiled internally into the kernel, =
not as module) and all is ok.=20

            What is poosible to happening in this case, could anybody =
give some hint!

            Thak's!

All my firewall is:

iptables -F
iptables -t nat -F

iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -d 0.0.0.0/0 -j SNAT =
--to 200.X.X.X
           =20
------------------------------------------------------
Francisco Andr=E9 Barbosa Neto
fneto@connecton.com.br
Connect On Internet Provider
http://www.connecton.com.br
Fone: 55-11-4655-2232
------------------------------------------------------

------=_NextPart_000_001F_01C3AEEA.1B49D670
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dwindows-1252">
<META content=3D"MSHTML 6.00.2800.1276" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi all, I've installed Slackware 9.1 =
in&nbsp;2=20
diferent pc's, in 2 different clients. These machines are doing nat to =
all the=20
internal network. I'm running only a single rule described below, but =
when any=20
of the client machines try to connect to any ftp site, the connection =
was ok but=20
when the user gives an ls command the server respond 500 ilegal command.
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; I've checked all the modules (one of the machines are =
running=20
with all&nbsp;the iptables code&nbsp;compiled internally into the =
kernel, not as=20
module) and all is ok. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; What is poosible to happening in this case, could =
anybody=20
give some hint!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; Thak's!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>All my firewall is:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -F</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -F</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A POSTROUTING -s =
192.168.0.0/24 -d=20
0.0.0.0/0 -j SNAT --to 200.X.X.X</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; </FONT></DIV></FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>------------------------------------------------------<BR>Franci=
sco Andr=E9=20
Barbosa Neto<BR><A=20
href=3D"mailto:fneto@connecton.com.br">fneto@connecton.com.br</A><BR>Conn=
ect On=20
Internet Provider<BR><A=20
href=3D"http://www.connecton.com.br">http://www.connecton.com.br</A><BR>F=
one:=20
55-11-4655-2232<BR>------------------------------------------------------=
<BR></FONT></DIV></BODY></HTML>

------=_NextPart_000_001F_01C3AEEA.1B49D670--



