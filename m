From: "Linux" <linuxrobotsstayaway@usermail.com>
Subject: Forward all traffic to another Public address
Date: Tue, 3 Dec 2002 14:52:59 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002b01c29b16$58d97fb0$d318b2a1@IBMCMDCTR004>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0028_01C29ADB.ABD3B950"
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

------=_NextPart_000_0028_01C29ADB.ABD3B950
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello All,

I am freaking going crazy and pulling my hair out.  Here is I want to =
do.
Forward all traffic (smtp, pop3, web,etc) for one IP address in Server =
box located in CA to a Server in TX
These boxes are on separate networks.
Here is what I did

iptables -t nat -A PREROUTING -s 216.x.x.x -d 238.x.x.x -m state --state =
RELATED,ESTABLISHED -j MASQ
iptables -t nat -A PREROUTING -d 238.x.x.x -j DNAT --to 216.x.x.x


Can someone please help me as I cannot figure out what I am doing wrong.


Thank you,

Linux




------=_NextPart_000_0028_01C29ADB.ABD3B950
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello All,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I am freaking going crazy and pulling =
my hair=20
out.&nbsp; Here is I want to do.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Forward all traffic (smtp, pop3, =
web,etc) for one=20
IP address in Server box located in CA to a Server in TX</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>These boxes are on separate =
networks.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Here is what I did</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A PREROUTING -s =
216.x.x.x -d=20
238.x.x.x -m state --state RELATED,ESTABLISHED -j MASQ</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A PREROUTING -d =
238.x.x.x -j DNAT=20
--to 216.x.x.x</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Can someone please help me as I cannot =
figure out=20
what I am doing wrong.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thank you,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Linux</DIV>
<DIV><BR><BR></DIV></FONT><FONT face=3DArial =
size=3D2></FONT></BODY></HTML>

------=_NextPart_000_0028_01C29ADB.ABD3B950--


