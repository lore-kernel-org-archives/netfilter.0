From: "Ryan Beisner" <ryan@mail.prattusa.com>
Subject: WAP11 host behind Netfilter Router
Date: Wed, 18 Sep 2002 15:58:05 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0d1401c25f56$15d4f7e0$64dc0a0a@dataarc>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0D11_01C25F2C.2CE4FF40"
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

------=_NextPart_000_0D11_01C25F2C.2CE4FF40
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi All!


I have a Linksys WAP11 behind a high speed connection.

Currently doing simple NAT with:

    iptables -t nat -A POSTROUTING -o $extdev -j MASQUERADE
        (other rules to accept certain protocols for ssh, webmin, etc)
        and then:
    iptables -A INPUT -i $extdev -m state --state NEW,INVALID -j DROP
    iptables -A FORWARD -i $extdev -m state --state NEW,INVALID -j DROP
        as a simple block to unwanted traffic on an already protected =
ext. network
=20
Here's the scenario:

    INT (eth0) IP Range ( 192.168.168.1 class C )
    EXT (eth1) IP Range also private ( 10.20.0.3 class B )
    EXT (eth1:1) Virtual IP is 10.20.0.4

I want to map everything from Virt IP (Eth1:1) 10.20.0.4 (all ports) to =
internal 192.168.168.178 (the Linksys WAP 11).  FYI this is for remote =
management of my access point.
=20
Where in the world do I start? All help is appreciated in advance.
=20
Here was my first attempt, which did not work.  I explicitly allow all =
traffic in/out/fwd for 10.20.0.4 to make sure I wasn't kicking myself =
here.  Still no go.  Suggestions?
=20
    ""iptables -A PREROUTING -t nat -d 10.20.0.4 -j DNAT --to =
192.168.168.178""


-Ryan Beisner

ryanb -at-nosp@m- thedataarc () com



------=_NextPart_000_0D11_01C25F2C.2CE4FF40
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2614.3500" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Hi All!</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have a Linksys WAP11 behind a high =
speed=20
connection.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Currently doing simple NAT =
with:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; iptables -t nat -A =
POSTROUTING=20
-o $extdev -j MASQUERADE</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
(other rules=20
to accept certain protocols for ssh, webmin, etc)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
and=20
then:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; iptables -A INPUT -i =
$extdev -m=20
state --state NEW,INVALID -j DROP<BR>&nbsp;&nbsp;&nbsp; iptables -A =
FORWARD -i=20
$extdev -m state --state NEW,INVALID -j DROP</FONT></DIV>
<DIV><FONT face=3DArial =
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; as a=20
simple block to unwanted traffic on an already protected ext.=20
network</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Here's the scenario:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; INT (eth0) IP Range =
(=20
192.168.168.1 class C )</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; EXT (eth1) IP Range =
also private=20
( 10.20.0.3 class B )</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; EXT (eth1:1) Virtual =
IP is=20
10.20.0.4</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I want to map everything from Virt IP =
(Eth1:1)=20
10.20.0.4 (all ports) to internal 192.168.168.178 (the Linksys WAP =
11).&nbsp;=20
FYI this is for remote management of my access point.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Where in the world do I start? =
</FONT><FONT=20
face=3DArial size=3D2>All help is appreciated in advance.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Here was my first attempt, which did =
not=20
work.&nbsp; I explicitly allow all traffic in/out/fwd for 10.20.0.4 to =
make sure=20
I wasn't kicking myself here.&nbsp; Still no go.&nbsp; =
Suggestions?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; ""iptables -A =
PREROUTING -t nat=20
-d 10.20.0.4 -j DNAT --to 192.168.168.178""</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>-Ryan Beisner</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>ryanb -at-nosp@m- thedataarc () =
com</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_0D11_01C25F2C.2CE4FF40--



