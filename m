From: "Harry Gold" <hgold@san.rr.com>
Subject: Unresolved symbols in ip_table.o
Date: Sat, 26 Apr 2003 08:22:08 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000d01c30c07$9d49f500$0ff44b42@winxp>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000A_01C30BCC.ED768FB0"
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

------=_NextPart_000_000A_01C30BCC.ED768FB0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I apologize if this problem has been answered before but I did look at =
the last few months but did not see any specific reference to my =
problem.

I am running Red Hat 9 building a custom kernel 2.4.20-9. I received no =
error messages during the build process but when either the kernel =
started or my trying Iptables -L, I get the following messages


/lib/modules/2.4.20-9custom/kernel/net/ipv4/netfilter/ip_tables.o: =
unresolved symbol nf_unregister_sockopt
/lib/modules/2.4.20-9custom/kernel/net/ipv4/netfilter/ip_tables.o: =
unresolved symbol nf_register_sockopt
/lib/modules/2.4.20-9custom/kernel/net/ipv4/netfilter/ip_tables.o:=20
insmod /lib/modules/2.4.20-9custom/kernel/net/ipv4/netfilter/ip_tables.o =
failed
/lib/modules/2.4.20-9custom/kernel/net/ipv4/netfilter/ip_tables.o: =
insmod ip_tables failed
iptables v1.2.8: can't initialize iptables table `filter': iptables who? =
(do you need to insmod?)

Perhaps iptables or your kernel needs to be upgraded.


I have looked at both the .h and .c files for ip_tables but I am not =
sure what I should be looking for to modify to correct the problem. Any =
assistance would be appreciated.

Thanks,

Harry Gold


------=_NextPart_000_000A_01C30BCC.ED768FB0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1170" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I apologize if this problem has been =
answered=20
before but I did look at the last few months but did not see any =
specific=20
reference to my problem.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I am running Red Hat 9 building a =
custom kernel=20
2.4.20-9. I received no error messages during the build process but when =
either=20
the kernel started or my trying Iptables -L, I get the following=20
messages</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>/lib/modules/2.4.20-9custom/kernel/net/ipv4/netfilter/ip_tables.=
o:=20
unresolved symbol=20
nf_unregister_sockopt<BR>/lib/modules/2.4.20-9custom/kernel/net/ipv4/netf=
ilter/ip_tables.o:=20
unresolved symbol=20
nf_register_sockopt<BR>/lib/modules/2.4.20-9custom/kernel/net/ipv4/netfil=
ter/ip_tables.o:=20
<BR>insmod =
/lib/modules/2.4.20-9custom/kernel/net/ipv4/netfilter/ip_tables.o=20
failed</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>/lib/modules/2.4.20-9custom/kernel/net/ipv4/netfilter/ip_tables.=
o: insmod=20
ip_tables failed<BR>iptables v1.2.8: can't initialize iptables table =
`filter':=20
iptables who? (do you need to insmod?)</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Perhaps iptables or your kernel needs =
to be=20
upgraded.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have looked at both the .h and .c =
files for=20
ip_tables but I am not sure what I should be looking for to modify to =
correct=20
the problem. Any assistance would be appreciated.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Harry Gold</DIV>
<DIV><BR></DIV></FONT></BODY></HTML>

------=_NextPart_000_000A_01C30BCC.ED768FB0--


