From: "Daniel Paul" <dpaul@gmx.net>
Subject: Possible bug for delete specific rule w/ RedHat 8.0, Kernel 2.4.18, Iptables 1.2.6a
Date: Mon, 14 Oct 2002 13:05:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <PFEPIPDMGMFEOIBPJIIEMEBBCEAA.dpaul@gmx.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0001_01C27382.70E1E3B0"
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

------=_NextPart_000_0001_01C27382.70E1E3B0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hello,

I have problems deleting a rule from any chain by specifying the rule
itself, for example:

iptables -A FORWARD -p tcp -s $NET_IN --sport 1024: -d 0/0 --dport smtp -j
ACCEPT

and then

iptables -D FORWARD -p tcp -s $NET_IN --sport 1024: -d 0/0 --dport smtp -j
ACCEPT

gives me a "Bad rule: Does matching rule exist in chain" error. Btw, the
variables used
here are of course defined.

When I use -v switch on both commands I can see that also the created rules
(smtp to 25 etc.)
are the same, so it is not a problem of parsing itself.

Any help would be very appreciated.

Daniel Paul

dpaul{NOSPAM}@gmx.net



------=_NextPart_000_0001_01C27382.70E1E3B0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2716.2200" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D100075810-14102002><FONT face=3DArial=20
size=3D2>Hello,</FONT></SPAN></DIV>
<DIV><SPAN class=3D100075810-14102002><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D100075810-14102002><FONT face=3DArial size=3D2>I have =
problems=20
deleting a rule from any chain by specifying the rule itself, for=20
example:</FONT></SPAN></DIV>
<DIV><SPAN class=3D100075810-14102002><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D100075810-14102002><FONT face=3DArial =
size=3D2>iptables -A FORWARD=20
-p tcp -s $NET_IN --sport 1024:&nbsp;-d 0/0 --dport smtp -j=20
ACCEPT</FONT></SPAN></DIV>
<DIV><SPAN class=3D100075810-14102002><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D100075810-14102002><FONT face=3DArial size=3D2>and=20
then</FONT></SPAN></DIV>
<DIV><SPAN class=3D100075810-14102002><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D100075810-14102002>
<DIV><SPAN class=3D100075810-14102002><FONT face=3DArial =
size=3D2>iptables -D FORWARD=20
-p tcp -s $NET_IN --sport 1024:&nbsp;-d 0/0 --dport smtp -j=20
ACCEPT</FONT></SPAN></DIV>
<DIV><SPAN class=3D100075810-14102002><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D100075810-14102002><FONT face=3DArial size=3D2>gives =
me a "Bad=20
rule: Does matching rule exist in chain" error. Btw, the variables=20
used</FONT></SPAN></DIV>
<DIV><SPAN class=3D100075810-14102002><FONT face=3DArial size=3D2>here =
are of course=20
defined.</FONT></SPAN></DIV>
<DIV><SPAN class=3D100075810-14102002><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D100075810-14102002><FONT face=3DArial size=3D2>When I =
use -v switch=20
on both commands I can see that also the created rules (smtp to 25=20
etc.)</FONT></SPAN></DIV>
<DIV><SPAN class=3D100075810-14102002><FONT face=3DArial size=3D2>are =
the same, so it=20
is not a problem of parsing itself.</FONT></SPAN></DIV>
<DIV><SPAN class=3D100075810-14102002><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D100075810-14102002><FONT face=3DArial size=3D2>Any =
help would be=20
very appreciated.</FONT></SPAN></DIV>
<DIV><SPAN class=3D100075810-14102002><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D100075810-14102002><FONT face=3DArial size=3D2>Daniel =

Paul</FONT></SPAN></DIV>
<DIV><SPAN class=3D100075810-14102002><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D100075810-14102002><FONT face=3DArial size=3D2><A=20
href=3D"mailto:dpaul{NOSPAM}@gmx.net">dpaul{NOSPAM}@gmx.net</A></FONT></S=
PAN></DIV>
<DIV><SPAN class=3D100075810-14102002><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN=20
class=3D100075810-14102002></SPAN>&nbsp;</DIV></SPAN></DIV></BODY></HTML>=


------=_NextPart_000_0001_01C27382.70E1E3B0--


