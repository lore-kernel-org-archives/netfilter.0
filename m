From: "Michael Hudin" <hudin@zoetrope.com>
Subject: SMTP & POP Issues
Date: Mon, 3 Jun 2002 12:41:00 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <001d01c20b36$970ac480$52cfd3cf@michael>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001A_01C20AFB.EA907540"
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

------=_NextPart_000_001A_01C20AFB.EA907540
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Still haven't gotten my head fully wrapped around iptables and am having =
some problems getting at my mail server on the LAN (also SSH on that =
machine, but that is another question). =20

My setup is:=20
eth0 - external interface at 10.10.10.254 with IP Aliases of =
10.10.10.250, 10.10.10.251, 10.10.10.252, and 10.10.10.253. =20
eth1 is the gateway for the LAN at 192.168.77.1 =20
This machine is acting as the gateway for my private LAN and is also my =
VPN server.  I can't connect to ports 25 and 110 (SMTP and POP) from the =
outside world.  The machine which I am trying to conenct to is at =
192.168.77.2 and I've set up aliases on it just for the sake of clarity =
at 192.169.77.80 and 192.168.77.110 where the 80 one is for virtual =
hosts in Apache (which the forwarding is working fine for) and the 110 =
one is where I am trying access my mail server.  There currently is no =
firewall on this internal machine, so there is very little to get in the =
way of communication.  Below is my configuration file (yes, it has been =
created through the iptables-save function and some hand editing, I'm =
not much of a scripter)  I probably have a POSTROUTING rule configured =
incorrectly or something of that nature I'd guess.

I also realize that this is a rather unsecure set of rules, so some =
basic things I could add along the way would be appreciated.

Thanks!

-michael

*filter
:INPUT ACCEPT [0:229546]
-A INPUT -p udp -m udp --sport 500 --dport 500 -j ACCEPT
-A INPUT -p tcp -j ACCEPT
-A INPUT -p esp -j ACCEPT
-A INPUT -p ah -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -j ACCEPT
:FORWARD ACCEPT [0:1487351]
-A FORWARD -d 192.168.77.0/255.255.255.0 -i eth0 -p tcp -m tcp --dport =
22 -j ACCEPT
-A FORWARD -d 192.168.77.0/255.255.255.0 -i eth0 -p tcp -m tcp --dport =
25 -j ACCEPT
-A FORWARD -d 192.168.77.0/255.255.255.0 -i eth0 -p tcp -m tcp --dport =
80 -j ACCEPT
-A FORWARD -d 192.168.77.0/255.255.255.0 -i eth0 -p tcp -m tcp --dport =
110 -j ACCEPT
-A FORWARD -s 192.168.77.0/255.255.255.0 -i eth1 -p tcp -m tcp --sport =
22 -j ACCEPT
-A FORWARD -s 192.168.77.0/255.255.255.0 -i eth1 -p tcp -m tcp --sport =
25 -j ACCEPT
-A FORWARD -s 192.168.77.0/255.255.255.0 -i eth1 -p tcp -m tcp --sport =
80 -j ACCEPT
-A FORWARD -s 192.168.77.0/255.255.255.0 -i eth1 -p tcp -m tcp --sport =
110 -j ACCEPT
-A FORWARD -i eth1 -j ACCEPT
:OUTPUT ACCEPT [0:619218]
-A OUTPUT -p udp -m udp --sport 500 --dport 500 -j ACCEPT
-A OUTPUT -p tcp -j ACCEPT
-A OUTPUT -p esp -j ACCEPT
-A OUTPUT -p ah -j ACCEPT
-A OUTPUT -o lo -j ACCEPT
COMMIT

*nat
:PREROUTING ACCEPT [0:65535]
-A PREROUTING -d 10.10.10.250 -i eth1 -p tcp -m tcp --dport 22 -j DNAT =
--to-destination 192.168.77.2:22
-A PREROUTING -d 10.10.10.250 -i eth1 -p tcp -m tcp --dport 80 -j DNAT =
--to-destination 192.168.77.2:80
-A PREROUTING -d 10.10.10.251 -i eth1 -p tcp -m tcp --dport 80 -j DNAT =
--to-destination 192.168.77.80:80
-A PREROUTING -d 10.10.10.252 -i eth1 -p tcp -m tcp --dport 25 -j DNAT =
--to-destination 192.168.77.110:25
-A PREROUTING -d 10.10.10.252 -i eth1 -p tcp -m tcp --dport 110 -j DNAT =
--to-destination 192.168.77.110:110
:POSTROUTING ACCEPT [0:9862]
-A POSTROUTING -d 192.168.77.110 -o eth1 -p tcp -m tcp --dport 25 -j =
SNAT --to-source 10.10.10.252
-A POSTROUTING -d 192.168.77.110 -o eth1 -p tcp -m tcp --dport 110 -j =
SNAT --to-source 10.10.10.252
-A POSTROUTING -o eth0 -j MASQUERADE
-A POSTROUTING -o eth1 -j SNAT --to-source 10.10.10.254
:OUTPUT ACCEPT [66:4152]
COMMIT

*mangle
:PREROUTING ACCEPT [13512:2397711]
:INPUT ACCEPT [8743:614224]
:FORWARD ACCEPT [4559:1760428]
:OUTPUT ACCEPT [6375:628610]
:POSTROUTING ACCEPT [10849:2382506]
COMMIT




Michael Hudin
Sentinel Systems Support
www.zoetrope.com

------=_NextPart_000_001A_01C20AFB.EA907540
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2716.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Still haven't gotten my head fully =
wrapped around=20
iptables and am having some problems getting at my mail server on the =
LAN (also=20
SSH on that machine, but that is another question).&nbsp; </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>My setup is: </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth0 - external interface at =
10.10.10.254 with IP=20
Aliases of 10.10.10.250, 10.10.10.251, 10.10.10.252, and =
10.10.10.253.&nbsp;=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth1 is the gateway for the LAN at=20
192.168.77.1&nbsp; </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>This machine is acting as the gateway =
for my=20
private LAN and is also my VPN server.&nbsp; I can't connect to ports 25 =
and 110=20
(SMTP and POP) from the outside world.&nbsp; The machine which I am =
trying to=20
conenct to is at 192.168.77.2 and I've set up aliases on it just for the =
sake of=20
clarity at 192.169.77.80 and 192.168.77.110 where the 80 one is for =
virtual=20
hosts in Apache (which the forwarding is working fine for) and the 110 =
one is=20
where&nbsp;I am trying access my mail server.&nbsp; There currently is =
no=20
firewall on this internal machine, so there is very little to get in the =
way of=20
communication.&nbsp; Below is my configuration file (yes, it has been =
created=20
through the iptables-save function and some hand editing, I'm not much =
of a=20
scripter)&nbsp; I probably have a POSTROUTING rule configured =
incorrectly or=20
something of that nature I'd guess.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I also realize that this is a rather =
unsecure set=20
of rules, so some basic things I could add along the way would be=20
appreciated.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>-michael</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>*filter<BR>:INPUT ACCEPT =
[0:229546]<BR>-A INPUT -p=20
udp -m udp --sport 500 --dport 500 -j ACCEPT<BR>-A INPUT -p tcp -j =
ACCEPT<BR>-A=20
INPUT -p esp -j ACCEPT<BR>-A INPUT -p ah -j ACCEPT<BR>-A INPUT -i lo -j=20
ACCEPT<BR>-A INPUT -j ACCEPT<BR>:FORWARD ACCEPT [0:1487351]<BR>-A =
FORWARD -d=20
192.168.77.0/255.255.255.0 -i eth0 -p tcp -m tcp --dport 22 -j =
ACCEPT<BR>-A=20
FORWARD -d 192.168.77.0/255.255.255.0 -i eth0 -p tcp -m tcp --dport 25 =
-j=20
ACCEPT<BR>-A FORWARD -d 192.168.77.0/255.255.255.0 -i eth0 -p tcp -m tcp =
--dport=20
80 -j ACCEPT<BR>-A FORWARD -d 192.168.77.0/255.255.255.0 -i eth0 -p tcp =
-m tcp=20
--dport 110 -j ACCEPT<BR>-A FORWARD -s 192.168.77.0/255.255.255.0 -i =
eth1 -p tcp=20
-m tcp --sport 22 -j ACCEPT<BR>-A FORWARD -s 192.168.77.0/255.255.255.0 =
-i eth1=20
-p tcp -m tcp --sport 25 -j ACCEPT<BR>-A FORWARD -s =
192.168.77.0/255.255.255.0=20
-i eth1 -p tcp -m tcp --sport 80 -j ACCEPT<BR>-A FORWARD -s=20
192.168.77.0/255.255.255.0 -i eth1 -p tcp -m tcp --sport 110 -j =
ACCEPT<BR>-A=20
FORWARD -i eth1 -j ACCEPT<BR>:OUTPUT ACCEPT [0:619218]<BR>-A OUTPUT -p =
udp -m=20
udp --sport 500 --dport 500 -j ACCEPT<BR>-A OUTPUT -p tcp -j =
ACCEPT<BR>-A OUTPUT=20
-p esp -j ACCEPT<BR>-A OUTPUT -p ah -j ACCEPT<BR>-A OUTPUT -o lo -j=20
ACCEPT<BR>COMMIT</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>*nat<BR>:PREROUTING ACCEPT =
[0:65535]<BR>-A=20
PREROUTING -d 10.10.10.250 -i eth1 -p tcp -m tcp --dport 22 -j DNAT=20
--to-destination 192.168.77.2:22<BR>-A PREROUTING -d 10.10.10.250 -i =
eth1 -p tcp=20
-m tcp --dport 80 -j DNAT --to-destination 192.168.77.2:80<BR>-A =
PREROUTING -d=20
10.10.10.251 -i eth1 -p tcp -m tcp --dport 80 -j DNAT --to-destination=20
192.168.77.80:80<BR>-A PREROUTING -d 10.10.10.252 -i eth1 -p tcp -m tcp =
--dport=20
25 -j DNAT --to-destination 192.168.77.110:25<BR>-A PREROUTING -d =
10.10.10.252=20
-i eth1 -p tcp -m tcp --dport 110 -j DNAT --to-destination=20
192.168.77.110:110<BR>:POSTROUTING ACCEPT [0:9862]<BR>-A POSTROUTING -d=20
192.168.77.110 -o eth1 -p tcp -m tcp --dport 25 -j SNAT --to-source=20
10.10.10.252<BR>-A POSTROUTING -d 192.168.77.110 -o eth1 -p tcp -m tcp =
--dport=20
110 -j SNAT --to-source 10.10.10.252<BR>-A POSTROUTING -o eth0 -j=20
MASQUERADE<BR>-A POSTROUTING -o eth1 -j SNAT --to-source =
10.10.10.254<BR>:OUTPUT=20
ACCEPT [66:4152]<BR>COMMIT</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>*mangle<BR>:PREROUTING ACCEPT=20
[13512:2397711]<BR>:INPUT ACCEPT [8743:614224]<BR>:FORWARD ACCEPT=20
[4559:1760428]<BR>:OUTPUT ACCEPT [6375:628610]<BR>:POSTROUTING ACCEPT=20
[10849:2382506]<BR>COMMIT<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Michael Hudin<BR>Sentinel Systems =
Support<BR><A=20
href=3D"http://www.zoetrope.com">www.zoetrope.com</A></FONT></DIV></BODY>=
</HTML>

------=_NextPart_000_001A_01C20AFB.EA907540--


