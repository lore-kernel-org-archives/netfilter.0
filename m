From: "Andrzej Kozak" <kozak@manager.ae.wroc.pl>
Subject: Re: Trouble with PPTP
Date: Wed, 22 Oct 2003 18:38:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002501c398ba$fcf59dc0$01d2a8c0@adm.ae.wroc.pl>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0022_01C398CB.BDF8FB60"
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
To: kernel@linuxace.com
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0022_01C398CB.BDF8FB60
Content-Type: text/plain;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Thanks Phil,
Is better but not excellent.
After when I :
Patched kernel (pptp-conntrack-nat from p-o-m)
Recompiled iptables v 1.2.8
Recompiled kernel
i get the same message: iptables: Invalid argument
but only if firewall script is automated executing from =
/etc/rc.boot/firewallscript (DEBIAN 3.0 distribution) when linux is =
booting or rebooting.
If I log into system and executing this script manually is everything OK =
!
What is wrong ?=20

best regards
Andrew Kozak


> Rebuild iptables userspace using the patched kernel for the headers.
>
> Phil Oester
>
> On Wed, Oct 15, 2003 at 03:46:49PM +0200, Andrzej Kozak wrote:
> > Hello!
> > When I patched my 2.4.22 kernel with pptp-conntrack-nat -DNAT and =
-SNAT
is broken if I use iptables with -t nat
> > I get message: iptables: Invalid argument
> > Iptables v. 1.2.8
> > I need establish connect from my security network to outside VPN =
server.
> >
> > best regards
> >
> > Andrew Kozak

------=_NextPart_000_0022_01C398CB.BDF8FB60
Content-Type: text/html;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-2">
<META content=3D"MSHTML 6.00.2800.1264" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT size=3D2>Thanks Phil,</FONT></DIV>
<DIV><FONT size=3D2>Is better but not excellent.</FONT></DIV>
<DIV><FONT size=3D2>After when I :</FONT></DIV>
<DIV><FONT size=3D2>Patched kernel (pptp-conntrack-nat from =
p-o-m)</FONT></DIV>
<DIV><FONT size=3D2>Recompiled iptables v 1.2.8</FONT></DIV>
<DIV><FONT size=3D2>Recompiled kernel</FONT></DIV>
<DIV><FONT size=3D2>i get the same message: iptables: Invalid=20
argument</FONT></DIV>
<DIV><FONT size=3D2>but only if firewall script is automated executing =
from=20
/etc/rc.boot/firewallscript (DEBIAN 3.0 distribution) when linux is =
booting or=20
rebooting.</FONT></DIV>
<DIV><FONT size=3D2>If I log into system and executing this script =
manually is=20
everything OK !</FONT></DIV>
<DIV><FONT size=3D2>What is wrong ?</FONT>&nbsp;</DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>best regards</FONT></DIV>
<DIV><FONT size=3D2>Andrew Kozak</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV>&gt; Rebuild iptables userspace using the patched kernel for the=20
headers.<BR>&gt;<BR>&gt; Phil Oester<BR>&gt;<BR>&gt; On Wed, Oct 15, =
2003 at=20
03:46:49PM +0200, Andrzej Kozak wrote:<BR>&gt; &gt; Hello!<BR>&gt; &gt; =
When I=20
patched my 2.4.22 kernel with pptp-conntrack-nat -DNAT and -SNAT<BR>is =
broken if=20
I use iptables with -t nat<BR>&gt; &gt; I get message: iptables: Invalid =

argument<BR>&gt; &gt; Iptables v. 1.2.8<BR>&gt; &gt; I need establish =
connect=20
from my security network to outside VPN server.<BR>&gt; &gt;<BR>&gt; =
&gt; best=20
regards<BR>&gt; &gt;<BR>&gt; &gt; Andrew Kozak<BR></DIV></BODY></HTML>

------=_NextPart_000_0022_01C398CB.BDF8FB60--


