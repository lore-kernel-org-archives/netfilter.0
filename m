From: "Jeremy" <jeremy@paradise.net.nz>
Subject: vpn/iptables question
Date: Tue, 15 Apr 2003 17:55:59 +1200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <020601c30313$b0522020$3864a8c0@comsol.co.nz>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0203_01C30378.4563C0B0"
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

------=_NextPart_000_0203_01C30378.4563C0B0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi There,=20

Any help would be appreiciated. this is beginning to drive me mad. I am =
running debian kernel 2.4 with iptables v1.2.6a acting as a =
firewall/router.=20

Everything is working fine, however for windows clients trying to make a =
vpn connection to a windows 2000 vpn server is proving tedious. I =
understand that it connects on tcp port 1723 (i have allowed everythnig =
to go out through the firewall) however from what I have read you also =
have to allow udp port 500 and protocol 50 to come back through the =
firewall for the connection to work.=20

Before adding any rules, the vpn's would occasionally work, however only =
on a particular PC, and if tried at a different time of day it would =
fail. so it was working intermittately.=20

after researching. I added the these rules to my firewall script=20

# ike key negotiation=20
iptables -A FORWARD -p udp --sport 500 --dport 500 -j ACCEPT=20
# ESP - the ipsec encrypted traffic itself=20
iptables -A FORWARD -p 50 -j ACCEPT=20

still no luck. If i switch back to a win2k machine with 'internet =
connection sharing' (i only did this as a test) the vpn's work fine.=20

Does anyone have any experience with this.=20

any help MUCH appreciated on this one.=20
thx in advance=20

Jeremy=20


------=_NextPart_000_0203_01C30378.4563C0B0
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
<DIV>Hi There, <BR><BR>Any help would be appreiciated. this is beginning =
to=20
drive me mad. I am running debian kernel 2.4 with iptables v1.2.6a =
acting as a=20
firewall/router. <BR><BR>Everything is working fine, however for windows =
clients=20
trying to make a vpn connection to a windows 2000 vpn server is proving =
tedious.=20
I understand that it connects on tcp port 1723 (i have allowed =
everythnig to go=20
out through the firewall) however from what I have read you also have to =
allow=20
udp port 500 and protocol 50 to come back through the firewall for the=20
connection to work. <BR><BR>Before adding any rules, the vpn's would=20
occasionally work, however only on a particular PC, and if tried at a =
different=20
time of day it would fail. so it was working intermittately. =
<BR><BR>after=20
researching. I added the these rules to my firewall script <BR><BR># ike =
key=20
negotiation <BR>iptables -A FORWARD -p udp --sport 500 --dport 500 -j =
ACCEPT=20
<BR># ESP - the ipsec encrypted traffic itself <BR>iptables -A FORWARD =
-p 50 -j=20
ACCEPT <BR><BR>still no luck. If i switch back to a win2k machine with =
'internet=20
connection sharing' (i only did this as a test) the vpn's work fine.=20
<BR><BR>Does anyone have any experience with this. <BR><BR>any help MUCH =

appreciated on this one. <BR>thx in advance <BR><BR>Jeremy=20
<BR></DIV></BODY></HTML>

------=_NextPart_000_0203_01C30378.4563C0B0--


