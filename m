From: "Christopher Davis" <cldavis@speakeasy.net>
Subject: cannot ping loopback address
Date: Wed, 5 Nov 2003 03:18:12 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <JKELJHHMDHPOLKFBOEGHKEGLDAAA.cldavis@speakeasy.net>
Reply-To: <cldavis@speakeasy.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0000_01C3A34B.71C77E80"
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

------=_NextPart_000_0000_01C3A34B.71C77E80
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hello everyone!

I have setup an iptables script that will not allow me to ping 127.0.0.1 for
some reason --

Input policy is drop
Forward and output policy is accept.  (Egress filtering on the way!)

I have in the rules to allow established or related connections -- "-A
INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
Can ping everything else.
ifconfig does have information on the lo @ 127.0.0.1

Any ideas?

Thanks!!
Christopher Davis

------=_NextPart_000_0000_01C3A34B.71C77E80
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1264" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D000090408-05112003><FONT face=3DArial size=3D2>Hello=20
everyone!</FONT></SPAN></DIV>
<DIV><SPAN class=3D000090408-05112003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D000090408-05112003><FONT face=3DArial size=3D2>I have =
setup an=20
iptables script that will not allow me to ping 127.0.0.1 for some reason =
--=20
</FONT></SPAN></DIV>
<DIV><SPAN class=3D000090408-05112003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D000090408-05112003><FONT face=3DArial size=3D2>Input =
policy is=20
drop</FONT></SPAN></DIV>
<DIV><SPAN class=3D000090408-05112003><FONT face=3DArial =
size=3D2>Forward and output=20
policy is accept.&nbsp; (Egress filtering on the =
way!)</FONT></SPAN></DIV>
<DIV><SPAN class=3D000090408-05112003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D000090408-05112003><FONT face=3DArial size=3D2>I have =
in the rules=20
to allow established or related connections -- "-A INPUT -m state =
--state=20
ESTABLISHED,RELATED -j ACCEPT</FONT></SPAN></DIV>
<DIV><SPAN class=3D000090408-05112003><FONT face=3DArial size=3D2>Can =
ping everything=20
else.</FONT></SPAN></DIV>
<DIV><SPAN class=3D000090408-05112003><FONT face=3DArial =
size=3D2>ifconfig does have=20
information on the lo @ 127.0.0.1</FONT></SPAN></DIV>
<DIV><SPAN class=3D000090408-05112003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D000090408-05112003><FONT face=3DArial size=3D2>Any=20
ideas?</FONT></SPAN></DIV>
<DIV><SPAN class=3D000090408-05112003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D000090408-05112003><FONT face=3DArial=20
size=3D2>Thanks!!</FONT></SPAN></DIV>
<DIV><SPAN class=3D000090408-05112003><FONT face=3DArial =
size=3D2>Christopher=20
Davis</FONT></SPAN></DIV></BODY></HTML>

------=_NextPart_000_0000_01C3A34B.71C77E80--



