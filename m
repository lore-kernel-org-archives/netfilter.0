From: <misiu_@gmx.de>
Subject: AW: Firewall workaround
Date: Sat, 17 Jan 2004 21:20:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NAENJKNIDEBCFOJEICJKAEMICAAA.misiu_@gmx.de>
References: <357895CFC8CB7C44900D6A4F46D08AA90459C9@exchangeserver.IAT.local>
Reply-To: <misiu_@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0017_01C3DD3F.BA8878D0"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <357895CFC8CB7C44900D6A4F46D08AA90459C9@exchangeserver.IAT.local>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Benjamin Dickgiesser <benjamin@dickgiesser.net>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0017_01C3DD3F.BA8878D0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

 Hi Benjamin,

 >>>    iptables --table nat --append POSTROUTING --out-interface eth0 -j
 >>> MASQUERADE
 >>>  iptables --append FORWARD --in-interface tun0 -j ACCEPT

 I'm not an expert, but could it be, that you took the wrong interface?
For Masquerating you need to use the external interface.
Is that eth0?? where is the tun0 interface come from???

for routing
10.3.0.0 is a privat address range, right??
217.172.172.1 is a public address range from Intergenia Technik (t-online)
if so, you can't send a privat address to a public address router/gateway!
if the router was setup right, the packet shoul'd die right there!
transformed to heat and blown out the fan :-))
by the way, i use a default route to the external iface and an route to the
internal.
it's easyer!

misiu




------=_NextPart_000_0017_01C3DD3F.BA8878D0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML dir=3Dltr><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1276" name=3DGENERATOR></HEAD>
<BODY>
<DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3D"Times New =
Roman"=20
size=3D3><SPAN class=3D639125819-17012004><FONT face=3DArial =
color=3D#0000ff=20
size=3D2>&nbsp;Hi Benjamin,</FONT></SPAN></FONT></FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3D"Times New =
Roman"=20
size=3D3><SPAN class=3D639125819-17012004></SPAN><BR><SPAN=20
class=3D639125819-17012004><FONT face=3DArial color=3D#0000ff=20
size=3D2>&nbsp;&gt;&gt;&gt;&nbsp;</FONT></SPAN>&nbsp;&nbsp; iptables =
--table nat=20
--append POSTROUTING --out-interface eth0 -j<BR><SPAN=20
class=3D639125819-17012004><FONT face=3DArial color=3D#0000ff =
size=3D2>&nbsp;<FONT=20
face=3D"Times New Roman" color=3D#000000=20
size=3D3>&gt;&gt;&gt;</FONT>&nbsp;</FONT></SPAN>MASQUERADE<BR>&nbsp;<SPAN=
=20
class=3D639125819-17012004><FONT face=3DArial color=3D#0000ff=20
size=3D2>&gt;&gt;&gt;&nbsp;</FONT></SPAN> iptables --append FORWARD =
--in-interface=20
tun0 -j ACCEPT<BR><SPAN class=3D639125819-17012004><FONT face=3DArial =
color=3D#0000ff=20
size=3D2></FONT></SPAN></FONT></FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3D"Times New =
Roman"=20
size=3D3><SPAN class=3D639125819-17012004><FONT face=3DArial =
color=3D#0000ff=20
size=3D2>&nbsp;I'm not an expert, but could it be, that you took the =
wrong=20
interface?</FONT></SPAN></FONT></FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3D"Times New =
Roman"=20
size=3D3><FONT face=3DArial><FONT color=3D#0000ff><FONT size=3D2><SPAN=20
class=3D639125819-17012004>For Masquerating you need to use the external =

interface.</SPAN></FONT></FONT></FONT></FONT></FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3D"Times New =
Roman"=20
size=3D3><SPAN class=3D639125819-17012004><FONT face=3DArial><FONT =
color=3D#0000ff><FONT=20
size=3D2>Is that eth0?? where is the&nbsp;tun0 interface&nbsp;come=20
from???&nbsp;</FONT></FONT></FONT></SPAN></FONT></FONT></DIV><FONT =
face=3DArial=20
color=3D#000000 size=3D2><FONT face=3DArial color=3D#0000ff =
size=3D2><SPAN=20
class=3D639125819-17012004></SPAN></FONT></FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2><FONT face=3DArial =
color=3D#0000ff=20
size=3D2><SPAN =
class=3D639125819-17012004></SPAN></FONT></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#000000><FONT color=3D#0000ff><SPAN=20
class=3D639125819-17012004></SPAN></FONT></FONT><FONT face=3DArial =
color=3D#000000=20
size=3D2><FONT face=3D"Times New Roman" size=3D3><SPAN =
class=3D826070520-17012004><FONT=20
face=3DArial color=3D#0000ff size=3D2>for routing</FONT></SPAN></DIV>
<DIV><SPAN class=3D826070520-17012004></SPAN><FONT face=3DArial><FONT=20
color=3D#0000ff><FONT size=3D2>1<SPAN class=3D826070520-17012004>0.3.0.0 =
is a privat=20
address range, right?? </SPAN></FONT></FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT color=3D#0000ff><FONT size=3D2><SPAN=20
class=3D826070520-17012004></SPAN></FONT></FONT></FONT><SPAN=20
class=3D826070520-17012004></SPAN><FONT face=3DArial><FONT =
color=3D#0000ff><FONT=20
size=3D2>2<SPAN class=3D826070520-17012004>17.172.172.1 is a public =
address range=20
from Intergenia Technik (t-online)</SPAN></FONT></FONT></FONT></DIV>
<DIV><FONT><FONT color=3D#0000ff><FONT size=3D2><SPAN=20
class=3D826070520-17012004></SPAN></FONT></FONT></FONT><SPAN=20
class=3D826070520-17012004></SPAN><FONT face=3DArial><FONT =
color=3D#0000ff><FONT=20
size=3D2>i<SPAN class=3D826070520-17012004>f so, you can't send a privat =
address to=20
a public address router/gateway!</SPAN></FONT></FONT></FONT></DIV>
<DIV><SPAN class=3D826070520-17012004></SPAN><FONT face=3DArial><FONT=20
color=3D#0000ff><FONT size=3D2>i<SPAN class=3D826070520-17012004>f the =
router was=20
setup right,&nbsp;the packet&nbsp;shoul'd die right=20
there!</SPAN></FONT></FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT color=3D#0000ff><FONT size=3D2><SPAN=20
class=3D826070520-17012004>transformed to heat and blown out the fan=20
:-))</SPAN></FONT></FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT color=3D#0000ff><FONT size=3D2><SPAN=20
class=3D826070520-17012004>by the way, i use a default route to the =
external iface=20
and an route to the internal.</SPAN></FONT></FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT color=3D#0000ff><FONT size=3D2><SPAN=20
class=3D826070520-17012004>it's =
easyer!</SPAN></FONT></FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT color=3D#0000ff><FONT size=3D2><SPAN=20
class=3D826070520-17012004></SPAN></FONT></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT color=3D#0000ff><FONT size=3D2><SPAN=20
class=3D826070520-17012004>misiu</SPAN></FONT></FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT color=3D#0000ff><FONT size=3D2><SPAN=20
class=3D826070520-17012004></SPAN></FONT></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT color=3D#0000ff><FONT size=3D2><SPAN=20
class=3D826070520-17012004></SPAN></FONT></FONT></FONT>&nbsp;</DIV>
<DIV><BR></DIV></FONT></FONT></BODY></HTML>

------=_NextPart_000_0017_01C3DD3F.BA8878D0--


