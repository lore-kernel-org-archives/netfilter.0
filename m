From: "Rimas" <rmocius@auste.elnet.lt>
Subject: Two ISP and NAT
Date: Mon, 30 Sep 2002 19:26:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007101c268ae$eec3e910$6e69690a@rimas>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_006E_01C268B7.4F061DE0"
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

------=_NextPart_000_006E_01C268B7.4F061DE0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi folks,

I have 2 ISP Inet connections.

1 Inet I (eth0) use have used for everything (SMTP server, MASQ for =
local network)
I got the 2 INET (eth1)  and made some changes:

They both have MASQ:
    iptables -t nat -A POSTROUTING -o $EXTERNAL_INTERFACE_2 -j =
MASQUERADE (2 Inet)
    iptables -t nat -A POSTROUTING -o $EXTERNAL_INTERFACE_1 -j =
MASQUERADE (1 Inet)

I changed default route to eth1 and put some additional  route:=20
ip route rep default via ext_ip2 dev eth1
ip route add  1.2.3.4 via ext_ip1 (eth0)

And now I'm having  a problem with my email server (Lotus Notes on =
Linux).
It can send emails via SMTP but cannot use encrypted Lotus connection =
and receive emails as well.

 iptables -t nat -A PREROUTING -i $EXTERNAL_INTERFACE_1 -p tcp -d =
$EXTERNALIP_1 --dport 25 \
                                  -j DNAT --to-destination 1.2.3.196:25

# Lotus Notes Encrypted connection (tcp 1352) port forward from eth0 to =
internal ip 10.105.105.196 =20
 iptables -t nat -A PREROUTING -i $EXTERNAL_INTERFACE_1 -p tcp -d =
$EXTERNALIP_1 --dport 1352 \
                                   -j DNAT --to-destination =
1.2.3.196:1352

And how to route with ip route command that email server have to use not =
the default route (eth1) but eth0.

What I need to configure more to get working back my email server?


Thank you in advance

Rimas

------=_NextPart_000_006E_01C268B7.4F061DE0
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
<DIV><FONT face=3DArial size=3D2>I have 2 ISP Inet =
connections.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>1 Inet I (eth0) use have used for =
everything (SMTP=20
server, MASQ for local network)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I got the 2 INET (eth1) &nbsp;and made =
some=20
changes:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>They both have MASQ:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; iptables -t nat -A =
POSTROUTING=20
-o $EXTERNAL_INTERFACE_2 -j MASQUERADE (2 Inet)<BR>&nbsp;&nbsp;&nbsp; =
iptables=20
-t nat -A POSTROUTING -o $EXTERNAL_INTERFACE_1 -j MASQUERADE (1=20
Inet)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I changed default route to eth1=20
and&nbsp;</FONT><FONT face=3DArial size=3D2>put some additional&nbsp; =
route:=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>ip route rep default via ext_ip2 dev =
eth1<BR>ip=20
route add&nbsp;&nbsp;1.2.3.4 via ext_ip1 (eth0)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>And now&nbsp;I'm having&nbsp; a problem =
with my=20
email server (Lotus Notes on Linux).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>It can send emails via SMTP but cannot =
use=20
encrypted Lotus connection and receive emails as well.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;iptables -t nat -A PREROUTING -i=20
$EXTERNAL_INTERFACE_1 -p tcp -d $EXTERNALIP_1 --dport 25=20
\<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
-j DNAT --to-destination 1.2.3.196:25</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># Lotus Notes Encrypted connection (tcp =
1352) port=20
forward from eth0 to internal ip 10.105.105.196&nbsp; <BR>&nbsp;iptables =
-t nat=20
-A PREROUTING -i $EXTERNAL_INTERFACE_1 -p tcp -d $EXTERNALIP_1 --dport =
1352=20
\<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
-j DNAT --to-destination 1.2.3.196:1352</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>And how to route with ip route command=20
that&nbsp;email server&nbsp;have to&nbsp;use not the default route =
(eth1) but=20
eth0.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>What I need to configure more to get =
working back=20
my email server?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thank you in advance</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Rimas</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_006E_01C268B7.4F061DE0--



