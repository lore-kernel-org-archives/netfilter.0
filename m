From: "Mark Ayad" <mark@javamark.com>
Subject: RE: Destination NAT Onto the Same Network Problem
Date: Wed, 10 Jul 2002 17:47:45 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <009f01c22829$235a3600$0300a8c0@W2KP01>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_009C_01C22839.E614B980"
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

------=_NextPart_000_009C_01C22839.E614B980
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sorry everyone, that this is getting quite long ):

I gave

$IPTABLES -t nat -A PREROUTING -d a.b.c.d -p tcp --dport 80 -j DNAT --to
192.168.0.3

a whirl but no joy, although the onnection request tqkes muck longer to =
time
out ?

So we have

[198.168.0.3] make a request on [198.168.0.1] the gateway  which is MASQ =
to
[a.b.d.c]  the ext IP of the firewall. The DNS lookup returns [a.b.d.c]
which is Postrouted DNAT mapped to [198.168.0.3]

Am I right I thinking that the source address is that of the gateway
[198.168.0.1] , which is why I get no response ?

echo "   clearing any existing rules and setting default policy.."
$IPTABLES -P INPUT ACCEPT
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -t nat -F

$IPTABLES -A INPUT -p tcp --syn --destination-port 80 -j ACCEPT
$IPTABLES -A INPUT -p tcp --syn -j DROP

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -j LOG

$IPTABLES -t nat -A PREROUTING -p tcp -i eth0 --dport 80 -j
DNAT --to-destination 192.168.0.3:80

$IPTABLES -t nat -A PREROUTING -d a.b.c.d -p tcp --dport 80 -j DNAT --to
192.168.0.3

$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

echo -e "\nrc.firewall-2.4 v$FWVER done.\n"

Where where a.b.c.d is the ext IP of the firewall.

Still won't connect from an IP request on 192.168.0.3 ?

It requires a rule simply to act as a loopback but first going by the
external ip to obtain the external dns IP which is a.b.c.d.





------=_NextPart_000_009C_01C22839.E614B980
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2920.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Sorry everyone, that this is getting =
quite long=20
):</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I gave<BR><BR>$IPTABLES -t nat -A =
PREROUTING -d=20
a.b.c.d -p tcp --dport 80 -j DNAT --to<BR>192.168.0.3<BR><BR>a whirl but =
no joy,=20
although the onnection request tqkes muck longer to time<BR>out =
?<BR><BR>So we=20
have<BR><BR>[198.168.0.3] make a request on [198.168.0.1] the =
gateway&nbsp;=20
which is MASQ to<BR>[a.b.d.c]&nbsp; the ext IP of the firewall. The DNS =
lookup=20
returns [a.b.d.c]<BR>which is Postrouted DNAT mapped to =
[198.168.0.3]<BR><BR>Am=20
I right I thinking that the source address is that of the=20
gateway<BR>[198.168.0.1] , which is why I get no response ?<BR><BR>echo=20
"&nbsp;&nbsp; clearing any existing rules and setting default=20
policy.."<BR>$IPTABLES -P INPUT ACCEPT<BR>$IPTABLES -F =
INPUT<BR>$IPTABLES -P=20
OUTPUT ACCEPT<BR>$IPTABLES -F OUTPUT<BR>$IPTABLES -P FORWARD =
DROP<BR>$IPTABLES=20
-F FORWARD<BR>$IPTABLES -t nat -F<BR><BR>$IPTABLES -A INPUT -p tcp --syn =

--destination-port 80 -j ACCEPT<BR>$IPTABLES -A INPUT -p tcp --syn -j=20
DROP<BR><BR>$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -j =
ACCEPT<BR>$IPTABLES -A=20
FORWARD -i $INTIF -o $EXTIF -j ACCEPT<BR>$IPTABLES -A FORWARD -j=20
LOG<BR><BR>$IPTABLES -t nat -A PREROUTING -p tcp -i eth0 --dport 80 =
-j<BR>DNAT=20
--to-destination 192.168.0.3:80<BR><BR>$IPTABLES -t nat -A PREROUTING -d =
a.b.c.d=20
-p tcp --dport 80 -j DNAT --to<BR>192.168.0.3<BR><BR>$IPTABLES -t nat -A =

POSTROUTING -o $EXTIF -j MASQUERADE<BR><BR>echo -e "\nrc.firewall-2.4 =
v$FWVER=20
done.\n"<BR><BR>Where where a.b.c.d is the ext IP of the =
firewall.<BR><BR>Still=20
won't connect from an IP request on 192.168.0.3 ?<BR><BR>It requires a =
rule=20
simply to act as a loopback but first going by the<BR>external ip to =
obtain the=20
external dns IP which is =
a.b.c.d.<BR><BR><BR><BR></DIV></FONT></BODY></HTML>

------=_NextPart_000_009C_01C22839.E614B980--


