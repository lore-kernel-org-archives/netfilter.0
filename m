From: "Diego Sarasua" <debian@sarasuasys.com.ar>
Subject: Netfilter and pptp kernel package for distribution
Date: Thu, 13 Feb 2003 11:07:39 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005e01c2d369$4c84beb0$6400a8c0@diego>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0059_01C2D350.1F843E40"
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

------=_NextPart_000_0059_01C2D350.1F843E40
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

hi , im trying tom make an kernel build with pptp support i have made =
the kernel package , with=20
make-kpkg clean
make-kpkg --revision=3Dcustom.1.0 kernel_image

an it givme an kernel-image-2.4.20_custom.1.0_i386.deb=20
the problem is this :
wen i install the kernel the iptables shome an error message
like unknown version or wrong version.
i know that all kernel patchs for h323 ppt etc needs to have iptables =
1.2.7a
but when i compile the k-pkg and install it it doesn=B4t install the new =
iptables , the question is :
how can i do to create an iptables package wich i can install next to my =
kernel package?
my intention is to create a working kernel package with an iptables =
package to solve a lot of people problems in gatewas and firewalls who =
has to make pptp h323 talk etc etc etc .-
and to publicate this kernel package to anyone can download.
thanks a lot for your time
and please forgive my very bad english
Diego

------=_NextPart_000_0059_01C2D350.1F843E40
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2723.2500" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>hi , im trying tom make an kernel build =
with pptp=20
support </FONT><FONT face=3DArial size=3D2>i have made the kernel =
package , with=20
<DIV><FONT face=3DArial size=3D2>make-kpkg clean</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>make-kpkg --revision=3Dcustom.1.0=20
kernel_image</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>an it givme an kernel-image-2.4.20_custom.1.0_i386.deb </DIV>
<DIV>the problem is this :</DIV>
<DIV>wen i install the kernel the iptables shome an error message</DIV>
<DIV>like unknown version or wrong version.</DIV>
<DIV>i know that all kernel patchs for h323 ppt etc needs to have =
iptables=20
1.2.7a</DIV>
<DIV>but when i compile the k-pkg and install it it doesn=B4t install =
the new=20
iptables , the question is :</DIV>
<DIV>how can i do to create an iptables package wich i can install next =
to my=20
kernel package?</DIV>
<DIV>my intention is to create a working kernel package with an iptables =
package=20
to solve a lot of people problems in gatewas and firewalls who has to =
make pptp=20
h323 talk etc etc etc .-</DIV>
<DIV>and to publicate this kernel package to anyone can download.</DIV>
<DIV>thanks a lot for your time</DIV>
<DIV>and please forgive my very bad english</DIV>
<DIV>Diego</DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_0059_01C2D350.1F843E40--


