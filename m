From: "Alexandros Fragkiadakis" <A.Fragiadakis@lboro.ac.uk>
Subject: About loadable kernel modules
Date: Wed, 2 Oct 2002 11:04:05 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001001c26a3e$1900bab0$c5327d9e@alex>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000D_01C26A03.6C92A070"
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

------=_NextPart_000_000D_01C26A03.6C92A070
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

Well, i have written a (netfilter) loadable kernel module for filtering =
various packets. I pass these packets from kernel space to user space =
using libipq.
 I also have a user process thas loads and unloads this loadable kernel =
module using the commands:
system("insmod kernel_module.o")=20
system("rmmod kernel_module") respectively.

 I'd like to pass parameters to the loadable module, hence having a more =
flexible user process.=20
  So, instead of using the command system("insmod kernel_module.o"),
i'd like to use: system("insmod kernel_module.o <param1> =
<param2>...<param n>")
, hence passing command line parameters to my loadable module.

Do you know if it is possible?

Thanks

------=_NextPart_000_000D_01C26A03.6C92A070
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2719.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial>Hi all,</FONT></DIV>
<DIV><FONT face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial>Well, i have written a (netfilter) loadable =
kernel module=20
for filtering various packets. I pass these packets from&nbsp;kernel=20
space&nbsp;to user space using libipq.</FONT></DIV>
<DIV><FONT face=3DArial>&nbsp;I also have a user process thas loads and =
unloads=20
this loadable kernel module using the commands:</FONT></DIV>
<DIV><FONT face=3DArial>system("insmod kernel_module.o") </FONT></DIV>
<DIV><FONT face=3DArial>system("rmmod kernel_module") =
respectively.</FONT></DIV>
<DIV><FONT face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial>&nbsp;I'd like to pass parameters to the =
loadable module,=20
hence having a more flexible user process. </FONT></DIV>
<DIV><FONT face=3DArial>&nbsp; So, instead of using the command =
<EM>system("insmod=20
kernel_module.o"),</EM></FONT></DIV>
<DIV><FONT face=3DArial>i'd like to use: <EM>system("insmod =
kernel_module.o=20
&lt;param1&gt; &lt;param2&gt;...&lt;param n&gt;")</EM></FONT></DIV>
<DIV><FONT face=3DArial>, hence passing command line parameters to my =
loadable=20
module.</FONT></DIV>
<DIV><FONT face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial>Do you know if it is possible?</FONT></DIV>
<DIV><FONT face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial>Thanks</FONT></DIV></BODY></HTML>

------=_NextPart_000_000D_01C26A03.6C92A070--


