From: "Adi" <kristiadi_himawan@dtp.net.id>
Subject: Iptables and bridge
Date: Tue, 17 Feb 2004 13:12:19 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003001c3f59a$ba6dc2b0$15a02bca@Rangga>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002D_01C3F557.AC3CC710"
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
To: netfilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_002D_01C3F557.AC3CC710
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Does anyone ever try traffic accounting using iptables (ipac-ng) in at =
linux bridge?
I have try using iptables -t mangle -A PREROUTING -j ACCEPT, but when i =
see the
bytes counter using iptables -t mangle -nL -vx, it shown 0.=20
But acctually the traffic already flow from eth0,eth1and br0,=20
i monitoring by the traffic using tcpdump and iptraf.

Thanks

Regards,

Kris


------=_NextPart_000_002D_01C3F557.AC3CC710
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
<DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Does anyone ever try traffic accounting =
using=20
iptables (ipac-ng) in at linux bridge?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I have try using iptables -t mangle -A =
PREROUTING=20
-j ACCEPT, but when i see the</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>bytes counter using iptables -t mangle =
-nL -vx, it=20
shown 0. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>But acctually the traffic already flow =
</FONT><FONT=20
face=3DArial size=3D2>from eth0,eth1and br0,&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>i monitoring by the traffic using =
</FONT><FONT=20
face=3DArial size=3D2>t</FONT><FONT face=3DArial size=3D2>cpdump and=20
iptraf.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Regards,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Kris</FONT></DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_002D_01C3F557.AC3CC710--


