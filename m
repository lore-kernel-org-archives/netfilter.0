From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: some body hacked my system
Date: Tue, 8 Oct 2002 11:07:37 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001e01c26edc$73aca530$8c01a8c0@sundaram>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001B_01C26EBA.E9541790"
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

------=_NextPart_000_001B_01C26EBA.E9541790
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I am allowing ftp connection in my firewall, some body used ftp port, =
filled
my hard disk space. He logged-in from 68.65.58.159 IP (/var/log/message)

Oct  8 00:57:03 linux2 ftpd[25101]: FTP LOGIN FROM
va-staff-u1-c5a-159.frbgva.adelphia.net [68.65.58.159]

he created directory named WC3 and transfed follwoing files.

bash-2.04# cd WC3
bash-2.04# ls
wc3.part01.rar.gz  wc3.part07.rar.gz  wc3.part13.rar.gz  =
wc3.part19.rar.gz
wc3.part02.rar.gz  wc3.part08.rar.gz  wc3.part14.rar.gz  =
wc3.part20.rar.gz
wc3.part03.rar.gz  wc3.part09.rar.gz  wc3.part15.rar.gz  =
wc3.part21.rar.gz
wc3.part04.rar.gz  wc3.part10.rar.gz  wc3.part16.rar.gz
wc3.part05.rar.gz  wc3.part11.rar.gz  wc3.part17.rar.gz
wc3.part06.rar.gz  wc3.part12.rar.gz  wc3.part18.rar.gz

Is anybody knows what this file used for?

How will i block this IP Address in my firewall?

How will i check what else he did on my machine?

Thanks
SR


------=_NextPart_000_001B_01C26EBA.E9541790
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4807.2300" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2><FONT face=3D"Times New Roman" =
size=3D3>Hi,<BR><BR>I am=20
allowing ftp connection in my firewall, some body used ftp port, =
filled<BR>my=20
hard disk space. He logged-in from 68.65.58.159 IP=20
(/var/log/message)<BR><BR>Oct&nbsp; 8 00:57:03 linux2 ftpd[25101]: FTP =
LOGIN=20
FROM<BR>va-staff-u1-c5a-159.frbgva.adelphia.net [68.65.58.159]<BR><BR>he =
created=20
directory named WC3 and transfed follwoing files.<BR><BR>bash-2.04# cd=20
WC3<BR>bash-2.04# ls<BR>wc3.part01.rar.gz&nbsp; wc3.part07.rar.gz&nbsp;=20
wc3.part13.rar.gz&nbsp; wc3.part19.rar.gz<BR>wc3.part02.rar.gz&nbsp;=20
wc3.part08.rar.gz&nbsp; wc3.part14.rar.gz&nbsp;=20
wc3.part20.rar.gz<BR>wc3.part03.rar.gz&nbsp; wc3.part09.rar.gz&nbsp;=20
wc3.part15.rar.gz&nbsp; wc3.part21.rar.gz<BR>wc3.part04.rar.gz&nbsp;=20
wc3.part10.rar.gz&nbsp; wc3.part16.rar.gz<BR>wc3.part05.rar.gz&nbsp;=20
wc3.part11.rar.gz&nbsp; wc3.part17.rar.gz<BR>wc3.part06.rar.gz&nbsp;=20
wc3.part12.rar.gz&nbsp; wc3.part18.rar.gz<BR><BR>Is anybody knows what =
this file=20
used for?<BR><BR>How will i block this IP Address in my =
firewall?<BR><BR>How=20
will i check what else he did on my=20
machine?<BR><BR>Thanks<BR>SR</FONT><BR></FONT></DIV></BODY></HTML>

------=_NextPart_000_001B_01C26EBA.E9541790--


