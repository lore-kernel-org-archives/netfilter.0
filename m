From: "Tahmid Quazi" <quazit@nu.ac.za>
Subject: help with iptables
Date: Tue, 03 Jun 2003 11:22:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <sedc84e5.060@smtp.nu.ac.za>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=_3768D8D5.2342A5E5"
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

This is a MIME message. If you are reading this text, you may want to 
consider changing to a mail reader or gateway that understands how to 
properly handle MIME multipart messages.

--=_3768D8D5.2342A5E5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi
=20
I am trying to use the iptables command on an iPaq running Familiar. The =
kernel version is 2.4.18-rmk3-hh6.=20
The kernel does not have netfilter configured so for any functionality I =
need, I have to install a module.
=20
I have installed the following modules:
iptable_filter
ip_tables
=20
successfully. ( i can see them when i type /proc/modules)
=20
But when i try a simple iptables command (i got this from the "howto" =
document)
/ # iptables -A INPUT -s 127.0.0.1 -p icmp -j DROP
=20
I get the following output:

iptables: No such file or directory
=20
Please could someone tell me what i am doing wrong or missing.
=20
Many thanks in advance for your help!
=20
-- tahmid


--=_3768D8D5.2342A5E5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Description: HTML

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" http-equiv=3DContent-Type=
>
<META content=3D"MSHTML 5.00.3315.2870" name=3DGENERATOR></HEAD>
<BODY style=3D"FONT: 8pt Tahoma; MARGIN-LEFT: 2px; MARGIN-TOP: 2px"><FONT =
size=3D2>
<DIV><FONT size=3D2>Hi</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>I am trying to use the iptables command on an iPaq =
running=20
Familiar. The kernel version is 2.4.18-rmk3-hh6. </FONT></DIV>
<DIV><FONT size=3D2>The kernel does not have netfilter configured so for =
any=20
functionality I need,&nbsp;I have to install a module.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>I have installed the following modules:</FONT></DIV>
<DIV><FONT size=3D2>iptable_filter</FONT></DIV>
<DIV><FONT size=3D2>ip_tables</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>successfully. ( i can see them when i type=20
/proc/modules)</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>But when i try a simple iptables command (i got this =
from the=20
"howto" document)</FONT></DIV>
<DIV><FONT size=3D2>/ # iptables -A INPUT -s 127.0.0.1 -p icmp -j=20
DROP</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>I get the following output:</FONT></DIV>
<DIV><FONT size=3D2><BR>iptables: No such file or directory</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>Please could someone tell me what i am doing wrong =
or=20
missing.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>Many thanks in advance for your help!</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>-- tahmid</FONT></DIV></FONT></BODY></HTML>

--=_3768D8D5.2342A5E5--

