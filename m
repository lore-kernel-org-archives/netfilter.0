From: =?iso-8859-1?q?Jesus=20Polvareda?= <jpolvareda@yahoo.es>
Subject: Can't initialize iptables : using static kernel 2.4.25
Date: Thu, 26 Feb 2004 16:48:21 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040226154821.98500.qmail@web25201.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-47304859-1077810501=:98039"
Content-Transfer-Encoding: 8bit
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

--0-47304859-1077810501=:98039
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
=20
I have a problem everytime I intend to use iptables. I'm using a redhat 7.2=
 platform with a 2.4.25 kernel compiled without modules and including iptab=
les components in static kernel.
=20
I have eliminated the initial iptables 1.2.3a because it gave me the follow=
ing problem:
iptables v1.2.3 : can't initialize iptables table `filter' ...
=20
After installing the iptables v1.2.9 ( a tar.gz and then compilated), the p=
roblem was still present. I have even tried a static compilation but same r=
esults...
=20
After looking in this lists, I haven't found any mail related to this probl=
em in case of a static kernel...
=20
Problem seems that static 2.4.25 kernel (in fact above 2.4.18 I think) does=
n't create the pseudo file /proc/sys/kernel/modprobe which is looked by the=
 iptables usermode program even when it is compiled with NO_SHARED_LIBS=3D1=
...
=20
Is there any patch to iptables which can correct this problem? Had anyone h=
ad the same problem?
=20
=20
Thanks in advance,
=20
Jesus Polvareda
jpolvareda@yahoo.es


---------------------------------

=A0=A0=A0 Antivirus =95 Filtros antispam =95 6 MB gratis
=A0=A0=A0 =BFTodav=EDa no tienes un correo inteligente?
--0-47304859-1077810501=:98039
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<DIV>Hi,</DIV>
<DIV>&nbsp;</DIV>
<DIV>I have a problem everytime I intend to use iptables. I'm using a redha=
t 7.2 platform with a 2.4.25 kernel compiled without modules and including =
iptables components in static kernel.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I have eliminated the initial iptables 1.2.3a because it gave me the f=
ollowing problem:</DIV>
<DIV>iptables v1.2.3 : can't initialize iptables table `filter' ...</DIV>
<DIV>&nbsp;</DIV>
<DIV>After installing the iptables v1.2.9 ( a tar.gz and then compilated), =
the problem was still present. I have even tried a static compilation but&n=
bsp;same results...</DIV>
<DIV>&nbsp;</DIV>
<DIV>After looking in this lists, I haven't found any mail related to this =
problem in case of a static kernel...</DIV>
<DIV>&nbsp;</DIV>
<DIV>Problem seems that static 2.4.25 kernel (in fact above 2.4.18&nbsp;I t=
hink) doesn't create the pseudo file /proc/sys/kernel/modprobe which is loo=
ked by the iptables usermode program even when it is compiled with NO_SHARE=
D_LIBS=3D1...</DIV>
<DIV>&nbsp;</DIV>
<DIV>Is there any patch to iptables which can correct this problem? Had any=
one had the same problem?</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks in advance,</DIV>
<DIV>&nbsp;</DIV>
<DIV>Jesus Polvareda</DIV>
<DIV>jpolvareda@yahoo.es</DIV><p><hr size=3D1><br>
<table><tr><td><a href=3D"http://es.rd.yahoo.com/mail_es/tagline/mail_man/*=
http://es.docs.yahoo.com/benefits/"><img src=3D"http://eur.i1.yimg.com/eur.=
yimg.com/i/es/mail/w/tagma.jpg" height=3D80 width=3D230 alt=3D"" border=3D0=
 align=3D"right"></a></td></tr>
<tr><td><a href=3D"http://es.rd.yahoo.com/mail_es/tagline/mail_man/*http://=
es.docs.yahoo.com/benefits/" style=3D"font-size: -2; font-family: Verdana; =
font-weight: bold; color: #73738c; text-decoration: none;"><B><FONT face=3D=
Verdana color=3D#73738c size=3D-2>=A0=A0=A0 Antivirus =95=20
Filtros antispam =95 6 MB gratis</FONT></B><BR>
<B><FONT face=3DVerdana color=3D#73738c size=3D-2>=A0=A0=A0 =BFTodav=EDa no=
 tienes un correo inteligente?</FONT></B></a></td></tr></table>
--0-47304859-1077810501=:98039--

