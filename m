From: "Pavan Gokarn" <pavang@techknowledge.ws>
Subject: error in mport patch
Date: Fri, 21 Mar 2003 17:52:36 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00b101c2efa4$8f78aa40$e11310ac@techknowledge.ws>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00AE_01C2EFD2.A88BCCA0"
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

------=_NextPart_000_00AE_01C2EFD2.A88BCCA0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

hi,
   this is the error message i get when i give the command below. any =
idea why? i have compiled the kernel with mport patch. insmod is =
working. but this command give an error. well non of the patched =
commands are working, where as the modules can be loaded into the =
memory.

[root@sprinter root]# iptables -A FORWARD -p tcp -m mport --ports 80,21 =
-j ACCEPT
iptables v1.2.6a: Couldn't load match =
`mport':/lib/iptables/libipt_mport.so: cannot open shared object file: =
No such file or directory

Try `iptables -h' or 'iptables --help' for more information.


thanx
regards

------=_NextPart_000_00AE_01C2EFD2.A88BCCA0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2314.1000" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>hi,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp; this is the error message =
i get when i=20
give the command below. any idea why? i have compiled the kernel with =
mport=20
patch. insmod is working. but this command give an error. well non of =
the=20
patched commands are working, where as the modules can be loaded into =
the=20
memory.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>[root@sprinter root]# iptables -A =
FORWARD -p tcp -m=20
mport --ports 80,21 -j ACCEPT<BR>iptables v1.2.6a: Couldn't load match=20
`mport':/lib/iptables/libipt_mport.so: cannot open shared object file: =
No such=20
file or directory</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Try `iptables -h' or 'iptables --help' =
for more=20
information.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2><BR>&nbsp;</DIV></FONT>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>thanx</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>regards</FONT></DIV></DIV></FONT></FONT></DIV></BODY></HTML>

------=_NextPart_000_00AE_01C2EFD2.A88BCCA0--


