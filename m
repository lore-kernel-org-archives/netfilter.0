From: "James Stickland" <jamesstickland@sympatico.ca>
Subject: multiple external interfaces
Date: Mon, 11 Jan 1999 12:13:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001501be3d85$bf2b8e40$0200000a@workstation>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0012_01BE3D5B.D61262C0"
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

------=_NextPart_000_0012_01BE3D5B.D61262C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

what i am currently trying to do is have my router masquerade multiple =
external interfaces to multiple internal ethernets.

I have two ppp connections: one over ethernet (dsl), and the other over =
serial (pots line dialup).

the dsl line is basically for my servers, it looks like this

internet--dsl-->ppp0(eth0)-->router-->eth1-->server switch-->computers

this ethernet works fine, and all iptables rules written for it work =
fine. (filtering and NATing)  new or established packets are taken in, =
then forwarded along eth1 to the corresponding class c ip on the server =
network.

however, i would like to run my client/workstation's internet connection =
from the same router, but using different external interface and =
internal ethernet.
for example, i would like the pots dialup line interface masqueraded to =
eth2, so that all computers connected to eth2 use the ip address of the =
ppp device connected to dialup.

here is how i vision it:

internet--dial_up-->ppp1(/dev/ttyS3)-->router-->eth2-->crossover_cable-->=
client

could anyone help me in doing so?  is it just a matter of some =
additional iptables entries, or does this run deeper? please help, and =
cc reply directly to jamesstickland@sympatico.ca


------=_NextPart_000_0012_01BE3D5B.D61262C0
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
<DIV><FONT face=3DArial size=3D2>what i am currently trying to do is =
have my router=20
masquerade multiple external interfaces to multiple internal=20
ethernets.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have two ppp connections: one over =
ethernet=20
(dsl), and the other over serial (pots line dialup).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>the dsl line is basically for my =
servers, it looks=20
like this</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>internet--dsl--&gt;ppp0(eth0)--&gt;router--&gt;eth1--&gt;server =

switch--&gt;computers</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>this ethernet works fine, and all =
iptables rules=20
written for it work fine. (filtering and NATing)&nbsp; new or =
established=20
packets are taken in, then forwarded along eth1 to the corresponding =
class c ip=20
on the server network.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>however, i would like to run my=20
client/workstation's internet connection from the same router, but using =

different external interface and internal ethernet.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>for example, i would like the pots =
dialup line=20
interface masqueraded to eth2, so that all computers connected to eth2 =
use the=20
ip address of the ppp device connected to dialup.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>here is how i vision it:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>internet--dial_up--&gt;ppp1(/dev/ttyS3)--&gt;router--&gt;eth2--&=
gt;crossover_cable--&gt;client</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>could anyone help me in doing so?&nbsp; =
is it just=20
a matter of some additional&nbsp;iptables entries, or does this run =
deeper?=20
please help, and cc reply directly to <A=20
href=3D"mailto:jamesstickland@sympatico.ca">jamesstickland@sympatico.ca</=
A></FONT></DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0012_01BE3D5B.D61262C0--


