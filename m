From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: masquerading
Date: Thu, 11 Sep 2003 22:04:29 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LFEHKEBEBHAFGJBMNKAOEEOPCAAA.markee@bandwidthco.com>
References: <20030912020957.81068.qmail@web41109.mail.yahoo.com>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0002_01C378B0.AC815480"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030912020957.81068.qmail@web41109.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Wendy Moore <wenmoore@yahoo.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0002_01C378B0.AC815480
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

This appears to be a classic case of ICMP type 3 code 0 packets being
dropped by your ISP.  Some web sites are working for you because the packets
are getting there, and the server's return packets are getting back to you
just fine.  The sites that appear to be "hanging" are probably due to the DF
packets being dropped because either a reduced MTU or fragmentation is
needed.  However, if the ICMP Path MTU messages are being dropped, your
system is not aware of this.  Add this rule to your script and see if your
problem corrects itself:

$IPT -t filter -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j
TCPMSS --clamp-mss-to-pmtu.

Since all of your default policies are set to ACCEPT and you are going out a
ppp0 interface, I'll be shocked to find this is not the problem based on the
information you have supplied.


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Wendy Moore
Sent: Thursday, September 11, 2003 7:10 PM
To: netfilter@lists.netfilter.org
Subject: masquerading


  Hi All,

  I want to setup a internet gateway/firewall for my local network by using
iptables:
  iptables --table nat --append POSTROUTING --out-interface ppp0 -j
MASQUERADE

  ip forwarding is enabled,....



  I can browse on a local workstation to eg. www.openldap.org

  (Everything works fine on this site) However other websites do not work
eg. www.shoutcast.com. These sites are online (tested them by browsing on
the FW computer).

  The browser says it is finding the website, but is waiting for a reply?

  Anyone any idea?

  FILTER table

  Chain INPUT (policy ACCEPT)

  target prot opt source destination

  Chain FORWARD (policy ACCEPT)

  target prot opt source destination

  Chain OUTPUT (policy ACCEPT)

  target prot opt source destination



  NAT table:

  Chain PREROUTING (policy ACCEPT)

  target prot opt source destination

  Chain POSTROUTING (policy ACCEPT)

  target prot opt source destination

  MASQUERADE all -- anywhere anywhere

  Chain OUTPUT (policy ACCEPT)

  target prot opt source destination



  Chain PREROUTING (policy ACCEPT)

  target prot opt source destination

  Chain INPUT (policy ACCEPT)

  target prot opt source destination

  Chain FORWARD (policy ACCEPT)

  target prot opt source destination

  Chain OUTPUT (policy ACCEPT)

  target prot opt source destination

  Chain POSTROUTING (policy ACCEPT)

  target prot opt source destination



----------------------------------------------------------------------------
--
  Do you Yahoo!?
  Yahoo! SiteBuilder - Free, easy-to-use web site design software

------=_NextPart_000_0002_01C378B0.AC815480
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D493144604-12092003><FONT face=3DArial color=3D#0000ff =
size=3D2>This=20
appears to be a classic case of ICMP type 3 code 0 packets being dropped =
by your=20
ISP.&nbsp; Some web sites are working for you because the packets are =
getting=20
there, and the server's return packets are getting back to you just =
fine.=20
&nbsp;The sites that appear to be "hanging" are probably due to the DF =
packets=20
being dropped because either a reduced MTU or fragmentation is =
needed.&nbsp;=20
However, if the ICMP Path MTU messages are being dropped, your system is =
not=20
aware of this.&nbsp; Add this rule to your script and see if your =
problem=20
corrects itself:</FONT></SPAN></DIV>
<DIV><SPAN class=3D493144604-12092003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D493144604-12092003><FONT face=3DArial color=3D#0000ff =
size=3D2>$IPT=20
-t filter -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS=20
--clamp-mss-to-pmtu.</FONT></SPAN></DIV>
<DIV><SPAN class=3D493144604-12092003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D493144604-12092003><FONT face=3DArial color=3D#0000ff =
size=3D2>Since=20
all of your default policies are set to ACCEPT and you are going out a =
ppp0=20
interface, I'll be shocked to find this is not the problem based on the=20
information you have supplied.</FONT></SPAN></DIV>
<DIV><SPAN class=3D493144604-12092003></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D493144604-12092003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><FONT face=3DTahoma size=3D2>-----Original =
Message-----<BR><B>From:</B>=20
netfilter-admin@lists.netfilter.org=20
[mailto:netfilter-admin@lists.netfilter.org]<B>On Behalf Of </B>Wendy=20
Moore<BR><B>Sent:</B> Thursday, September 11, 2003 7:10 PM<BR><B>To:</B> =

netfilter@lists.netfilter.org<BR><B>Subject:</B>=20
masquerading<BR><BR></FONT></DIV>
<BLOCKQUOTE>
  <DIV>Hi All,</DIV>
  <DIV>&nbsp;</DIV>
  <DIV>I want to setup a internet gateway/firewall for my local network =
by using=20
  iptables:</DIV>
  <DIV><FONT size=3D2>
  <P>iptables --table nat --append POSTROUTING --out-interface ppp0 -j=20
  MASQUERADE</P>
  <P>ip forwarding is enabled,....</P>
  <P>&nbsp;</P>
  <P>I can browse&nbsp;on a local workstation to eg. <A=20
  href=3D"http://www.openldap.org">www.openldap.org</A></P>
  <P>(Everything works fine on this site) However other websites do not =
work eg.=20
  <A href=3D"http://www.shoutcast.com">www.shoutcast.com</A>. These =
sites are=20
  online (tested them by browsing on the FW computer). </P>
  <P>The browser says it is finding the website, but is waiting for a =
reply?</P>
  <P>Anyone any idea?</P>
  <P>FILTER table</P><FONT size=3D2>
  <P>Chain INPUT (policy ACCEPT)</P>
  <P>target prot opt source destination </P>
  <P>Chain FORWARD (policy ACCEPT)</P>
  <P>target prot opt source destination </P>
  <P>Chain OUTPUT (policy ACCEPT)</P>
  <P>target prot opt source destination </P>
  <P>&nbsp;</P>
  <P>NAT table:</P><FONT size=3D2>
  <P>Chain PREROUTING (policy ACCEPT)</P>
  <P>target prot opt source destination </P>
  <P>Chain POSTROUTING (policy ACCEPT)</P>
  <P>target prot opt source destination </P>
  <P>MASQUERADE all -- anywhere anywhere </P>
  <P>Chain OUTPUT (policy ACCEPT)</P>
  <P>target prot opt source destination </P>
  <P>&nbsp;</P><FONT size=3D2>
  <P>Chain PREROUTING (policy ACCEPT)</P>
  <P>target prot opt source destination </P>
  <P>Chain INPUT (policy ACCEPT)</P>
  <P>target prot opt source destination </P>
  <P>Chain FORWARD (policy ACCEPT)</P>
  <P>target prot opt source destination </P>
  <P>Chain OUTPUT (policy ACCEPT)</P>
  <P>target prot opt source destination </P>
  <P>Chain POSTROUTING (policy ACCEPT)</P>
  <P>target prot opt source destination =
</P></FONT></FONT></FONT></FONT></DIV>
  <P>
  <HR SIZE=3D1>
  Do you Yahoo!?<BR><A=20
  =
href=3D"http://us.rd.yahoo.com/evt=3D10469/*http://sitebuilder.yahoo.com"=
>Yahoo!=20
  SiteBuilder</A> - Free, easy-to-use web site design=20
software</BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0002_01C378B0.AC815480--



