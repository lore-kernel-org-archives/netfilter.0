From: "Aniel Birdja" <abirdja@yahoo.com>
Subject: Help!!  Iptables 1.2.7a: Make Error 1 at ip6t_mark.h
Date: Thu, 19 Sep 2002 00:38:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001501c25f64$0da54b20$4be8f70c@attbi.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0012_01C25F74.D0DA2EC0"
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

------=_NextPart_000_0012_01C25F74.D0DA2EC0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Just installed a new LFS system with 2.4.19 kernel.=20
But encounter problems when making iptables 1.2.7a:

During making dependencies Make exits with the following error:

Something wrong ... deleting dependencies
make: *** [ /usr/src/linux/include/linux/netfilter_ipv6/ip6t_mark.h] =
Error 1

When looking this file up it doesn't exist.=20
But there is a file =
/usr/src/linux/include/linux/netfilter_ipv6/ip6t_MARK.h

Kernel is compiled with patches of patch-o-matic20020825. However 2 =
patches=20
failed during patch process:
- Tos-oops-fix.patch
- ip-conntrack_protocol_destroy.patch

The following option is compiled into the kernel:
CONFIG_NETFILTER=3Dy

Any ideas for the iptables and POM error?

Cheers,
Anil

------=_NextPart_000_0012_01C25F74.D0DA2EC0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2715.400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Just installed a new LFS system with =
2.4.19 kernel.=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>But encounter problems when making =
iptables=20
1.2.7a:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>During making&nbsp;dependencies Make =
exits with the=20
following error:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Something wrong ... deleting=20
dependencies</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>make: *** [=20
/usr/src/linux/include/linux/netfilter_ipv6/ip6t_mark.h] Error =
1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>When looking this file up it doesn't =
exist.=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>But there is a file=20
/usr/src/linux/include/linux/netfilter_ipv6/ip6t_MARK.h</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Kernel is compiled with patches of=20
patch-o-matic20020825. However 2 patches </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>failed during patch =
process:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>- Tos-oops-fix.patch</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>- =
ip-conntrack_protocol_destroy.patch</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The following option&nbsp;is compiled =
into the=20
kernel:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>CONFIG_NETFILTER=3Dy</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Any ideas for the iptables and POM=20
error?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Cheers,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Anil</FONT></DIV></BODY></HTML>

------=_NextPart_000_0012_01C25F74.D0DA2EC0--


