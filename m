From: =?iso-8859-1?Q?S=F8ren_Kent_Jensen?= <soren@familie-jensen.dk>
Subject: MASQUERADE: No route: Rusty's brain broke!
Date: Thu, 19 Feb 2004 17:37:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <010401c3f706$af13a2f0$0223a8c0@soren>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0101_01C3F70F.10C5BB70"
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

------=_NextPart_000_0101_01C3F70F.10C5BB70
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi

I have a firewall with 30 clients behind it.
I am using policy routing. (Meaning that next hop router is chosen by =
source IP address)

There are 2 Internet connections, and I am doing masqurading on both =
interfaces.

After a couple of hours, it stops working. And I get this error in the =
message file:  MASQUERADE: No route: Rusty's brain broke!

On google I found a solution of the problem.=20
But it doesent work.
(The solution was to increase some kernel values:
sysctl -w net.ipv4.neigh.default.gc_thresh1=3D1024
sysctl -w net.ipv4.neigh.default.gc_thresh2=3D4096
sysctl -w net.ipv4.neigh.default.gc_thresh3=3D8192
sysctl -w net.ipv4.neigh.eth0.gc_stale_time=3D480
sysctl -w net.ipv4.neigh.eth1.gc_stale_time=3D480
sysctl -w net.ipv4.neigh.eth2.gc_stale_time=3D480
sysctl -w net.ipv4.neigh.lo.gc_stale_time=3D480
sysctl -w net.ipv4.neigh.default.gc_stale_time=3D480)

Does anyone have a solution for this problem?

P.S. The machine is running SuSE 9.0


TIA
S=F8ren Kent Jensen


------=_NextPart_000_0101_01C3F70F.10C5BB70
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have a firewall with 30 clients =
behind=20
it.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I am using policy routing. (Meaning =
that next hop=20
router is chosen by source IP address)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>There are 2 Internet connections, and I =
am doing=20
masqurading on both interfaces.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>After a couple of hours, it stops =
working. And I=20
get this error in the message file:  MASQUERADE: No route: Rusty's brain =

broke!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>On google I found a solution of the =
problem.=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>But it doesent work.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>(The solution was to increase some =
kernel=20
values:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>sysctl -w=20
net.ipv4.neigh.default.gc_thresh1=3D1024<BR>sysctl -w=20
net.ipv4.neigh.default.gc_thresh2=3D4096<BR>sysctl -w=20
net.ipv4.neigh.default.gc_thresh3=3D8192<BR>sysctl -w=20
net.ipv4.neigh.eth0.gc_stale_time=3D480<BR>sysctl -w=20
net.ipv4.neigh.eth1.gc_stale_time=3D480<BR>sysctl -w=20
net.ipv4.neigh.eth2.gc_stale_time=3D480<BR>sysctl -w=20
net.ipv4.neigh.lo.gc_stale_time=3D480<BR>sysctl -w=20
net.ipv4.neigh.default.gc_stale_time=3D480)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Does anyone have a solution for this=20
problem?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>P.S. The machine is running SuSE =
9.0</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>TIA</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>S=F8ren Kent Jensen</DIV>
<DIV><BR></DIV></FONT></BODY></HTML>

------=_NextPart_000_0101_01C3F70F.10C5BB70--



