From: "Ilo" <sneak@gmsg.co.za>
Subject: Portfowarding not working while SNATing,
Date: Tue, 15 Jul 2003 08:33:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006501c34a9a$efc8d040$4c00000a@sneak>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0062_01C34AAB.B34A7450"
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

------=_NextPart_000_0062_01C34AAB.B34A7450
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

If have the following set for some port forwarding that I need done, =
which works well...

/sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 -d 196.11.11.11 =
--dport 80 -j DNAT --to 10.0.0.2:80
/sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 -d 196.11.11.11 =
--dport 389 -j DNAT --to 10.0.0.2:389

then once I set the following for SNAT so my local machines can get =
internet access my port forwarding=20
stops working.

/sbin/iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 196.11.11.11


Is there something im not doing right? can someone point me in the right =
direction.

tx.

------=_NextPart_000_0062_01C34AAB.B34A7450
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
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>If have the following set for some port =
forwarding=20
that I need done, which works well...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><EM>/sbin/iptables -t nat -A PREROUTING =
-p tcp -i=20
eth0 -d 196.11.11.11 --dport 80 -j DNAT --to =
10.0.0.2:80<BR>/sbin/iptables -t=20
nat -A PREROUTING -p tcp -i eth0 -d 196.11.11.11 --dport 389 -j DNAT =
--to=20
10.0.0.2:389</EM><BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>then once I set the following for SNAT =
so my local=20
machines can get internet access my port forwarding </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>stops working.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2><EM>/sbin/iptables -t nat -A =
POSTROUTING -o eth0 -j=20
SNAT --to 196.11.11.11</EM></FONT></DIV>
<DIV><EM></EM>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>Is there something im not doing right? can someone point me in the =
right=20
direction.</DIV>
<DIV>&nbsp;</DIV>
<DIV>tx.</DIV></DIV></FONT></FONT></DIV></BODY></HTML>

------=_NextPart_000_0062_01C34AAB.B34A7450--


