From: "Soporte Meranetwork" <mera@fibertel.com.ar>
Subject: ?
Date: Tue, 1 Apr 2003 17:13:23 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004f01c2f88b$2720d180$0201a8c0@work>
Reply-To: "Soporte Meranetwork" <mera@fibertel.com.ar>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_004C_01C2F872.0063DCE0"
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

------=_NextPart_000_004C_01C2F872.0063DCE0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Good day.I have used IPTabels 1.2.5-3,and dont know that it have or not =
H323 modul .But for recive Call from outside(internet) to =
inside(throught NAT) - Netmeeting(ATA 186) i use thet rules:=20
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -s 192.168.0.0/24 -j =
MASQUERADE=20
  (intern LAN)
PORTFWIP=3D"192.168.0.201" ( PC with Netmeting or ATA 186)
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -p tcp --dport 1720 -m state =
--state
NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 1720 -j DNAT =
--to $PORTFWIP:1720
But i want to use NAT without  FORWARD ,PREROUTING with H323 ability for =
any IP in LAN.Where i can find IPtables with ability of H323(version) or =
where is the patch(modul) for that ability? Thank your.=20
Buy,
Eugen
------=_NextPart_000_004C_01C2F872.0063DCE0
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
<DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV>Good day.I have used IPTabels 1.2.5-3,and dont know that it have or =
not=20
H323 modul .But for recive Call from outside(internet) to =
inside(throught NAT) -=20
Netmeeting(ATA 186) i use thet rules:&nbsp;</DIV>
<DIV>$IPTABLES -t nat -A POSTROUTING -o $EXTIF -s 192.168.0.0/24 -j=20
MASQUERADE&nbsp;</DIV>
<DIV>&nbsp; (intern LAN)<BR>PORTFWIP=3D"192.168.0.201" ( PC with =
Netmeting or ATA=20
186)</DIV>
<DIV>$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -p tcp --dport 1720 -m =
state=20
--state<BR>NEW,ESTABLISHED,RELATED -j ACCEPT<BR>$IPTABLES -A PREROUTING =
-t nat=20
-p tcp -d $EXTIP --dport 1720 -j DNAT --to $PORTFWIP:1720<BR>But i want =
to use=20
NAT without&nbsp; FORWARD ,PREROUTING with H323 ability for any IP in =
LAN.Where=20
i can find IPtables with ability of H323(version) or where is the =
patch(modul)=20
for that ability? Thank your.&nbsp;</DIV>
<DIV>Buy,</DIV>
<DIV>Eugen</DIV></FONT></DIV></DIV></BODY></HTML>

------=_NextPart_000_004C_01C2F872.0063DCE0--


