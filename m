From: "Jon Pol" <john@pinoylinux.sytes.net>
Subject: Re: patch: ipt_string
Date: Sat, 23 Aug 2003 17:29:06 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <050301c36959$000acee0$61000a0a@expi>
References: <006c01c36952$fe6a4d00$e800a8c0@tecnico>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0500_01C3699C.0DC49EB0"
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
To: =?iso-8859-1?Q?Juli=E1n_Mar=EDa_M=FCller_Frizza?= <julian_muller@speedy.com.ar>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0500_01C3699C.0DC49EB0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks but still no success.

I have patched my kernel with ipt_string, recompile the kernel but =
ipt_string is still not there. below are the files generated after =
successfully rebuilding the kernel.

# KERNEL_DIR=3D/usr/local/linux  ./runme extra

there are the files installed but not "ipt_string.o". any advise???

[root@mail netfilter]# pwd
/lib/modules/2.4.20/kernel/net/ipv4/netfilter
[root@mail netfilter]# ls
arptable_filter.o      ip_conntrack_pptp.o       ip_nat_irc.o        =
iptable_nat.o    ipt_ECN.o          ipt_mark.o        ipt_REJECT.o
arp_tables.o           ip_conntrack_proto_gre.o  ip_nat_mms.o        =
ip_tables.o      ipt_esp.o          ipt_MARK.o        ipt_ROUTE.o
ipchains.o             ip_conntrack_quake3.o     ip_nat_pptp.o       =
ipt_ah.o         ipt_helper.o       ipt_MASQUERADE.o  ipt_state.o
ip_conntrack_amanda.o  ip_conntrack_talk.o       ip_nat_proto_gre.o  =
ipt_connmark.o   ipt_iplimit.o      ipt_mport.o       ipt_tcpmss.o
ip_conntrack_ftp.o     ip_conntrack_tftp.o       ip_nat_quake3.o     =
ipt_CONNMARK.o   ipt_ipv4options.o  ipt_multiport.o   ipt_TCPMSS.o
ip_conntrack_h323.o    ipfwadm.o                 ip_nat_talk.o       =
ipt_conntrack.o  ipt_length.o       ipt_NETMAP.o      ipt_tos.o
ip_conntrack_irc.o     ip_nat_amanda.o           ip_nat_tftp.o       =
ipt_dscp.o       ipt_limit.o        ipt_pkttype.o     ipt_TOS.o
ip_conntrack_mms.o     ip_nat_ftp.o              iptable_filter.o    =
ipt_DSCP.o       ipt_LOG.o          ipt_quota.o       ipt_ttl.o
ip_conntrack.o         ip_nat_h323.o             iptable_mangle.o    =
ipt_ecn.o        ipt_mac.o          ipt_REDIRECT.o    ipt_ULOG.o
[root@mail netfilter]#

  ----- Original Message -----=20
  From: Juli=E1n Mar=EDa M=FCller Frizza=20
  To: netfilter@lists.netfilter.org=20
  Sent: Saturday, August 23, 2003 4:46 PM
  Subject: Re: patch: ipt_string


  After compiling kernel, did u do this in with iptables?

  make && make install

  Like that, after compiling kernel with the new patch-o-matic patch =
applied, iptables will recognice (built) new libraries

  If u did, make sure to copy the librarys (.so) from =
/usr/local/lib/netfilter to /lib/netfilter

  and try :)

------=_NextPart_000_0500_01C3699C.0DC49EB0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2726.2500" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Thanks but still no =
success.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have patched my kernel with =
ipt_string, recompile=20
the kernel&nbsp;but ipt_string is still not there. below are the files =
generated=20
after successfully rebuilding the kernel.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># KERNEL_DIR=3D/usr/local/linux&nbsp; =
./runme=20
extra</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>there are the files installed but not=20
"ipt_string.o". any advise???</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>[root@mail netfilter]#=20
pwd<BR>/lib/modules/2.4.20/kernel/net/ipv4/netfilter<BR>[root@mail =
netfilter]#=20
ls<BR>arptable_filter.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ip_conntrack_pptp.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ip_nat_irc.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
iptable_nat.o&nbsp;&nbsp;&nbsp;=20
ipt_ECN.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ipt_mark.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ipt_REJECT.o<BR>arp_tables.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
ip_conntrack_proto_gre.o&nbsp;=20
ip_nat_mms.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ip_tables.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ipt_esp.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ipt_MARK.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ipt_ROUTE.o<BR>ipchains.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;=20
ip_conntrack_quake3.o&nbsp;&nbsp;&nbsp;&nbsp;=20
ip_nat_pptp.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ipt_ah.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ipt_helper.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ipt_MASQUERADE.o&nbsp;=20
ipt_state.o<BR>ip_conntrack_amanda.o&nbsp;=20
ip_conntrack_talk.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
ip_nat_proto_gre.o&nbsp;=20
ipt_connmark.o&nbsp;&nbsp; ipt_iplimit.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ipt_mport.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ipt_tcpmss.o<BR>ip_conntrack_ftp.o&nbsp;&nbsp;&nbsp;&nbsp;=20
ip_conntrack_tftp.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ip_nat_quake3.o&nbsp;&nbsp;&nbsp;&nbsp; ipt_CONNMARK.o&nbsp;&nbsp;=20
ipt_ipv4options.o&nbsp; ipt_multiport.o&nbsp;&nbsp;=20
ipt_TCPMSS.o<BR>ip_conntrack_h323.o&nbsp;&nbsp;&nbsp;=20
ipfwadm.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ip_nat_talk.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ipt_conntrack.o&nbsp;=20
ipt_length.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ipt_NETMAP.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ipt_tos.o<BR>ip_conntrack_irc.o&nbsp;&nbsp;&nbsp;&nbsp;=20
ip_nat_amanda.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
ip_nat_tftp.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ipt_dscp.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ipt_limit.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ipt_pkttype.o&nbsp;&nbsp;&nbsp;&nbsp;=20
ipt_TOS.o<BR>ip_conntrack_mms.o&nbsp;&nbsp;&nbsp;&nbsp;=20
ip_nat_ftp.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
iptable_filter.o&nbsp;&nbsp;&nbsp;=20
ipt_DSCP.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ipt_LOG.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ipt_quota.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ipt_ttl.o<BR>ip_conntrack.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
ip_nat_h323.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;=20
iptable_mangle.o&nbsp;&nbsp;&nbsp;=20
ipt_ecn.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ipt_mac.o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ipt_REDIRECT.o&nbsp;&nbsp;&nbsp; ipt_ULOG.o<BR>[root@mail=20
netfilter]#<BR></FONT></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Djulian_muller@speedy.com.ar=20
  href=3D"mailto:julian_muller@speedy.com.ar">Juli=E1n Mar=EDa M=FCller =
Frizza</A>=20
</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Saturday, August 23, 2003 =
4:46=20
  PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> Re: patch: =
ipt_string</DIV>
  <DIV><BR></DIV>
  <DIV><FONT face=3DArial size=3D2>After compiling kernel, did u do this =
in with=20
  iptables?</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>make &amp;&amp; make =
install</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Like that, after compiling kernel =
with the new=20
  patch-o-matic patch applied, iptables will recognice (built) new=20
  libraries</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>If u did, make sure to copy the =
librarys (.so)=20
  from /usr/local/lib/netfilter to /lib/netfilter</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>and try =
:)</FONT></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0500_01C3699C.0DC49EB0--


