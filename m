From: =?iso-8859-1?Q?Hern=E1n_Mailluquet?= <hernan@mdp.edu.ar>
Subject: Redirection question.
Date: Tue, 11 Mar 2003 12:04:16 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001e01c2e7df$7bfd3430$0db600c8@ANTARES1>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001B_01C2E7C6.56A3C730"
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

------=_NextPart_000_001B_01C2E7C6.56A3C730
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi, i have doing transparent proxy with squid and this port redirect =
rule:

iptables -t nat -A PREROUTING -i eth1 -p TCP --dport 80 -j REDIRECT =
--to-port 8080

and works fine. Now, i want dont't redirect some request to destination =
dirs like 192.168.0.0/24 and 192.168.1.0/24 (for example). How i can do =
this?=20

Thanks.

------=_NextPart_000_001B_01C2E7C6.56A3C730
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1141" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi, i have doing transparent proxy with =

squid&nbsp;and this&nbsp;port redirect rule:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A PREROUTING -i eth1 =
-p TCP=20
--dport 80 -j REDIRECT --to-port 8080</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>and works fine. Now, i want dont't =
redirect some=20
request to destination dirs like 192.168.0.0/24 and 192.168.1.0/24 (for=20
example). H</FONT><FONT face=3DArial size=3D2>ow i can do this? =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_001B_01C2E7C6.56A3C730--


