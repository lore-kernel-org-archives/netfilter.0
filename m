From: =?iso-8859-1?Q?Matias_Bj=F8rling?= <mb@ncparty.dk>
Subject: Yet Another Kazaa Issue
Date: Tue, 19 Nov 2002 21:55:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001101c2900e$055b0bf0$0200000a@parseerror.dk>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000D_01C29016.5C1649C0"
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

------=_NextPart_000_000D_01C29016.5C1649C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hey

Im trying like hell to get Kazaa to stop connect successfully... =
Whatever i do, blocking port 1214 in ANY possible way, it still resist =
and connect sucessfully, even with thoes firewall rules

iptables -A FORWARD -m string --string "X-Kazaa-Username:" -j DROP
iptables -A FORWARD -m string --string "X-Kazaa-Network:" -j DROP
iptables -A FORWARD -m string --string "X-Kazaa-IP:" -j DROP
iptables -A FORWARD -m string --string "X-Kazaa-SupernodeIP" -j DROP
iptables -A FORWARD -m string --string "Kazaa" -j DROP

Chain FORWARD (policy DROP)
target     prot opt source               destination
DROP       all  --  anywhere             anywhere           STRING match =
X-Kazaa-Username:
DROP       all  --  anywhere             anywhere           STRING match =
X-Kazaa-Network:
DROP       all  --  anywhere             anywhere           STRING match =
X-Kazaa-IP:
DROP       all  --  anywhere             anywhere           STRING match =
X-Kazaa-SupernodeIP
DROP       all  --  anywhere             anywhere           STRING match =
Kazaa
LOG        all  --  anywhere             anywhere           STRING match =
User  LOG level warning
DROP       all  --  anywhere             anywhere           STRING match =
User
state_chk  all  --  anywhere             anywhere


It catch the "kazaa" thingie on the homepage... But.. anyhow it somehow =
seem to connect to the supernode outside... Im getting nuts.. Why can't =
i stop it?.. What am i doing wrong.. I tried to ages now.. and it dont =
work :(

Any help will be appreciated :D

Thanks

- SilverWolf

------=_NextPart_000_000D_01C29016.5C1649C0
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
<DIV><FONT face=3DArial size=3D2>Hey</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Im trying like hell to get Kazaa to =
stop connect=20
successfully... Whatever i do, blocking port 1214 in ANY possible way, =
it still=20
resist and connect sucessfully, even with thoes firewall =
rules</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A FORWARD -m string --string=20
"X-Kazaa-Username:" -j DROP<BR>iptables -A FORWARD -m string --string=20
"X-Kazaa-Network:" -j DROP<BR>iptables -A FORWARD -m string --string=20
"X-Kazaa-IP:" -j DROP<BR>iptables -A FORWARD -m string --string=20
"X-Kazaa-SupernodeIP" -j DROP<BR>iptables -A FORWARD -m string --string =
"Kazaa"=20
-j DROP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV><FONT face=3DArial =
size=3D2>Chain=20
FORWARD (policy DROP)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination<BR>DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; =
--&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
STRING=20
match X-Kazaa-Username:<BR>DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
all&nbsp;=20
--&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
STRING=20
match X-Kazaa-Network:<BR>DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
all&nbsp;=20
--&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
STRING=20
match X-Kazaa-IP:<BR>DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; =
--&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
STRING=20
match X-Kazaa-SupernodeIP<BR>DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
all&nbsp;=20
--&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
STRING=20
match Kazaa<BR>LOG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; =
--&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
STRING=20
match User&nbsp; LOG level =
warning<BR>DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
all&nbsp; --&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
STRING=20
match User<BR>state_chk&nbsp; all&nbsp; --&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere<BR></FONT>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>It catch the "kazaa" thingie on the =
homepage...=20
But.. anyhow it somehow seem to connect to the supernode outside... Im =
getting=20
nuts.. Why can't i stop it?.. What am i doing wrong.. I tried to ages =
now.. and=20
it dont work :(</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Any help will be appreciated =
:D</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>- SilverWolf</FONT></DIV></BODY></HTML>

------=_NextPart_000_000D_01C29016.5C1649C0--


