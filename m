From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: Netmeeting Desktop sharing in not working.
Date: Wed, 25 Sep 2002 11:01:13 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001001c264a4$64a64e70$8c01a8c0@sundaram>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000D_01C26482.DD3920F0"
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

------=_NextPart_000_000D_01C26482.DD3920F0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I am using following firewall rules for Netmeeting, Voice is working =
fine but Desktop sharing, Netmeeting chat is not working. I am getting =
not in a call error message.

Do I need to change anything on my IPtables rules? Is any one running =
firewall with this feature.

Thanks
Sundaram



EXT=3D"eth0"
INT=3D"eth1"
INT2=3D"eth2"
LO=3D"lo"

ANY=3D"Any/0"

GW_IP=3D"192.168.1.1"
GW_EXT_IP=3D"XX.140.18.XX"
SUB_NET=3D"192.168.1.0/24"

PRIVP=3D"0:1023"
UNPRI=3D"1024:65535"

IPT=3D"/sbin/iptables"



: For NetMeeting
$IPT -A OUTPUT -o $EXT -p udp --sport 1024:65535 --dport 53 -j ACCEPT
$IPT -A INPUT  -i $EXT -p udp --sport 53 --dport 1024:65535 -j ACCEPT
$IPT -A OUTPUT -o $EXT -p tcp --sport $UNPRI --dport 53 -j ACCEPT
$IPT -A INPUT  -i $EXT -p tcp --sport 53 --dport $UNPRI -j ACCEPT

$IPT -A FORWARD -i $EXT -p tcp --dport 113 --syn -j REJECT

------=_NextPart_000_000D_01C26482.DD3920F0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4807.2300" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I am using following firewall rules for =
Netmeeting,=20
Voice is working fine but Desktop sharing, Netmeeting chat is not =
working. I am=20
getting not in a call error message.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Do I need to change anything on my =
IPtables rules?=20
Is any one running firewall with this feature.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Sundaram</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>EXT=3D"eth0"<BR>INT=3D"eth1"<BR>INT2=3D"eth2"<BR>LO=3D"lo"</FONT=
></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>ANY=3D"Any/0"</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>GW_IP=3D"192.168.1.1"<BR>GW_EXT_IP=3D"XX.140.18.XX"<BR>SUB_NET=3D=
"192.168.1.0/24"</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial =
size=3D2>PRIVP=3D"0:1023"<BR>UNPRI=3D"1024:65535"</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>IPT=3D"/sbin/iptables"</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV><FONT face=3DArial =
size=3D2>
<DIV><BR>: For NetMeeting<BR>$IPT -A OUTPUT -o $EXT -p udp --sport =
1024:65535=20
--dport 53 -j ACCEPT<BR>$IPT -A INPUT&nbsp; -i $EXT -p udp --sport 53 =
--dport=20
1024:65535 -j ACCEPT<BR>$IPT -A OUTPUT -o $EXT -p tcp --sport $UNPRI =
--dport 53=20
-j ACCEPT<BR>$IPT -A INPUT&nbsp; -i $EXT -p tcp --sport 53 --dport =
$UNPRI -j=20
ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV>$IPT -A FORWARD -i $EXT -p tcp --dport 113 --syn -j=20
REJECT</FONT></DIV></BODY></HTML>

------=_NextPart_000_000D_01C26482.DD3920F0--


