From: "deepali" <deepali@gecsl.com>
Subject: port forward using iptables not happening
Date: Fri, 5 Jul 2002 12:14:55 +0530
Sender: netfilter-admin@lists.samba.org
Message-ID: <001e01c223ef$7bdc0d50$0805010a@gecs.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001B_01C2241D.92B9D920"
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

------=_NextPart_000_001B_01C2241D.92B9D920
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear Support
My setup is ..I have one linux box having eth0(valid ip202.140.152.33) =
and eth1(invalid ip-local lan192.168.220.250) .I have one more machine =
in my Local Lan (192.168.220.90) which is a mail server in my local =
LAN.Now I want to=20
1.enable port forwarding ie any request comming on 202.140.152.33 port =
285 should get forwarded to 192.168.220.90 port 25 my mail server.

2.Also any request comming from my lan ie 192.168.220.0/24 to invalid ip =
of linux box ie 192.168.220.90 285 should also forwarded to my Mail =
server in lan ie 192.168.220.30 port 25.

My first synario is also not working.

my rules are

iptables -t nat -A PREROUTING -i eth0  -p tcp -d 202.140.136.90 --dport =
285 -j DNAT 182.168.220.90:25

iptables -t nat -A POSTROUTING  -o eth0 -j MASQURADE
iptables -t nat -A POSTROUTING -s 192.168.220.0/24 -j MASQURADE

Pls help


Thanks and Regards
Deepali


------=_NextPart_000_001B_01C2241D.92B9D920
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.3315.2870" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Dear Support</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>My setup is ..I have one linux box =
having=20
eth0(valid ip202.140.152.33) and eth1(invalid ip-local =
lan192.168.220.250) .I=20
have one more machine in my Local Lan (192.168.220.90) which is a mail =
server in=20
my local LAN.Now I want to </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>1.enable port forwarding ie any request =
comming on=20
202.140.152.33 port 285 should get forwarded to 192.168.220.90 port 25 =
my mail=20
server.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>2.Also any request comming from my lan =
ie=20
192.168.220.0/24 to invalid ip of linux box ie 192.168.220.90 285 should =
also=20
forwarded to my Mail server in lan ie 192.168.220.30 port =
25.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>My first synario is also not =
working.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>my rules are</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A PREROUTING&nbsp;-i =
eth0  -p tcp=20
-d 202.140.136.90 --dport 285 -j DNAT 182.168.220.90:25</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A POSTROUTING&nbsp; -o =
eth0 -j=20
MASQURADE</FONT></DIV>
<DIV>iptables -t nat -A POSTROUTING -s 192.168.220.0/24 -j =
MASQURADE</DIV>
<DIV>&nbsp;</DIV>
<DIV>Pls help</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks and Regards</DIV>
<DIV>Deepali</DIV>
<DIV>&nbsp;</DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_001B_01C2241D.92B9D920--


