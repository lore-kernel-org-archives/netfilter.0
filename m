From: "Tahmid Quazi" <quazit@nu.ac.za>
Subject: Compiling iptables for Ipaq
Date: Wed, 04 Jun 2003 12:10:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <sedde1c8.056@smtp.nu.ac.za>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=_F6A918B8.6908E8A2"
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

--=_F6A918B8.6908E8A2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

hi
=20
I am trying to compile the user-space program "iptables" for linux-2.4.18-r=
mk3-hh6.
I have downloaded the latest iptables file and : iptables-1.2.8.tar.bz2=20
And the patch: Patch against 1.2.7a
I have also tried the patch-o-matic patch-o-matic-20030107.tar.bz2
When i tried to "make" on both the patches, the prompt returned with =
"nothing to be done"
=20
When i run a genral make i get the following error:
=20
[root@manet iptables-1.2.8]# make
Extensions found:
ld -shared -o extensions/libipt_ah.so extensions/libipt_ah_sh.o
ld: extensions/libipt_ah_sh.o: Relocations in generic ELF (EM: 40)
extensions/libipt_ah_sh.o: could not read symbols: File in wrong format
make: *** [extensions/libipt_ah.so] Error 1
[root@manet iptables-1.2.8]#
=20
I seem to be following the instructions so i dont know where i am going =
wrong. (My KERNEL_DIR is the source code directory for the kernel i am =
using)
Both 'gcc' and 'arm-linux-gcc' (for the iPaq) give me the same error.
=20
Please could someone help me.
Many thanks in advance for your kind response.
=20
-- tahmid


--=_F6A918B8.6908E8A2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Description: HTML

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" http-equiv=3DContent-Type=
>
<META content=3D"MSHTML 5.00.3315.2870" name=3DGENERATOR></HEAD>
<BODY style=3D"FONT: 8pt Tahoma; MARGIN-LEFT: 2px; MARGIN-TOP: 2px">
<DIV><FONT size=3D2>hi</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>I am trying to compile the user-space program =
"iptables" for=20
linux-2.4.18-rmk3-hh6.</FONT></DIV>
<DIV>I have downloaded the latest iptables file and : <A=20
href=3D"http://www.netfilter.org/files/iptables-1.2.8.tar.bz2">iptables-1.2=
.8.tar.bz2</A>=20
</DIV>
<DIV>And the patch: <A=20
href=3D"http://www.netfilter.org/files/patch-iptables-1.2.7a-1.2.8.bz2">Pat=
ch=20
against 1.2.7a</A></DIV>
<DIV>I have also tried the patch-o-matic <A=20
href=3D"http://www.netfilter.org/files/patch-o-matic-20030107.tar.bz2">patc=
h-o-matic-20030107.tar.bz2</A></DIV>
<DIV>When i tried to "make" on both the patches, the prompt returned =
with=20
"nothing to be done"</DIV>
<DIV>&nbsp;</DIV>
<DIV>When i run a genral make i get the following error:</DIV>
<DIV>&nbsp;</DIV>
<DIV>[root@manet iptables-1.2.8]# make<BR>Extensions found:<BR>ld -shared =
-o=20
extensions/libipt_ah.so extensions/libipt_ah_sh.o<BR>ld:=20
extensions/libipt_ah_sh.o: Relocations in generic ELF (EM:=20
40)<BR>extensions/libipt_ah_sh.o: could not read symbols: File in wrong=20
format<BR>make: *** [extensions/libipt_ah.so] Error 1<BR>[root@manet=20
iptables-1.2.8]#</DIV>
<DIV>&nbsp;</DIV>
<DIV>I seem to be following the instructions so i dont know where i am =
going=20
wrong. (My KERNEL_DIR is the source code directory for the kernel i am=20
using)</DIV>
<DIV>Both 'gcc' and 'arm-linux-gcc' (for the iPaq) give me the same =
error.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Please could someone help me.</DIV>
<DIV>Many thanks in advance for your kind response.</DIV>
<DIV>&nbsp;</DIV>
<DIV>-- tahmid</DIV></BODY></HTML>

--=_F6A918B8.6908E8A2--

