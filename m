From: =?iso-8859-1?Q?CPD_-_David_Carde=F1osa_Rubio?=
	 <dcardenosa@cac.retecal.es>
Subject: RE: Iptables Make Rules On Different Interface? "iptables - L" sh
	ows no difference!
Date: Mon, 7 Jun 2004 14:23:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7528A97D83FBD411BEF40003471B905B05D8FF5A@ZAR1>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C44C8A.4B9C0350"
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C44C8A.4B9C0350
Content-Type: text/plain;
	charset="iso-8859-1"

Hi 
 
You can see the interfaces with  iptables -v -L
 
David

-----Mensaje original-----
De: ke chen [mailto:linux_kurt@yahoo.com]
Enviado el: domingo, 06 de junio de 2004 22:58
Para: netfilter@lists.netfilter.org
Asunto: Iptables Make Rules On Different Interface? "iptables - L" shows no
difference!


hi all,
I want to make iptables impose different rules on two ethernet interfaces.

I would like to make restriction on external interface (eth0), but allow any
traffic in and out of internal interface (eth1).
iptables -A INPUT -i eth1 -s 0/0 -d 0/0 -j ACCEPT
iptables -A OUTPUT -o eth1 -s 0/0 -d 0/0 -j ACCEPT

when applying these rules, iptables -L
it shows 
Chain INPUT (policy DROP)
target prot opt source destionation
Accept all -- anywhere anywhere

Chain OUTPUT (policy DROP)
target prot opt source destionation
Accept all -- anywhere anywhere

There is no place to differentiate interface eth0 or eth1

Anyone could give me some hints?

Thank you in advance.

BEST REGARDS
kurt 



  _____  

Do you Yahoo!?
Friends. Fun. Try the all-new Yahoo!  <http://messenger.yahoo.com/>
Messenger


------_=_NextPart_001_01C44C8A.4B9C0350
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">


<META content="MSHTML 6.00.2800.1400" name=GENERATOR></HEAD>
<BODY>
<DIV><FONT face=Arial color=#0000ff size=2><SPAN class=562132212-07062004>Hi 
</SPAN></FONT></DIV>
<DIV><FONT face=Arial color=#0000ff size=2><SPAN 
class=562132212-07062004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial color=#0000ff size=2><SPAN class=562132212-07062004>You 
can see the interfaces with&nbsp; iptables -v -L</SPAN></FONT></DIV>
<DIV><FONT face=Arial color=#0000ff size=2><SPAN 
class=562132212-07062004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial color=#0000ff size=2><SPAN 
class=562132212-07062004>David</SPAN></FONT></DIV>
<BLOCKQUOTE>
  <DIV class=OutlookMessageHeader dir=ltr align=left><FONT face=Tahoma 
  size=2>-----Mensaje original-----<BR><B>De:</B> ke chen 
  [mailto:linux_kurt@yahoo.com]<BR><B>Enviado el:</B> domingo, 06 de junio de 
  2004 22:58<BR><B>Para:</B> netfilter@lists.netfilter.org<BR><B>Asunto:</B> 
  Iptables Make Rules On Different Interface? "iptables - L" shows no 
  difference!<BR><BR></FONT></DIV>
  <DIV>
  <DIV class=postcolor>hi all,<BR>I want to make iptables impose different rules 
  on two ethernet interfaces.<BR><BR>I would like to make restriction on 
  external interface (eth0), but allow any traffic in and out of internal 
  interface (eth1).<BR>iptables -A INPUT -i eth1 -s 0/0 -d 0/0 -j 
  ACCEPT<BR>iptables -A OUTPUT -o eth1 -s 0/0 -d 0/0 -j ACCEPT<BR><BR>when 
  applying these rules, iptables -L<BR>it shows <BR>Chain INPUT (policy 
  DROP)<BR>target prot opt source destionation<BR>Accept all -- anywhere 
  anywhere<BR><BR>Chain OUTPUT (policy DROP)<BR>target prot opt source 
  destionation<BR>Accept all -- anywhere anywhere<BR><BR>There is no place to 
  differentiate interface eth0 or eth1<BR><BR>Anyone could give me some 
  hints?<BR><BR>Thank you in advance.<BR><BR>BEST REGARDS<BR>kurt </DIV><!-- THE POST --></DIV>
  <P>
  <HR SIZE=1>
  <FONT face=arial size=-1>Do you Yahoo!?<BR>Friends. Fun. <A 
  href="http://messenger.yahoo.com/">Try the all-new Yahoo! 
Messenger</A></FONT></BLOCKQUOTE></BODY></HTML>

------_=_NextPart_001_01C44C8A.4B9C0350--

