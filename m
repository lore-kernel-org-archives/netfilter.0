From: =?iso-8859-1?Q?Oriol_Magran=E9?= <omagrane@mediapro.es>
Subject: Newbie question about nat
Date: Fri, 30 Apr 2004 20:20:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004901c42edf$c73c77b0$a704a8c0@mpro4167>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0046_01C42EF0.89D6F010"
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

------=_NextPart_000_0046_01C42EF0.89D6F010
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


    Hello!
    I'm trying to set up a firewall with two ethernets to be installed =
between the internet and a pool of servers.
    The setup is as follows:

    In the firewall:
        -eth0 with public ip 'a.b.c.d', connected to the internet
        -eth1 with private ip 192.168.1.1, connected to a private class =
C subnet

    In the internal server 1 (web server):
        -eth0 with private ip 192.168.1.100, connected to the subnet =
above.

    I have some public ips available (a.b.c.e, a.b.c.f, a.b.c.g,...) so =
now I want to map the external ip 'a.b.c.e' with the internal ip =
'192.168.1.100' .

    So in the firewall I do:

        echo 1 > /proc/sys/net/ipv4/ip_forward
        iptables -t nat -A PREROUTING -d a.b.c.e -j DNAT --to =
192.168.1.100
        iptables -t nat -A POSTROUTING -s 192.168.1.100 -j SNAT --to =
a.b.c.e

    This should effectively

        -change destination from a.b.c.e to 192.168.1.100 for packets =
entering the firewall
        -and change source from 192.168.1.100 to a.b.c.e for packets =
leaving the firewall

    Now, if I ping the public address of the internal server 1 (a.b.c.e) =
from the internet, each packet should traverse the firewall like this:

        1. @internet: source=3Dw.x.y.z, destination=3Da.b.c.e
        2. @firewall-prerouting: source=3Dw.x.y.z, =
destination=3D192.168.1.100 (destination changed by nat rule 1)
        3. @firewall-postrouting: source=3Dw.x.y.z, =
destination=3D192.168.1.100 (no changes)
        4. @internal_server_1: source=3Dw.x.y.z, =
destination=3D192.168.1.100 (so the packet reaches the target)

    and then, when the internal server bounces the ping:

        1. @internal_server_1: source=3D192.168.1.100, =
destination=3Dw.x.y.z
        2. @firewall-prerouting: source=3D192.168.1.100, =
destination=3Dw.x.y.z (no changes)
        3. @firewall-postrouting: source=3Da.b.c.e, =
destination=3Dw.x.y.z (source changed by nat rule 2)
        4. @internet: source=3Da.b.c.e, destination=3Dw.x.y.z (so the =
packet reaches the target)


    But this won't work, because the firewall doesn't know it must =
process packets with destination ips other than its own ip (a.b.c.e, =
a.b.c.f, etc...), and my ISP doesn't know which machine must deliver =
these packets to.
    So the question is: how can I make the firewall to process the =
packets with destinations a.b.c.e, a.b.c.f, etc.?=20
    The only solution I've found is to define an ip alias in the =
firewall itself so that eth0:1 will respond to the external ip a.b.c.e
    Thus when the router of my ISP asks "who has ip a.b.c.e?", the =
firewall will answer "me" and it will process the packet and deliver it =
to the internal server 1.

    But this solution means defining an alias for every external ip I =
want to firewall. So if I have eight servers firewalled I will need =
eight ip alias in the firewall.

    Is this the right way to do it? Or there is a cleaner/easier/better =
method to achieve the same?

    Thank you very much in advance,

    Oriol
    Barcelona


------=_NextPart_000_0046_01C42EF0.89D6F010
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
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Hello!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; I'm trying to set up =
a firewall=20
with two ethernets to be installed between the internet and a pool of=20
servers.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; The setup is as=20
follows:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; In the =
firewall:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
-eth0 with=20
public ip 'a.b.c.d', connected to the internet</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
-eth1 with=20
private ip 192.168.1.1, connected to a private class C =
subnet</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;In the internal =
server 1=20
(web server):</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
-eth0 with=20
private ip 192.168.1.100, connected to the subnet above.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; I have some public =
ips available=20
(a.b.c.e, a.b.c.f, a.b.c.g,...) so now I want to map the external ip =
'a.b.c.e'=20
with the internal ip '192.168.1.100' .</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; So in the firewall I =

do:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
echo 1 &gt;=20
/proc/sys/net/ipv4/ip_forward<BR></FONT><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables -t nat -A =
PREROUTING=20
-d&nbsp;a.b.c.e -j DNAT --to&nbsp;192.168.1.100</FONT></DIV>
<DIV><FONT face=3DArial =
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables=20
-t nat -A POSTROUTING -s&nbsp;192.168.1.100 -j SNAT --to =
a.b.c.e</FONT><FONT=20
face=3DArial size=3D2></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; This should=20
effectively</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
-change=20
destination from a.b.c.e to 192.168.1.100 for packets entering the=20
firewall</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
-and change=20
source from 192.168.1.100 to a.b.c.e for packets leaving the=20
firewall</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Now, if I ping the =
public=20
address of the internal server 1 (a.b.c.e) from the internet, each =
packet should=20
traverse the firewall like this:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial =
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1.&nbsp;@internet: source=3Dw.x.y.z, destination=3Da.b.c.e</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
2.=20
@firewall-prerouting: source=3Dw.x.y.z, destination=3D192.168.1.100 =
(destination=20
changed by nat rule 1)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
3.=20
@firewall-postrouting: source=3Dw.x.y.z, destination=3D192.168.1.100 (no =

changes)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
4.=20
@internal_server_1: source=3Dw.x.y.z, destination=3D192.168.1.100 (so =
the packet=20
reaches the target)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; and then, when the =
internal=20
server bounces the ping:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial =
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.=20
@internal_server_1: source=3D192.168.1.100, =
destination=3Dw.x.y.z</FONT></DIV>
<DIV><FONT face=3DArial =
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.=20
@firewall-prerouting: source=3D192.168.1.100, destination=3Dw.x.y.z (no=20
changes)</FONT></DIV>
<DIV><FONT face=3DArial =
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.=20
@firewall-postrouting: source=3Da.b.c.e, destination=3Dw.x.y.z (source =
changed by=20
nat rule 2)</FONT></DIV>
<DIV><FONT face=3DArial =
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.=20
@internet: source=3Da.b.c.e, destination=3Dw.x.y.z (so the packet =
reaches the=20
target)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; But this won't work, =
because=20
</FONT><FONT face=3DArial size=3D2>the firewall doesn't know it must =
process packets=20
with destination ips&nbsp;other than its own ip (a.b.c.e, a.b.c.f, =
etc...), and=20
my ISP doesn't know which machine must deliver these packets =
to.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; So t</FONT><FONT =
face=3DArial=20
size=3D2>he question is: how can I make the firewall to process the =
packets with=20
destinations a.b.c.e, a.b.c.f, etc.? </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; The only solution =
I've found is=20
to define an ip alias&nbsp;in the firewall itself so that eth0:1 will =
respond to=20
the external ip a.b.c.e</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Thus when the router =
of my ISP=20
asks "who has ip a.b.c.e?", the firewall will answer "me" and it will =
process=20
the packet and deliver it to the internal server 1.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; But this solution =
means defining=20
an alias for every external ip I want to firewall. So if I have eight =
servers=20
firewalled I will need eight ip alias in the firewall.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Is this the right =
way to do it?=20
Or there is a cleaner/easier/better method to achieve the =
same?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Thank you very much =
in=20
advance,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Oriol</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; =
Barcelona</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0046_01C42EF0.89D6F010--


