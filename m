From: "Rodre Ghorashi-Zadeh" <rodrico7@hotmail.com>
Subject: Errors loading ip_nat_ftp module
Date: Thu, 13 Nov 2003 04:31:19 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LAW14-OE13jcMzfoV1q00000479@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000C_01C3A99E.FBCCB650"
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

------=_NextPart_000_000C_01C3A99E.FBCCB650
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello All,

I am new to this list so please forgive me if I "faux paus".

I am running kernel version 2.4.20 (from the kernel archives) with the =
following netfilter options:

Connection Tracking, FTP Protocol Support, IPTables Support, & NAT of =
local connections (order of appearance in 'make menuconfig') compiled =
statically into the kernel with all other options, execpt for IRC =
Protocol support (not compiled at all) compiled as modules. whenever I =
do an 'insmod ip_nat_ftp' I get the following error:

Using /lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_nat_ftp.o
/lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_nat_ftp.o: init_module: =
Device or resource busy
Hint: insmod errors can be caused by incorrect module parameters, =
including invalid IO or IRQ parameters.
      You may find more information in syslog or the output from dmesg

When I check /var/log/messages I see:

modprobe: modprobe: Can't locate module ip_conntrack_ftp
kernel: unable to load module ip_conntrack_ftp
kernel: ip_nat_ftp: error registering helper for port 21

When I do an 'ls' on '/lib/modules/2.4.20/kernel/net/ipv4/netfilter' I =
see the 'ip_nat_ftp.o' module but not the 'ip_conntrack_ftp.o' module. I =
am ssuming this is normal because I compiled the 'FTP Protocol Support' =
(CONFIG_IP_NF_FTP) into the kernal as apposed to a module.

I am assuming that the above errors are a result of the ip_nat_ftp =
module not being able to locate the ip_conntrack_ftp module which is =
statically built into the kernel. I didn't get any errors when I =
compiled the kernel so I am assuming it (ip_conntrack_ftp) compiled =
properly into the kernel. What I need to know is:

a) How can I tell if the ip_conntrack_ftp compiled statically into the =
kernel is working?
b) How can I load the ip_nat_ftp module without getting the errors? Do I =
have to tell it that ip_conntrack_ftp module is built into the kernel?
c) Do I have to somehow "activate" the ip_conntrack_ftp module now that =
it is built statically into the kernel?
D) Is there anyplace, in the /proc file system perhaps, that I can see =
any information regarding the ip_conntrack_ftp & ip_nat_ftp =
modules/functions?

I do not want to recompile unless I absolutely have to because this is a =
production firewall system. Any help regarding this matter would be =
greatly appreciated. Thanks in advance.

=AEodre
------=_NextPart_000_000C_01C3A99E.FBCCB650
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1276" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello All,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I am new to this list so please forgive =
me if I=20
"faux paus".</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I am running kernel version 2.4.20 =
(from the kernel=20
archives) with the following netfilter options:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Connection Tracking, FTP Protocol =
Support, IPTables=20
Support, &amp; NAT of local connections (order of appearance in 'make=20
menuconfig') compiled statically into the kernel with all other options, =
execpt=20
for IRC Protocol support&nbsp;(not compiled at all) compiled as modules. =

whenever I do an 'insmod ip_nat_ftp' I get the following =
error:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Using=20
/lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_nat_ftp.o<BR>/lib/module=
s/2.4.20/kernel/net/ipv4/netfilter/ip_nat_ftp.o:=20
init_module: Device or resource busy<BR>Hint: insmod errors can be =
caused by=20
incorrect module parameters, including invalid IO or IRQ=20
parameters.<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; You may find more =
information in=20
syslog or the output from dmesg</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>When I check /var/log/messages I =
see:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>modprobe: modprobe: Can't locate module =

ip_conntrack_ftp<BR>kernel: unable to load module =
ip_conntrack_ftp<BR>kernel:=20
ip_nat_ftp: error registering helper for port 21</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>When I do an 'ls' on=20
'/lib/modules/2.4.20/kernel/net/ipv4/netfilter' I see the 'ip_nat_ftp.o' =
module=20
but not the 'ip_conntrack_ftp.o' module. I am ssuming this is normal =
because I=20
compiled the 'FTP Protocol Support' (CONFIG_IP_NF_FTP) into the kernal =
as=20
apposed to a module.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I am assuming that the =
above&nbsp;errors are a=20
result of the ip_nat_ftp module not being able to locate the =
ip_conntrack_ftp=20
module which is statically built into the kernel.&nbsp;I didn't get any =
errors=20
when I compiled the kernel so I am assuming it (ip_conntrack_ftp) =
compiled=20
properly into the kernel. What I need to know is:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>a)&nbsp;How can I tell if the =
ip_conntrack_ftp=20
compiled statically into the kernel is working?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>b) How can I load the ip_nat_ftp module =
without=20
getting the errors? Do I have to tell it that ip_conntrack_ftp module is =
built=20
into the kernel?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>c) Do I have to somehow "activate" the=20
ip_conntrack_ftp module now that it is built statically into the=20
kernel?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>D) Is there anyplace, in the /proc file =
system=20
perhaps, that I can see any information regarding the ip_conntrack_ftp =
&amp;=20
ip_nat_ftp modules/functions?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I do not want to recompile unless I =
absolutely have=20
to because this is a production firewall system. Any help regarding this =
matter=20
would be greatly appreciated. Thanks in advance.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>=AEodre</FONT></DIV></BODY></HTML>

------=_NextPart_000_000C_01C3A99E.FBCCB650--

