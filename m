From: "Tim" <tbblitz@optusnet.com.au>
Subject: h323 Working :>
Date: Thu, 21 Nov 2002 11:58:09 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001b01c29198$50f31680$0b00a8c0@timboss>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0018_01C29155.4275A890"
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

------=_NextPart_000_0018_01C29155.4275A890
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Fresh copy of 2.4.19 and iptables 1.2.7a with patch-o-matic and used the =
z-newnat and h323 that comes with it.. fixed the newnat patch which =
couldn't load. add 2 lines to a ip_conntrack.h file and it worked fine=20

Then added these rules
$IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport 522 -j DNAT =
--to 192.168.0.11 # H323
$IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport 1503 -j DNAT =
--to 192.168.0.11 # H323
$IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport 1720 -j DNAT =
--to 192.168.0.11 # H323
$IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport 1731 -j DNAT =
--to 192.168.0.11 # H323
$IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport 8080 -j DNAT =
--to 192.168.0.11 # H323

insmod ip_conntrack_h323

insmod ip_nat_h323

Regards Tim


------=_NextPart_000_0018_01C29155.4275A890
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
<DIV><FONT color=3D#000000 size=3D2>
<P>Fresh copy of 2.4.19 and iptables 1.2.7a with patch-o-matic and used =
the=20
z-newnat and h323 that comes with it.. fixed the newnat patch which =
couldn't=20
load. add 2 lines to a ip_conntrack.h file and it worked fine </P>
<P>Then added these rules<BR>$IPTABLES -t nat -A PREROUTING -i $EXTDEV =
-p tcp=20
--dport 522 -j DNAT --to 192.168.0.11 # H323<BR>$IPTABLES -t nat -A =
PREROUTING=20
-i $EXTDEV -p tcp --dport 1503 -j DNAT --to 192.168.0.11 # =
H323<BR>$IPTABLES -t=20
nat -A PREROUTING -i $EXTDEV -p tcp --dport 1720 -j DNAT --to =
192.168.0.11 #=20
H323<BR>$IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport 1731 -j =
DNAT=20
--to 192.168.0.11 # H323<BR>$IPTABLES -t nat -A PREROUTING -i $EXTDEV -p =
tcp=20
--dport 8080 -j DNAT --to 192.168.0.11 # H323</P>
<P>insmod ip_conntrack_h323</P>
<P>insmod ip_nat_h323</P>
<P>Regards Tim</P></FONT></DIV></BODY></HTML>

------=_NextPart_000_0018_01C29155.4275A890--


