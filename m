From: Khanh Tran <khanh@slc.edu>
Subject: RE: Blocking downloads
Date: Wed, 5 Feb 2003 11:06:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01CEA3A5B8B2D511890F0002A5870AEC64EBAD@EXCHANGE>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2CD30.94E2EFE0"
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
To: 'ASC - Ronald Roeleveld' <r.roeleveld@ascinternational.nl>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2CD30.94E2EFE0
Content-Type: text/plain;
	charset="iso-8859-1"

Well, that is going to be a little rough since most file downloads happen
over the same port as the http traffic (port 80).  You could block all ports
besides 80, but they'd still be able to download files that were http links.
You might want to look into setting file permissions or doing some kind of
kiosk-mode on your local workstations.
 
Khanh Tran
Network Operations
Sarah Lawrence College
1 Mead Way
Bronxville, NY 10708
(914) 395-2639


-----Original Message-----
From: ASC - Ronald Roeleveld [mailto:r.roeleveld@ascinternational.nl]
Sent: Wednesday, February 05, 2003 11:02 AM
To: 'Khanh Tran'
Cc: 'netfilter@lists.netfilter.org'
Subject: RE: Blocking downloads


What I want is that clients cannot, let's say with Internet Explorer or
Mozzila, download files from the internet, but can browse the internet.
 

-----Original Message-----
From: Khanh Tran [mailto:khanh@slc.edu]
Sent: woensdag 5 februari 2003 16:45
To: 'ASC - Ronald Roeleveld'; 'netfilter@lists.netfilter.org'
Subject: RE: Blocking downloads


You can very easily block certain clients based on either MAC address and/or
IP address.  As for the ports, well that depends on the application you want
to block (ie. FTP, Kazaa, web, NNTP, etc).
 
Khanh Tran
Network Operations
Sarah Lawrence College



-----Original Message-----
From: ASC - Ronald Roeleveld [mailto:r.roeleveld@ascinternational.nl]
Sent: Wednesday, February 05, 2003 10:38 AM
To: 'netfilter@lists.netfilter.org'
Subject: Blocking downloads


Hey everyone,
 
Since I want to spare my download speed, and dont want clients to download
freaking warez, would it be possible to block downloads with iptables for
certain clients???
And if it's possible which ports need to closed?
 
Thanks in advance,
Ronald Roeleveld 
System Administrator 

ASCINTERNATIONAL 
Vlietweg 17c, 2266 KA, Leidschendam, The Netherlands 
Tel. +31 (0)70 3178400, Fax +31 (0)70 3204760
E-mail: r.roeleveld@ascinternational.nl
<mailto:r.roeleveld@ascinternational.nl> , Website:
http://www.ascinternational.nl <http://www.ascinternational.nl/>  

 


------_=_NextPart_001_01C2CD30.94E2EFE0
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">


<META content="MSHTML 6.00.2800.1106" name=GENERATOR></HEAD>
<BODY>
<DIV><SPAN class=577520416-05022003><FONT face=Arial color=#0000ff size=2>Well, 
that is going to be a little rough since most file downloads happen over the 
same port as the http traffic (port 80).&nbsp; You could block all ports besides 
80, but they'd still be able to download files that were http links.&nbsp; You 
might want to look into setting file permissions or doing some kind of 
kiosk-mode on your local workstations.</FONT></SPAN></DIV>
<DIV><SPAN class=577520416-05022003><FONT face=Arial color=#0000ff 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=577520416-05022003>
<P><FONT size=2>Khanh Tran<BR>Network Operations<BR>Sarah Lawrence College<BR>1 
Mead Way<BR>Bronxville, NY 10708<BR>(914) 395-2639<BR></FONT></P></SPAN></DIV>
<BLOCKQUOTE dir=ltr style="MARGIN-RIGHT: 0px">
  <DIV class=OutlookMessageHeader dir=ltr align=left><FONT face=Tahoma 
  size=2>-----Original Message-----<BR><B>From:</B> ASC - Ronald Roeleveld 
  [mailto:r.roeleveld@ascinternational.nl]<BR><B>Sent:</B> Wednesday, February 
  05, 2003 11:02 AM<BR><B>To:</B> 'Khanh Tran'<BR><B>Cc:</B> 
  'netfilter@lists.netfilter.org'<BR><B>Subject:</B> RE: Blocking 
  downloads<BR><BR></FONT></DIV>
  <DIV><FONT face=Arial color=#0000ff size=2><SPAN class=734310016-05022003>What 
  I want is that clients cannot, let's say with Internet Explorer or Mozzila, 
  download files from the internet, but can browse the 
  internet.</SPAN></FONT></DIV>
  <DIV><FONT face=Arial color=#0000ff size=2><SPAN 
  class=734310016-05022003></SPAN></FONT>&nbsp;</DIV>
  <BLOCKQUOTE dir=ltr style="MARGIN-RIGHT: 0px">
    <DIV class=OutlookMessageHeader dir=ltr align=left><FONT face=Tahoma 
    size=2>-----Original Message-----<BR><B>From:</B> Khanh Tran 
    [mailto:khanh@slc.edu]<BR><B>Sent:</B> woensdag 5 februari 2003 
    16:45<BR><B>To:</B> 'ASC - Ronald Roeleveld'; 
    'netfilter@lists.netfilter.org'<BR><B>Subject:</B> RE: Blocking 
    downloads<BR><BR></FONT></DIV>
    <DIV><SPAN class=654124415-05022003><FONT face=Arial color=#0000ff 
    size=2>You can very easily block certain clients based on either MAC address 
    and/or IP address.&nbsp; As for the ports, well that depends on the 
    application you want to block (ie. FTP, Kazaa, web, NNTP, 
    etc).</FONT></SPAN></DIV>
    <DIV><SPAN class=654124415-05022003><FONT face=Arial color=#0000ff 
    size=2></FONT></SPAN>&nbsp;</DIV>
    <DIV><SPAN class=654124415-05022003>
    <P><FONT size=2>Khanh Tran<BR>Network Operations<BR>Sarah Lawrence 
    College<BR><BR></FONT></P></SPAN></DIV>
    <BLOCKQUOTE dir=ltr style="MARGIN-RIGHT: 0px">
      <DIV class=OutlookMessageHeader dir=ltr align=left><FONT face=Tahoma 
      size=2>-----Original Message-----<BR><B>From:</B> ASC - Ronald Roeleveld 
      [mailto:r.roeleveld@ascinternational.nl]<BR><B>Sent:</B> Wednesday, 
      February 05, 2003 10:38 AM<BR><B>To:</B> 
      'netfilter@lists.netfilter.org'<BR><B>Subject:</B> Blocking 
      downloads<BR><BR></FONT></DIV>
      <DIV><SPAN class=750163315-05022003><FONT face=Arial size=2>Hey 
      everyone,</FONT></SPAN></DIV>
      <DIV><SPAN class=750163315-05022003><FONT face=Arial 
      size=2></FONT></SPAN>&nbsp;</DIV>
      <DIV><SPAN class=750163315-05022003><FONT face=Arial size=2>Since I want 
      to spare my download speed, and dont want clients to download freaking 
      warez, would it be possible to block downloads with iptables for certain 
      clients???</FONT></SPAN></DIV>
      <DIV><SPAN class=750163315-05022003><FONT face=Arial size=2>And if it's 
      possible which ports need to closed?</FONT></SPAN></DIV>
      <DIV><SPAN class=750163315-05022003></SPAN>&nbsp;</DIV>
      <DIV><SPAN class=750163315-05022003><FONT face=Arial size=2>Thanks in 
      advance,</FONT></SPAN></DIV><B><FONT face=Arial size=2>
      <P>Ronald Roeleveld&nbsp;<BR><FONT size=1>System 
      Administrator</FONT>&nbsp;</P>
      <P><B><FONT face=Arial color=#000080 size=2>ASC</FONT><FONT face=Arial 
      color=#808080 size=2>INTERNATIONAL</FONT></B> <BR><FONT face=Arial 
      color=#808080 size=1>Vlietweg 17c, 2266 KA, Leidschendam, The 
      Netherlands</FONT> <BR><FONT face=Arial color=#808080 size=1>Tel. +31 
      (0)70 3178400, Fax +31 (0)70 3204760<BR></FONT><FONT face=Arial 
      color=#808080 size=1>E-mail: <A 
      href="mailto:r.roeleveld@ascinternational.nl">r.roeleveld@ascinternational.nl</A>, 
      Website: </FONT><U><B><FONT face=Arial color=#0000ff size=1><A 
      href="http://www.ascinternational.nl/" 
      target=_blank>http://www.ascinternational.nl</A></FONT></B></U><B></B> 
      </P></FONT></B>
      <DIV><FONT face=Arial 
size=2></FONT>&nbsp;</DIV></BLOCKQUOTE></BLOCKQUOTE></BLOCKQUOTE></BODY></HTML>

------_=_NextPart_001_01C2CD30.94E2EFE0--


