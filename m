From: "Riho Randla" <riho@hot.ee>
Subject: Patch-o-matic newnat question
Date: Thu, 19 Sep 2002 11:54:39 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00e401c25fba$30214e00$6300a8c0@VAIO>
References: <001501c25f64$0da54b20$4be8f70c@attbi.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00E1_01C25FD3.552CC210"
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

------=_NextPart_000_00E1_01C25FD3.552CC210
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I have to get to work pptp masquerading for multiple simultaneous vpn =
connections for w2k clients behind the iptables-firewall to a vpn server =
on the Internet. The latest patch allowing vpn connections from behind a =
nated firewall at all is netfilter_pptp_patch_2.4.19_rev1 by Brian =
Kuschak, and it works great but only for one connection at the same time =
to the same server (because of lack of the pptp Call ID support?). As I =
understood, the z-newnat16.patch would solve the problem, but I have not =
been able to apply this patch. Someone wrote in the list he could not do =
it neither. Is the problem related to the kernel version (the status =
says it's submitted for 2.4.20-pre1 but I use 2.4.19)? I have heard that =
someone tried to appliy the patch to the 2.4.20-pre7 had no success, =
too. How it could be done, and would it solve my problem at all?

Another question: I cannot supply some patches I could with an older =
kernel (2.4.18-3), ip_conntrack_protocol_destroy.patch and =
config-cleanup.patch
for example. Have someone met the same behavior? Without the =
ip_conntrack-staff  the nat-pptp would not work as module, would it?

Riho

------=_NextPart_000_00E1_01C25FD3.552CC210
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2716.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have to get to work pptp masquerading =
for=20
multiple simultaneous vpn connections for w2k clients behind the=20
iptables-firewall to a vpn server on the Internet. The latest patch =
allowing vpn=20
connections from behind a nated firewall at all is=20
netfilter_pptp_patch_2.4.19_rev1 by <FONT face=3D"Times New Roman" =
size=3D3>Brian=20
Kuschak, and it works great but only for one connection at the same time =
to the=20
same server (because of lack of the pptp Call ID support?). As I =
understood, the=20
z-newnat16.patch would solve the problem, but I have not been able to =
apply this=20
patch. Someone wrote in the list he could not do it neither. Is the =
problem=20
related to the kernel version (the status says it's submitted for =
2.4.20-pre1=20
but I use 2.4.19)? I have heard that someone tried to appliy the patch =
to the=20
2.4.20-pre7 had no success, too. How it could be done, and would it =
solve my=20
problem at all?</FONT></FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Another question: I cannot supply some =
patches I=20
could with&nbsp;an older kernel (2.4.18-3), <FONT face=3D"Times New =
Roman"=20
size=3D3>ip_conntrack_protocol_destroy.patch and =
config-cleanup.patch<BR><FONT=20
face=3DArial size=3D2>for example. Have someone met the same behavior? =
Without the=20
ip_conntrack-staff&nbsp; the nat-pptp would not work as module, would=20
it?</FONT></FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Riho</FONT></DIV></BODY></HTML>

------=_NextPart_000_00E1_01C25FD3.552CC210--


