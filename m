From: "Luigi Cartuccia" <luigicart@tin.it>
Subject: Re: ping with netfilter
Date: Tue, 2 Jul 2002 11:29:20 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <000b01c221aa$f3276f40$31d9abd4@q8c7l5>
References: <200FAA488DE0D41194F10010B597610D2BA1C3@JUPITER>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0008_01C221BB.B5608DC0"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: George Vieira <GeorgeV@citadelcomputer.com.au>
Cc: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_0008_01C221BB.B5608DC0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thank you for the answer.The problem is :the writer of the software DSR =
has used linux-2.4.3.There are difference between linux-2.4.3 and =
linux-2.4.4,5,6,7.... about fragmentation of the IP datagram therefore I =
must used linux-2.4.3 or I must changed the software.
I have seen that in my linux-2.4.7 in =
/usr/src/linux-2.4.7/include/linux/ipv4/netfilter_ipv4 there are =
ip_conntrck_icmp.h,ip_conntrack_irc.h and in linux-2.4.3 there aren't =
it.
Is this the problem?
If you want I send to you the software
Thank you very much
Luigi
  ----- Original Message -----=20
  From: George Vieira=20
  To: 'Luigi Cartuccia' ; netfilter@lists.samba.org=20
  Sent: Tuesday, July 02, 2002 12:08 AM
  Subject: RE: ping with netfilter


  Firstly we don't have a magic wond so sending us a copy of your rules =
would help...
  Secondly are you logging anything at all? Is there any logs of DROPped =
packets?
  =20
  Also is the kernel dual boot with multiple kenel versions? Why are you =
reverting back to the old kernel. Your iptables is probably =
compiled/configured for the new kernel.
  I have a problem where I've reverted back to an old kernel because my =
boot for the new one got corrupted and now I have untracked packet drops =
which I know it's because I've gone back to an old kernel...
  =20
  We need more information.
  thanks,
  George Vieira
  Systems Manager
  Citadel Computer Systems P/L
  http://www.citadelcomputer.com.au

  -----Original Message-----
  From: Luigi Cartuccia [mailto:luigicart@tin.it]
  Sent: Tuesday, 02 July 2002 3:10 AM
  To: netfilter@lists.samba.org
  Subject: ping with netfilter


  Hi to all I'm Luigi.I have recompiled linux-2.4.3 and I set some =
netfilter options.I have installed software for multi-hop for wireless =
that use netfilter.
  With 2.4.3 and the software the ping is not ok,
  istead with my old kernel 2.4.7 and the software the ping is ok.
  This is a netfilter problem.
  Can you help me??
  What I set in the make xconfig for netfilter ???
  Thank you=20
  Luigi



------=_NextPart_000_0008_01C221BB.B5608DC0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2919.6307" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Thank you for the answer.The problem is =
:the writer=20
of the software DSR has used linux-2.4.3.There are difference between=20
linux-2.4.3 and linux-2.4.4,5,6,7.... about fragmentation of the IP =
datagram=20
therefore I must used linux-2.4.3 or I must changed the =
software.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I have seen that in my linux-2.4.7 in=20
/usr/src/linux-2.4.7/include/linux/ipv4/netfilter_ipv4 there are=20
ip_conntrck_icmp.h,ip_conntrack_irc.h and in linux-2.4.3 there aren't=20
it.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Is this the problem?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>If you want I send to you the =
software</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Thank you very much</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Luigi</FONT></DIV>
<BLOCKQUOTE=20
style=3D"BORDER-LEFT: #000000 2px solid; MARGIN-LEFT: 5px; MARGIN-RIGHT: =
0px; PADDING-LEFT: 5px; PADDING-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A href=3D"mailto:GeorgeV@citadelcomputer.com.au"=20
  title=3DGeorgeV@citadelcomputer.com.au>George Vieira</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A =
href=3D"mailto:luigicart@tin.it"=20
  title=3Dluigicart@tin.it>'Luigi Cartuccia'</A> ; <A=20
  href=3D"mailto:netfilter@lists.samba.org"=20
  title=3Dnetfilter@lists.samba.org>netfilter@lists.samba.org</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Tuesday, July 02, 2002 =
12:08=20
  AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> RE: ping with =
netfilter</DIV>
  <DIV><BR></DIV>
  <DIV><SPAN class=3D368070622-01072002><FONT color=3D#0000ff =
face=3DArial=20
  size=3D2>Firstly we don't have a magic wond so sending us a copy of =
your rules=20
  would help...</FONT></SPAN></DIV>
  <DIV><SPAN class=3D368070622-01072002><FONT color=3D#0000ff =
face=3DArial=20
  size=3D2>Secondly are you logging anything at all? Is there any logs =
of DROPped=20
  packets?</FONT></SPAN></DIV>
  <DIV><SPAN class=3D368070622-01072002><FONT color=3D#0000ff =
face=3DArial=20
  size=3D2></FONT></SPAN>&nbsp;</DIV>
  <DIV><SPAN class=3D368070622-01072002><FONT color=3D#0000ff =
face=3DArial=20
  size=3D2>Also&nbsp;is the kernel dual boot with multiple kenel =
versions? Why are=20
  you reverting back to the old kernel. Your iptables is probably=20
  compiled/configured for the new kernel.</FONT></SPAN></DIV>
  <DIV><SPAN class=3D368070622-01072002><FONT color=3D#0000ff =
face=3DArial size=3D2>I=20
  have a problem where I've reverted back to an old kernel because my =
boot for=20
  the new one got corrupted and now I have untracked packet drops which =
I know=20
  it's because I've gone back to an old kernel...</FONT></SPAN></DIV>
  <DIV><FONT color=3D#0000ff face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><SPAN class=3D368070622-01072002><FONT color=3D#0000ff =
face=3DArial size=3D2>We=20
  need more information.</FONT></SPAN></DIV>
  <P><FONT size=3D2>thanks,<BR>George Vieira<BR>Systems =
Manager<BR>Citadel=20
  Computer Systems P/L<BR><A href=3D"http://www.citadelcomputer.com.au/" =

  target=3D_blank>http://www.citadelcomputer.com.au</A></FONT></P>
  <DIV align=3Dleft class=3DOutlookMessageHeader dir=3Dltr><FONT =
face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B> Luigi Cartuccia=20
  [mailto:luigicart@tin.it]<BR><B>Sent:</B> Tuesday, 02 July 2002 3:10=20
  AM<BR><B>To:</B> netfilter@lists.samba.org<BR><B>Subject:</B> ping =
with=20
  netfilter<BR><BR></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>Hi to all I'm Luigi.I have recompiled =
linux-2.4.3=20
  and I set some netfilter options.I have installed software for =
multi-hop for=20
  wireless that use netfilter.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>With 2.4.3 and the software the ping =
is not=20
  ok,</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>istead with my old kernel 2.4.7 and =
the software=20
  the ping is ok.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>This is a netfilter =
problem.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>Can you help me??</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>What I set in the make xconfig for =
netfilter=20
  ???</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>Thank you </FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>Luigi</FONT></DIV>
  <DIV>&nbsp;</DIV>
  <DIV>&nbsp;</DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0008_01C221BB.B5608DC0--


