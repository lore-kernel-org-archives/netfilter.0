From: "Mike Atlas" <matlas@vistainnovation.com>
Subject: RE: Quick Question
Date: Thu, 30 May 2002 18:11:02 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <AIEOIGGABAHAAIOAILIDAEDLCGAA.matlas@vistainnovation.com>
References: <NJEFLNJDIFFNMHDEBKMJCEDKDOAA.jpatterson@asgardgroup.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0047_01C20805.5B8819A0"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <NJEFLNJDIFFNMHDEBKMJCEDKDOAA.jpatterson@asgardgroup.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Joe Patterson <jpatterson@asgardgroup.com>, netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_0047_01C20805.5B8819A0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Okay, cool. I will not add this to the iptables rule, and just have it
connect without going through squid...
-mike
  -----Original Message-----
  From: Joe Patterson [mailto:jpatterson@asgardgroup.com]
  Sent: Thursday, May 30, 2002 5:51 PM
  To: Mike Atlas; netfilter@lists.samba.org
  Subject: RE: Quick Question


  One quick note:  This will not work for port 443.  squid can only
transparently proxy for normal http traffic.  If you want to deal with
https, you have two choices: either snat/masq/route the connection,
bypassing squid entirely (which cuts out some squid overhead and can be done
transparently) or tell the browser to use the the squid box on port 3128 to
proxy for https traffic (which I believe gives you somewhat nicer logging
and ACL-ability).  When a browser is configured to use a proxy server for
https it makes the connection to the proxy, issues a command something like
CONNECT server:port (I'm not sure of the syntax) and then treats that like a
tcp connection to the server it's trying to get in touch with (starting up
ssl and such).  If it's not configured to use a proxy, then it just makes
the tcp connection to the destination server on 443, and starts up ssl
immediately.  A proxy can't intercept that transparently.

  -Joe
    -----Original Message-----
    From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org]On Behalf Of Mike Atlas
    Sent: Thursday, May 30, 2002 4:18 PM
    To: netfilter@lists.samba.org
    Subject: Quick Question


    Hello Everyone. I hope you all can help me, I'm sure you can (it seems
like a pretty simple problem).

    I am setting up a Squid proxy server to run in transparent mode. To do
this, I need to forward all port 80 and 443 traffic to squids' port, 3128.
Additionally, I would like all other traffic on all other ports to forward
on to the router.

    I have found a script to forward port 80 to squid (note: eth1 is my
internal interface, eth0 is external):

    iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j
REDIRECT --to-port 3128

    I assume I can run the same line for 443:

    iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 443 -j
REDIRECT --to-port 3128


    However, what can I use to forward EVERYTHING that is not port 80 out of
the eth0 interface, to our router (192.168.0.2)?
    I know it has something to do with --dport ! 80, but I can't figure it
out.

    Thanks for your help.
    BTW, this is RedHat 72. if that makes any difference. Linux kernel
2.4.9-31.

    -mike
    ______________________________________________
    Mike Atlas                          703.385.8362(v)
    Senior System Engineer    703.385.3674(f)
    Vista Innovation                www.vistainnovation.com


------=_NextPart_000_0047_01C20805.5B8819A0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4916.2300" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D760131022-30052002><FONT face=3DArial color=3D#0000ff =
size=3D2>Okay,=20
cool. I will not add this to the iptables rule, and just have it connect =
without=20
going through squid...</FONT></SPAN></DIV>
<DIV><SPAN class=3D760131022-30052002><FONT face=3DArial color=3D#0000ff =

size=3D2>-mike</FONT></SPAN></DIV>
<BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B> Joe Patterson=20
  [mailto:jpatterson@asgardgroup.com]<BR><B>Sent:</B> Thursday, May 30, =
2002=20
  5:51 PM<BR><B>To:</B> Mike Atlas; =
netfilter@lists.samba.org<BR><B>Subject:</B>=20
  RE: Quick Question<BR><BR></FONT></DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D395293821-30052002>One=20
  quick note:&nbsp; This will not work for port 443.&nbsp; squid can =
only=20
  transparently proxy for normal http traffic.&nbsp; If you want to deal =
with=20
  https, you have two choices: either snat/masq/route the connection, =
bypassing=20
  squid entirely (which cuts out some squid overhead and can be done=20
  transparently) or tell the browser to use the the squid box on port =
3128 to=20
  proxy for https traffic (which I believe gives you somewhat nicer =
logging and=20
  ACL-ability).&nbsp; When a browser is configured to use a proxy server =
for=20
  https it makes the connection to the proxy, issues a command something =
like=20
  CONNECT server:port (I'm not sure of the syntax) and then treats that =
like a=20
  tcp connection to the server it's trying to get in touch with =
(starting up ssl=20
  and such).&nbsp; If it's not configured to use a proxy, then it just =
makes the=20
  tcp connection to the destination server on 443, and starts up ssl=20
  immediately.&nbsp; A proxy can't intercept that=20
  transparently.</SPAN></FONT></DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
  class=3D395293821-30052002></SPAN></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
  class=3D395293821-30052002>-Joe</SPAN></FONT></DIV>
  <BLOCKQUOTE=20
  style=3D"PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #0000ff 2px =
solid; MARGIN-RIGHT: 0px">
    <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
    size=3D2>-----Original Message-----<BR><B>From:</B>=20
    netfilter-admin@lists.samba.org=20
    [mailto:netfilter-admin@lists.samba.org]<B>On Behalf Of </B>Mike=20
    Atlas<BR><B>Sent:</B> Thursday, May 30, 2002 4:18 PM<BR><B>To:</B>=20
    netfilter@lists.samba.org<BR><B>Subject:</B> Quick=20
    Question<BR><BR></DIV></FONT>
    <DIV>
    <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2>Hello Everyone.=20
    I hope you all can help me, I'm sure you can (it seems like a pretty =
simple=20
    problem).</FONT></SPAN></DIV>
    <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial=20
    size=3D2></FONT></SPAN>&nbsp;</DIV>
    <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial size=3D2>I =
am setting up=20
    a Squid proxy server to run in transparent mode. To do this, I need =
to=20
    forward all port 80 and 443 traffic to squids' port, 3128. =
Additionally, I=20
    would like all other traffic on all other ports to forward on to the =
router.=20
    </FONT></SPAN></DIV>
    <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial=20
    size=3D2></FONT></SPAN>&nbsp;</DIV>
    <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial size=3D2>I =
have found a=20
    script to forward port 80 to squid (note: eth1 is my internal =
interface,=20
    eth0 is external):</FONT></SPAN></DIV>
    <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial=20
    size=3D2></FONT></SPAN>&nbsp;</DIV>
    <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2>iptables -t nat=20
    -A PREROUTING -i eth1 -p tcp --dport 80 -j REDIRECT --to-port=20
    3128</FONT></SPAN></DIV>
    <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial=20
    size=3D2></FONT></SPAN>&nbsp;</DIV>
    <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial size=3D2>I =
assume I can=20
    run the same line for 443:</FONT></SPAN></DIV>
    <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial=20
    size=3D2></FONT></SPAN>&nbsp;</DIV>
    <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2><SPAN=20
    class=3D316570420-30052002><FONT face=3DArial size=3D2>iptables -t =
nat -A=20
    PREROUTING -i eth1 -p tcp --dport&nbsp;443 -j REDIRECT --to-port=20
    3128</FONT></SPAN></FONT></SPAN></DIV>
    <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2><SPAN=20
    class=3D316570420-30052002></SPAN></FONT></SPAN>&nbsp;</DIV>
    <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2><SPAN=20
    class=3D316570420-30052002></SPAN></FONT></SPAN>&nbsp;</DIV>
    <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2><SPAN=20
    class=3D316570420-30052002>However, what can I use to forward =
EVERYTHING that=20
    is not port 80 out of the eth0 interface, to our router=20
    (192.168.0.2)?</SPAN></FONT></SPAN></DIV>
    <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2><SPAN=20
    class=3D316570420-30052002>I know it has something to do with =
--dport ! 80,=20
    but I can't figure it out.</SPAN></FONT></SPAN></DIV>
    <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2><SPAN=20
    class=3D316570420-30052002></SPAN></FONT></SPAN>&nbsp;</DIV>
    <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2><SPAN=20
    class=3D316570420-30052002>Thanks for your =
help.</SPAN></FONT></SPAN></DIV>
    <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2><SPAN=20
    class=3D316570420-30052002>BTW, this is RedHat 72. if that makes any =

    difference. Linux kernel 2.4.9-31.</SPAN></FONT></SPAN></DIV>
    <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2><SPAN=20
    class=3D316570420-30052002></SPAN></FONT></SPAN>&nbsp;</DIV>
    <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2><SPAN=20
    class=3D316570420-30052002>-mike</SPAN></FONT></SPAN></DIV></DIV>
    <P><FONT =
size=3D2>______________________________________________<BR>Mike=20
    =
Atlas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;=20
    703.385.8362(v)<BR>Senior System Engineer&nbsp;&nbsp;&nbsp;=20
    703.385.3674(f)<BR>Vista=20
    =
Innovation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    www.vistainnovation.com </FONT></P>
    <DIV>&nbsp;</DIV></BLOCKQUOTE></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0047_01C20805.5B8819A0--


