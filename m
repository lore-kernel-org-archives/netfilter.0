From: =?iso-8859-1?Q?Bruno_Negr=E3o?= <vpopmail@engepel.com.br>
Subject: Is IPTables::IPv4 Perl module trustable?
Date: Fri, 23 Jul 2004 20:34:06 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01d101c4710d$8c3c4490$5100a8c0@egp>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_01CE_01C470F4.66A77C40"
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
Cc: iptperl-general@lists.sourceforge.net

This is a multi-part message in MIME format.

------=_NextPart_000_01CE_01C470F4.66A77C40
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi guys,

My question is exactly the one in the e-mail subject: Is IPTables::IPv4
Perl module trustable?

This module is a perl interface to the 'libiptc' library, written by,
Derrik Pates. I'd like to use it in an application.
But I read in netfilter's FAQ the following:

"4.5 Is there an C/C++ API for adding/removing rules?
The answer unfortunately is: No.
Now you might think 'but what about libiptc?'. As has been pointed out
numerous times on the mailinglist(s), libiptc was _NEVER_ meant to be =
used
as a public interface. We don't guarantee a stable interface, and it is
planned to remove it in the next incarnation of linux packet filtering.
libiptc is way too low-layer to be used reasonably anyway.
We are well aware that there is a fundamental lack for such an API, and =
we
are working on improving that situation. Until then, it is recommended =
to
either use system() or open a pipe into stdin of iptables-restore. The
latter will give you a way better performance."

Does someone else already tested it before? Does someone else there =
knows
its internals?

Thanks,
bruno negr=E3o

------=_NextPart_000_01CE_01C470F4.66A77C40
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2><FONT face=3D"Times New Roman" =
size=3D3>Hi=20
guys,<BR><BR>My question is exactly the one in the e-mail subject: Is=20
IPTables::IPv4<BR>Perl module trustable?<BR><BR>This module is a perl =
interface=20
to the 'libiptc' library, written by,<BR>Derrik Pates. I'd like to use =
it in an=20
application.<BR>But I read in netfilter's FAQ the following:<BR><BR>"4.5 =
Is=20
there an C/C++ API for adding/removing rules?<BR>The answer =
unfortunately is:=20
No.<BR>Now you might think 'but what about libiptc?'. As has been =
pointed=20
out<BR>numerous times on the mailinglist(s), libiptc was _NEVER_ meant =
to be=20
used<BR>as a public interface. We don't guarantee a stable interface, =
and it=20
is<BR>planned to remove it in the next incarnation of linux packet=20
filtering.<BR>libiptc is way too low-layer to be used reasonably =
anyway.<BR>We=20
are well aware that there is a fundamental lack for such an API, and =
we<BR>are=20
working on improving that situation. Until then, it is recommended =
to<BR>either=20
use system() or open a pipe into stdin of iptables-restore. =
The<BR>latter will=20
give you a way better performance."<BR><BR>Does someone else already =
tested it=20
before? Does someone else there knows<BR>its =
internals?<BR><BR>Thanks,<BR>bruno=20
negr=E3o</FONT><BR></FONT></DIV></BODY></HTML>

------=_NextPart_000_01CE_01C470F4.66A77C40--


