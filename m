From: "ying ge" <ying.ge@crc.ca>
Subject: problems -- can't initialize ip6tables table filter
Date: Tue, 24 Feb 2004 18:02:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005e01c3fb2a$49855960$4c225c8e@anik2>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_005B_01C3FB00.60A36A80"
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

------=_NextPart_000_005B_01C3FB00.60A36A80
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello List,

I'm new to the iptables. I just downloaded iptables-1.2.9.tar.bz2, =
compiled and installed it with following:

(I tried to delete the old iptable version with following command before =
install the 1.2.9 version, but failed:
# rpm -q iptables
iptables-1.2.8-13
# rpm -e iptables
error: Failed dependencies: iptables >=3D1.2.8 is needed by (installed) =
readhat-config-securitylevel-tui-1.2.11-1)

# make KERNEL_DIR=3D/usr/src/linux-2.4.22-1.2115.npl
# make install KERNEL_DIR=3D/usr/src/linux-2.4.22-1.2115.npl
# make install-devel
# modprobe ip6_tables

No error message appears.

However, when I use the ip6tables:

# ip6tables -L

I got the following error message:=20

"can't initialize ip6tables table 'filter': Address family not supported =
by protocol
Perhaps iptables or your kernel needs to be upgrades"

The following is my system information:
Platform: Fedora
Kernel version: linux-2.4.22.2115.npl

Would you please tell me what happened?

Best regards

Ying


Ying Ge
Communications Research Centre Canada | Centre de recherches sur les =
communications Canada
3701 Carling Ave. | 3701, avenue Carling
PO Box 11490, Station H | CP 11490, succursale H
Ottawa ON K2H 8S2 | Ottawa (Ontario) K2H 8S2
(613) 998-2819 | ying.ge@crc.ca |=20
Web site / Site web : www.crc.ca
Government of Canada | Gouvernement du Canada
------=_NextPart_000_005B_01C3FB00.60A36A80
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1264" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello List,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I'm new to the iptables. I just =
downloaded=20
iptables-1.2.9.tar.bz2, compiled and installed it with =
following:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>
<DIV><FONT face=3DArial size=3D2>(I tried to delete the old iptable =
version with=20
following command before install the 1.2.9 version, but =
failed:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2># rpm -q iptables</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables-1.2.8-13</FONT></DIV>
<DIV><FONT face=3DArial size=3D2># rpm -e iptables</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>error: Failed dependencies: iptables =
&gt;=3D1.2.8 is=20
needed by (installed)=20
readhat-config-securitylevel-tui-1.2.11-1)</FONT></DIV></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># make=20
KERNEL_DIR=3D/usr/src/linux-2.4.22-1.2115.npl</FONT></DIV>
<DIV><FONT face=3DArial size=3D2># make install=20
KERNEL_DIR=3D/usr/src/linux-2.4.22-1.2115.npl</FONT></DIV>
<DIV><FONT face=3DArial size=3D2># make install-devel</FONT></DIV>
<DIV><FONT face=3DArial size=3D2># modprobe ip6_tables</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>No error message appears.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>However, when I use the =
ip6tables:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># ip6tables -L</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I got the following error message: =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>"can't initialize ip6tables table =
'filter': Address=20
family not supported by protocol</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Perhaps iptables or your kernel needs =
to be=20
upgrades"</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The following is my system=20
information:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Platform: Fedora</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Kernel version: =
linux-2.4.22.2115.npl</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Would you please tell me what=20
happened?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Best regards</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Ying</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Ying Ge<BR>Communications Research =
Centre Canada |=20
Centre de recherches sur les communications Canada<BR>3701 Carling Ave. =
| 3701,=20
avenue Carling<BR>PO Box 11490, Station H | CP 11490, succursale =
H<BR>Ottawa ON=20
K2H 8S2 | Ottawa (Ontario) K2H 8S2<BR>(613) 998-2819 | <A=20
href=3D"mailto:ying.ge@crc.ca">ying.ge@crc.ca</A> | <BR>Web site / Site =
web : <A=20
href=3D"http://www.crc.ca">www.crc.ca</A><BR>Government of Canada | =
Gouvernement=20
du Canada</FONT></DIV></BODY></HTML>

------=_NextPart_000_005B_01C3FB00.60A36A80--


