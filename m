From: "Regalado, Ron" <Ron.Regalado@mci.com>
Subject: RE: Trouble with PPTP
Date: Wed, 22 Oct 2003 19:06:11 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E26ABBCB14D369428125D23DF8BE94E52CD0BD@DGEXCH06.mcilink.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="Boundary_(ID_923WML6oKDcJnn2MOO+LAQ)"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-return: allowed
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: 'Fernando Barrocal' <fbarrocal@uol.com.br>, Andrzej Kozak <kozak@manager.ae.wroc.pl>, kernel@linuxace.com
Cc: netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--Boundary_(ID_923WML6oKDcJnn2MOO+LAQ)
Content-type: text/plain; CHARSET=us-ascii

 
Should I use the rpm package from Redhat or compile the package from
netfilter.org?

 
  _____  

From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Fernando Barrocal
Sent: Wednesday, October 22, 2003 12:23 PM
To: Andrzej Kozak; kernel@linuxace.com
Cc: netfilter@lists.netfilter.org
Subject: Re: Trouble with PPTP



You will need to compile iptables after the kernel then reboot

--
F.Barrocal

At 14:38 22/10/2003, Andrzej Kozak wrote:


Thanks Phil,
Is better but not excellent.
After when I :
Patched kernel (pptp-conntrack-nat from p-o-m)
Recompiled iptables v 1.2.8
Recompiled kernel
i get the same message: iptables: Invalid argument
but only if firewall script is automated executing from
/etc/rc.boot/firewallscript (DEBIAN 3.0 distribution) when linux is booting
or rebooting.
If I log into system and executing this script manually is everything OK !
What is wrong ? 
 
best regards
Andrew Kozak
 
 
> Rebuild iptables userspace using the patched kernel for the headers.
>
> Phil Oester
>
> On Wed, Oct 15, 2003 at 03:46:49PM +0200, Andrzej Kozak wrote:
> > Hello!
> > When I patched my 2.4.22 kernel with pptp-conntrack-nat -DNAT and -SNAT
is broken if I use iptables with -t nat
> > I get message: iptables: Invalid argument
> > Iptables v. 1.2.8
> > I need establish connect from my security network to outside VPN server.
> >
> > best regards
> >
> > Andrew Kozak



--Boundary_(ID_923WML6oKDcJnn2MOO+LAQ)
Content-type: text/html; CHARSET=us-ascii
Content-transfer-encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">


<META content=3D"MSHTML 6.00.2800.1264" name=3DGENERATOR></HEAD>
<BODY>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff=20
size=3D2></FONT>&nbsp;</DIV>
<DIV><SPAN class=3D704240519-22102003></SPAN><FONT face=3DArial><FONT=20
color=3D#0000ff><FONT=20
size=3D2>Should&nbsp;I&nbsp;use&nbsp;the&nbsp;rpm&nbsp;package&nbsp;from=
&nbsp;Redhat&nbsp;or&nbsp;compile&nbsp;the&nbsp;package&nbsp;from&nbsp;n=
etfilter.org?</FONT></FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT color=3D#0000ff><FONT size=3D2><SPAN=20
class=3D704240519-22102003></SPAN></FONT></FONT></FONT><BR>&nbsp;</DIV>
<DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr align=3Dleft>
<HR tabIndex=3D-1>
<FONT face=3DTahoma size=3D2><B>From:</B> =
netfilter-admin@lists.netfilter.org=20
[mailto:netfilter-admin@lists.netfilter.org] <B>On Behalf Of =
</B>Fernando=20
Barrocal<BR><B>Sent:</B> Wednesday, October 22, 2003 12:23 =
PM<BR><B>To:</B>=20
Andrzej Kozak; kernel@linuxace.com<BR><B>Cc:</B>=20
netfilter@lists.netfilter.org<BR><B>Subject:</B> Re: Trouble with=20
PPTP<BR></FONT><BR></DIV>
<DIV></DIV><BR>You will need to compile iptables after the kernel then=20
reboot<BR><BR>--<BR>F.Barrocal<BR><BR>At 14:38 22/10/2003, Andrzej =
Kozak=20
wrote:<BR>
<BLOCKQUOTE class=3Dcite cite=3D"" type=3D"cite"><FONT size=3D2>Thanks =
Phil,<BR>Is=20
  better but not excellent.<BR>After when I :<BR>Patched kernel=20
  (pptp-conntrack-nat from p-o-m)<BR>Recompiled iptables v =
1.2.8<BR>Recompiled=20
  kernel<BR>i get the same message: iptables: Invalid argument<BR>but =
only if=20
  firewall script is automated executing from =
/etc/rc.boot/firewallscript=20
  (DEBIAN 3.0 distribution) when linux is booting or rebooting.<BR>If I =
log into=20
  system and executing this script manually is everything OK !<BR>What =
is wrong=20
  ?</FONT> <BR>&nbsp;<BR><FONT size=3D2>best regards<BR>Andrew=20
  Kozak<BR></FONT>&nbsp;<BR>&nbsp;<BR>&gt; Rebuild iptables userspace =
using the=20
  patched kernel for the headers.<BR>&gt;<BR>&gt; Phil =
Oester<BR>&gt;<BR>&gt; On=20
  Wed, Oct 15, 2003 at 03:46:49PM +0200, Andrzej Kozak wrote:<BR>&gt; =
&gt;=20
  Hello!<BR>&gt; &gt; When I patched my 2.4.22 kernel with =
pptp-conntrack-nat=20
  -DNAT and -SNAT<BR>is broken if I use iptables with -t nat<BR>&gt; =
&gt; I get=20
  message: iptables: Invalid argument<BR>&gt; &gt; Iptables v. =
1.2.8<BR>&gt;=20
  &gt; I need establish connect from my security network to outside VPN =

  server.<BR>&gt; &gt;<BR>&gt; &gt; best regards<BR>&gt; &gt;<BR>&gt; =
&gt;=20
  Andrew Kozak</BLOCKQUOTE><BR></BODY></HTML>

--Boundary_(ID_923WML6oKDcJnn2MOO+LAQ)--

