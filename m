From: "hare ram" <hareram@sol.net.in>
Subject: Re: Blocking file type by iptables?
Date: Mon, 25 Aug 2003 11:10:00 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007e01c36acb$59e39be0$c2bf09ca@Housecall>
References: <20030825025854.10696.qmail@web20712.mail.yahoo.com>
Reply-To: "hare ram" <hareram@sol.net.in>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0079_01C36AF9.6CEEDBE0"
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
To: ads nat <adsnat@yahoo.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0079_01C36AF9.6CEEDBE0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi

If you want to block Kazaa
use STRING from POM, it will work great=20

hare
  ----- Original Message -----=20
  From: ads nat=20
  To: George Vieira ; netfilter@lists.netfilter.org=20
  Sent: Monday, August 25, 2003 8:28 AM
  Subject: RE: Blocking file type by iptables?


  Even if you block all ports except 80. Kazza manages to access through =
port 80. So I don't think this will work.
  Thanks

  George Vieira <georgev@citadelcomputer.com.au> wrote:
    No because this is a bad idea. not only does the CPU have a bad day =
goign through every packet sniffing for file extensions but also that =
other innocent data can get blocked when it shouldn't be..

    1. The only thing you can do is block all outgoing/incoming ports =
and allow only some (25,80)
    2. Use transparent squid proxy to limit access and get it to use =
regex expressions on URLs you may also want to block.
    3. Block any and all MSN/Kazaa/ICQ servers addresses

    You could also setup a fake primary DNS domain like aol.com and =
icq.com and point to yourself... this is what I've done for ICQ to stop =
those damn ADs.. if the clients can't resolve the DNS for those domains =
then they also can't connect. But then they get smart and put a hosts =
file in their machine.. ;)




    Thanks,


    ____________________________________________
    George Vieira
    Citadel Computer Systems Pty LtdSystems Managergeorgev AT =
citadelcomputer DOT com DOT au
    Citadel Computer Systems Pty Ltd
    Phone : +61 2 9955 2644HelpDesk: +61 2 9955 =
2698http://www.citadelcomputer.com.au


    -----Original Message-----
    From: ads nat [mailto:adsnat@yahoo.com]
    Sent: Monday, August 25, 2003 2:22 AM
    To: netfilter@lists.netfilter.org
    Subject: Blocking file type by iptables?


    Hi,
    I have gone through mail archives to check whether can be blocked. I =
also checked squid mailing list. But thre is no definite solution to =
block kazza file downloads. I would like t know whether using iptables =
can i block particular type of file. If I block .mpeg, .mp3 files =
through IPtables then it does not matter from which site file is coming. =
It will get blocked.
    Any suggestion and solutions.
    Thanks


-------------------------------------------------------------------------=
---
    Do you Yahoo!?
    Yahoo! SiteBuilder - Free, easy-to-use web site design software=20


-------------------------------------------------------------------------=
-----
  Do you Yahoo!?
  Yahoo! SiteBuilder - Free, easy-to-use web site design software

------=_NextPart_000_0079_01C36AF9.6CEEDBE0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>If you want to block Kazaa</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>use STRING from POM, it will work great =

</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>hare</FONT></DIV>
<BLOCKQUOTE=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dadsnat@yahoo.com href=3D"mailto:adsnat@yahoo.com">ads =
nat</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dgeorgev@citadelcomputer.com.au=20
  href=3D"mailto:georgev@citadelcomputer.com.au">George Vieira</A> ; <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Monday, August 25, 2003 =
8:28=20
  AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> RE: Blocking file type =
by=20
  iptables?</DIV>
  <DIV><BR></DIV>
  <DIV>Even if you block all ports except 80. Kazza manages to access =
through=20
  port 80. So I don't think this will work.</DIV>
  <DIV>Thanks<BR><BR><B><I>George Vieira &lt;<A=20
  =
href=3D"mailto:georgev@citadelcomputer.com.au">georgev@citadelcomputer.co=
m.au</A>&gt;</I></B>=20
  wrote:</DIV>
  <BLOCKQUOTE class=3Dreplbq=20
  style=3D"PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px =
solid">
    <META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
    <DIV><SPAN class=3D528422422-24082003><FONT face=3DArial =
color=3D#0000ff size=3D2>No=20
    because this is a bad idea. not only does the CPU have a bad day =
goign=20
    through every packet sniffing for file extensions but also that =
other=20
    innocent data can get blocked when it shouldn't =
be..</FONT></SPAN></DIV>
    <DIV><SPAN class=3D528422422-24082003><FONT face=3DArial =
color=3D#0000ff=20
    size=3D2></FONT></SPAN>&nbsp;</DIV>
    <DIV><SPAN class=3D528422422-24082003><FONT face=3DArial =
color=3D#0000ff size=3D2>1.=20
    The only thing you can do is block all outgoing/incoming ports and =
allow=20
    only some (25,80)</FONT></SPAN></DIV>
    <DIV><SPAN class=3D528422422-24082003><FONT face=3DArial =
color=3D#0000ff size=3D2>2.=20
    Use transparent squid proxy to limit access and get it to use regex=20
    expressions on URLs you may also want to block.</FONT></SPAN></DIV>
    <DIV><SPAN class=3D528422422-24082003><FONT face=3DArial =
color=3D#0000ff size=3D2>3.=20
    Block any and all MSN/Kazaa/ICQ servers =
addresses</FONT></SPAN></DIV>
    <DIV><SPAN class=3D528422422-24082003><FONT face=3DArial =
color=3D#0000ff=20
    size=3D2></FONT></SPAN>&nbsp;</DIV>
    <DIV><SPAN class=3D528422422-24082003><FONT face=3DArial =
color=3D#0000ff=20
    size=3D2>You could also setup a fake primary DNS domain like aol.com =
and=20
    icq.com and point to yourself... this is what I've done for ICQ to =
stop=20
    those damn ADs.. if the clients can't resolve the DNS for those =
domains then=20
    they also can't connect. But then they get smart and put a hosts =
file in=20
    their machine.. ;)</FONT></SPAN></DIV>
    <DIV><SPAN class=3D528422422-24082003><FONT face=3DArial =
color=3D#0000ff=20
    size=3D2></FONT></SPAN>&nbsp;</DIV>
    <DIV><SPAN class=3D528422422-24082003></SPAN><SPAN=20
    class=3D528422422-24082003><FONT face=3DArial color=3D#0000ff=20
    size=3D2></FONT></SPAN>&nbsp;</DIV>
    <DIV><SPAN class=3D528422422-24082003><FONT face=3DArial =
color=3D#0000ff=20
    size=3D2></FONT></SPAN>&nbsp;</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>
    <P><FONT face=3DArial size=3D2><SPAN=20
    class=3D674251008-03092002>Thanks,</SPAN></FONT></P></DIV>
    <DIV><FONT face=3DArial size=3D2><SPAN=20
    class=3D674251008-03092002></SPAN></FONT>&nbsp;</DIV>
    <DIV style=3D"WIDTH: 305px; HEIGHT: 232px">
    <MARQUEE id=3DMarquee1 style=3D"WIDTH: 220px; HEIGHT: 57px" =
trueSpeed=20
    scrollAmount=3D1 scrollDelay=3D20 direction=3Ddown behavior=3Dslide =
loop=3D1=20
    border=3D"2"><FONT=20
    =
size=3D1>____________________________________________</FONT></MARQUEE><BR=
><B><FONT=20
    color=3D#000066 size=3D2></FONT><FONT face=3DVerdana color=3D#000066 =
size=3D2>George=20
    Vieira<BR></FONT></B>
    <MARQUEE id=3DMarquee2 style=3D"WIDTH: 240px; HEIGHT: 17px" =
trueSpeed=20
    scrollAmount=3D1 scrollDelay=3D3 behavior=3Dslide loop=3D1 =
width=3D281 height=3D19=20
    border=3D"0"><FONT face=3D"Verdana, Verdana, Helvetica, sans-serif" =
color=3Dblack=20
    size=3D1><B>Citadel Computer Systems Pty Ltd</B></FONT></MARQUEE>
    <MARQUEE id=3DMarquee2 style=3D"WIDTH: 240px; HEIGHT: 17px" =
trueSpeed=20
    scrollAmount=3D1 scrollDelay=3D3 behavior=3Dslide loop=3D1 =
border=3D"0"><FONT=20
    face=3D"Verdana, Verdana, Helvetica, sans-serif" color=3Dblack =
size=3D1><B>Systems=20
    Manager</B></FONT></MARQUEE><FONT face=3DVerdana>
    <MARQUEE id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 255px; =
HEIGHT: 17px"=20
    trueSpeed scrollAmount=3D2 scrollDelay=3D5 direction=3Dright =
behavior=3Dslide loop=3D1=20
    width=3D300 height=3D16 border=3D"0"><FONT=20
    face=3D"Verdana, Verdana, Helvetica, sans-serif" color=3D#000099 =
size=3D1>georgev=20
    AT citadelcomputer DOT com DOT au</FONT></MARQUEE>
    <MARQUEE id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 220px; =
HEIGHT: 17px"=20
    trueSpeed scrollAmount=3D1 scrollDelay=3D3 behavior=3Dslide loop=3D1 =

    border=3D"0"></MARQUEE></FONT>
    <DIV><FONT face=3D"Verdana, Verdana, Helvetica, sans-serif" =
color=3Dblack=20
    size=3D1>Citadel Computer Systems Pty Ltd</FONT><FONT =
face=3DVerdana></DIV>
    <MARQUEE id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 220px; =
HEIGHT: 17px"=20
    trueSpeed scrollAmount=3D1 scrollDelay=3D3 direction=3Dright =
behavior=3Dslide loop=3D1=20
    border=3D"0"><FONT color=3Dblack size=3D1>Phone : +61 2 9955=20
    2644</FONT></MARQUEE></FONT><FONT face=3DVerdana>
    <MARQUEE id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 220px; =
HEIGHT: 17px"=20
    trueSpeed scrollAmount=3D1 scrollDelay=3D3 direction=3Dright =
behavior=3Dslide loop=3D1=20
    border=3D"0"><FONT color=3Dblack size=3D1>HelpDesk: +61 2 9955=20
    2698</FONT></MARQUEE></FONT>
    <MARQUEE id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 220px; =
HEIGHT: 17px"=20
    trueSpeed scrollAmount=3D4 scrollDelay=3D5 direction=3Dright =
behavior=3Dslide loop=3D1=20
    border=3D"0"><A href=3D"http://www.citadelcomputer.com.au/"><FONT=20
    face=3D"Verdana, Verdana, Helvetica, sans-serif" color=3D#000099 =
size=3D1><A=20
    =
href=3D"http://www.citadelcomputer.com.au/">http://www.citadelcomputer.co=
m.au</FONT></A></MARQUEE></DIV>
    <DIV>&nbsp;</DIV>
    <DIV>&nbsp;</DIV>
    <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
    size=3D2>-----Original Message-----<BR><B>From:</B> ads nat=20
    [mailto:adsnat@yahoo.com]<BR><B>Sent:</B> Monday, August 25, 2003 =
2:22=20
    AM<BR><B>To:</B> netfilter@lists.netfilter.org<BR><B>Subject:</B> =
Blocking=20
    file type by iptables?<BR><BR></FONT></DIV>
    <DIV>Hi,</DIV>
    <DIV>I have gone through mail archives to check whether can be =
blocked. I=20
    also checked squid mailing list. But thre is no definite solution to =
block=20
    kazza file downloads. I would like t know whether using iptables can =
i block=20
    particular type of file. If I block .mpeg, .mp3 files through =
IPtables then=20
    it does not matter from which site file is coming. It will get=20
blocked.</DIV>
    <DIV>Any suggestion and solutions.</DIV>
    <DIV>Thanks</DIV>
    <P>
    <HR SIZE=3D1>
    Do you Yahoo!?<BR><A=20
    =
href=3D"http://us.rd.yahoo.com/evt=3D10469/*http://sitebuilder.yahoo.com"=
>Yahoo!=20
    SiteBuilder</A> - Free, easy-to-use web site design software =
</BLOCKQUOTE>
  <P>
  <HR SIZE=3D1>
  Do you Yahoo!?<BR><A=20
  =
href=3D"http://us.rd.yahoo.com/evt=3D10469/*http://sitebuilder.yahoo.com"=
>Yahoo!=20
  SiteBuilder</A> - Free, easy-to-use web site design=20
software</BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0079_01C36AF9.6CEEDBE0--


