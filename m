From: "Adam De Paolis" <adepaolis@rogers.com>
Subject: ftp hammer rule help
Date: Mon, 30 Sep 2002 22:53:06 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007201c268f5$abec1fd0$6501a8c0@adm2hsmw3cesp7>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_006F_01C268D4.24387370"
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

------=_NextPart_000_006F_01C268D4.24387370
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I am trying to create a rule which will prevent users from hammering my =
ftp site when its busy. A rule which say will drop userlogin if their is =
3 attempts in 1 minute.

I believe the match recent rule is what I need to get working but I =
don't have it working.  This is what I have so far (thanks to stephen =
frost, but it doesnt seem to work.=20

The firewall machine is my ftp server, both are on the same computer:

iptables -A FORWARD -m recent --name ftpconn --rcheck --seconds 60 =
--hitcount 3 -j DROP
iptables -A FORWARD -p tcp -d aa.bb.cc.dd/32 --dport 21 -m recent --name =
ftpconn --set -j DRO

------=_NextPart_000_006F_01C268D4.24387370
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
<DIV><FONT face=3DArial size=3D2>I am trying to create a&nbsp;rule which =
will=20
prevent users from hammering my ftp site when its busy. A rule which say =
will=20
drop userlogin if their is 3 attempts in 1 minute.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I believe the match recent rule is what =
I need to=20
get working but I don't have it working.&nbsp; This is what I have so =
far=20
(thanks to stephen frost, but it doesnt seem to work.&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The firewall machine is my ftp server, =
both are on=20
the same computer:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A FORWARD -m recent --name =
ftpconn=20
--rcheck --seconds 60 --hitcount 3 -j DROP<BR>iptables -A FORWARD -p tcp =
-d=20
aa.bb.cc.dd/32 --dport 21 -m recent --name ftpconn --set -j=20
DRO</FONT></DIV></BODY></HTML>

------=_NextPart_000_006F_01C268D4.24387370--


