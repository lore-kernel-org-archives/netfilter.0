From: "Rimas" <rmocius@auste.elnet.lt>
Subject: MASQUERADE for 2 Internet connections
Date: Mon, 9 Sep 2002 12:56:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005a01c257f7$e2e51dc0$6e69690a@rimas>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0057_01C25800.4324E190"
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

------=_NextPart_000_0057_01C25800.4324E190
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi folks,

I have configured NAT for 1 Inet connection :=20
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE - working solution

I use 10.105.105.x internal IP addresing

Now I have a second one Inet connection (eth2).

How to make MASQUERADE like this:
1st Inet - MASQUERADE for 10.105.105.100-105
2nd Inet - MASQUERADE for 10.105.105.xx for all except 100-105

Basicly to use the same IP addresing for both Inet connections



Thanks in advance

Rimas

------=_NextPart_000_0057_01C25800.4324E190
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi folks,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have configured NAT for 1 Inet =
connection :=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A POSTROUTING =
-o&nbsp;eth0 -j=20
MASQUERADE - working solution</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I use 10.105.105.x internal IP=20
addresing</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Now I have a second one Inet connection =

(eth2).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>How to make MASQUERADE like =
this:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>1st Inet - MASQUERADE for=20
10.105.105.100-105</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>2nd Inet - MASQUERADE for 10.105.105.xx =
for all=20
except 100-105</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Basicly to use the same IP addresing =
for both Inet=20
connections</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks in advance</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Rimas</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0057_01C25800.4324E190--



