From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: RedHat 9: Bridging Firewall
Date: Fri, 7 Nov 2003 12:08:58 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LFEHKEBEBHAFGJBMNKAOCEGJCEAA.markee@bandwidthco.com>
References: <20031103154202.22422.qmail@web41905.mail.yahoo.com>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0012_01C3A527.EC477740"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031103154202.22422.qmail@web41905.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: marcus earle <mowtnman@yahoo.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0012_01C3A527.EC477740
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

There are numerous good whitepapers on setting up bridging in Linux.  I'll
direct toward a few of them:

http://bridge.sourceforge.net/docs/Firewalling%20for%20Free.pdf

http://www.spenneberg.com/talks/linux-kongress2002/ralf-spenneberg.bridgewal
l.pdf

http://ebtables.sourceforge.net/

http://www.linuxgazette.com/issue76/whitmarsh.html


  -----Original Message-----
  From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of marcus earle
  Sent: Monday, November 03, 2003 7:42 AM
  To: netfilter@lists.netfilter.org
  Subject: RedHat 9: Bridging Firewall


  I am trying to build a Firewall using RedHat 9 (Kernel 2.4.20-8) with both
of my interfaces in a bridging mode - neither interface being assigned an IP
address.
  This is exactly how on a honeypot would function. But there is definately
a difference between the theory of a Honeypot and actually implementing one
and getting it to function properly...

  Since I am fairly new to the Linux OS, it is a  little bit harder to know
where to look to get the info I need and where to make the proper changes in
the OS...
  My understanding is that RH9 has the firewalling functions built in, but I
am not sure what I need to do in order to make it bridge , or how/where to
apply the ruleset.

  Does anyone know how to do this?

  Thanks, is advance for any input


----------------------------------------------------------------------------
--
  Do you Yahoo!?
  Exclusive Video Premiere - Britney Spears

------=_NextPart_000_0012_01C3A527.EC477740
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2800.1264" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D941500320-07112003><FONT face=3DArial color=3D#0000ff =
size=3D2>There=20
are numerous good whitepapers on setting up bridging in Linux.&nbsp; =
I'll direct=20
toward a few of them:</FONT></SPAN></DIV>
<DIV><SPAN class=3D941500320-07112003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D941500320-07112003><FONT face=3DArial color=3D#0000ff =
size=3D2><A=20
href=3D"http://bridge.sourceforge.net/docs/Firewalling%20for%20Free.pdf">=
http://bridge.sourceforge.net/docs/Firewalling%20for%20Free.pdf</A></FONT=
></SPAN></DIV>
<DIV><SPAN class=3D941500320-07112003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D941500320-07112003><FONT face=3DArial color=3D#0000ff =
size=3D2><A=20
href=3D"http://www.spenneberg.com/talks/linux-kongress2002/ralf-spenneber=
g.bridgewall.pdf">http://www.spenneberg.com/talks/linux-kongress2002/ralf=
-spenneberg.bridgewall.pdf</A></FONT></SPAN></DIV>
<DIV><SPAN class=3D941500320-07112003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D941500320-07112003><FONT face=3DArial color=3D#0000ff =
size=3D2><A=20
href=3D"http://ebtables.sourceforge.net/">http://ebtables.sourceforge.net=
/</A></FONT></SPAN></DIV>
<DIV><SPAN class=3D941500320-07112003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D941500320-07112003><FONT face=3DArial color=3D#0000ff =
size=3D2><A=20
href=3D"http://www.linuxgazette.com/issue76/whitmarsh.html">http://www.li=
nuxgazette.com/issue76/whitmarsh.html</A></FONT></SPAN></DIV>
<DIV><SPAN class=3D941500320-07112003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D941500320-07112003></SPAN>&nbsp;</DIV>
<BLOCKQUOTE>
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B>=20
  netfilter-admin@lists.netfilter.org=20
  [mailto:netfilter-admin@lists.netfilter.org]<B>On Behalf Of </B>marcus =

  earle<BR><B>Sent:</B> Monday, November 03, 2003 7:42 AM<BR><B>To:</B>=20
  netfilter@lists.netfilter.org<BR><B>Subject:</B> RedHat 9: Bridging=20
  Firewall<BR><BR></FONT></DIV>
  <DIV>I am trying to build a Firewall using RedHat 9 (Kernel 2.4.20-8) =
with=20
  both of my interfaces in a bridging mode - neither interface being =
assigned an=20
  IP address.</DIV>
  <DIV>This is exactly how on a honeypot would function. But there is =
definately=20
  a difference between the theory of a Honeypot and actually =
implementing one=20
  and getting it to function properly...</DIV>
  <DIV>&nbsp;</DIV>
  <DIV>Since I am fairly new to the Linux OS, it is a&nbsp; little bit =
harder to=20
  know where to look to get the info I need and where to make the proper =
changes=20
  in the OS...</DIV>
  <DIV>My understanding is that RH9 has the firewalling functions built =
in, but=20
  I am not sure what I need to do in order to make it bridge , or =
how/where to=20
  apply the ruleset.</DIV>
  <DIV>&nbsp;</DIV>
  <DIV>Does anyone know how to do this?</DIV>
  <DIV>&nbsp;</DIV>
  <DIV>Thanks, is advance for any input</DIV>
  <P>
  <HR SIZE=3D1>
  Do you Yahoo!?<BR>Exclusive Video Premiere - <A=20
  =
href=3D"http://launch.yahoo.com/video/?1093432&amp;fs=3D1&amp;redirectURL=
=3Dhttp://launch.yahoo.com/promos/britneyspears/">Britney=20
  Spears</A></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0012_01C3A527.EC477740--



