From: "Michael K" <micke@klintan.se>
Subject: RE: Source Port
Date: Tue, 15 Apr 2003 17:22:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001101c30362$d75d4c40$0200a8c0@klintan.local>
References: <1050404537.1482.19.camel@india>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0012_01C30373.9AE61C40"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1050404537.1482.19.camel@india>
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

------=_NextPart_000_0012_01C30373.9AE61C40
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Dharmendra.T
Sent: Tuesday, April 15, 2003 1:02 PM
To: netfilter@lists.netfilter.org
Subject: Source Port


Hi Everyone, 

I am a regular reader of this list and I have absorbed that most of the
users won't use the source ports in their rules. Say for ex, 

#iptables -A INPUT -s 192.168.1.0/24 -p tcp -d 0/0 --dport 23 -j ACCEPT 

In these kind of rules they will not specify the source port from 1024
to 65545. I strongly recommend all Linux Users to specify the exact
rules what is allowed and what is not allowed. 

Any Comments? This could be a good practise? 


-- 

Regards

Dharmendra.T





This message is intended for the addressee only. It may contain
privileged or Confidential information. If you have received this
message in error,please notify the sender and destroy the message
immediately.Unauthorised use or reproduction of this message is strictly
prohibited.

 
If you have a personal firewall (only INPUT, OUTPUT) and only ONE ip.
It's not nesecary to put --source. However if you have more than ONE ip
you could have use for the --source and --sport.
Myself always add stronger rules to my firewall using --sport --source
--destination --dport --in-interface --out-interface. And ending up with
more rules  :-(. 
I think that adding stronger rules-set make hacking harder. But will add
more administrations to the firewall.
Ex. Adding strong firewall rules to smb is a pain. But thanks to the
--state the numbers of rules will be shortend.
 
/Klintan

------=_NextPart_000_0012_01C30373.9AE61C40
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<TITLE>Meddelande</TITLE>

<META content=3D"MSHTML 5.50.4923.2500" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<BLOCKQUOTE=20
style=3D"PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #0000ff 2px =
solid; MARGIN-RIGHT: 0px">
  <DIV></DIV>
  <DIV class=3DOutlookMessageHeader lang=3Dsv dir=3Dltr =
align=3Dleft><FONT face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B>=20
  netfilter-admin@lists.netfilter.org=20
  [mailto:netfilter-admin@lists.netfilter.org] <B>On Behalf Of=20
  </B>Dharmendra.T<BR><B>Sent:</B> Tuesday, April 15, 2003 1:02 =
PM<BR><B>To:</B>=20
  netfilter@lists.netfilter.org<BR><B>Subject:</B> Source=20
  Port<BR><BR></FONT></DIV>Hi Everyone, <BR><BR>I am a regular reader of =
this=20
  list and I have absorbed that most of the users won't use the source =
ports in=20
  their rules. Say for ex, <BR><BR>#iptables -A INPUT -s 192.168.1.0/24 =
-p tcp=20
  -d 0/0 --dport 23 -j ACCEPT <BR><BR>In these kind of rules they will =
not=20
  specify the source port from 1024 to 65545. I strongly recommend all =
Linux=20
  Users to specify the exact rules what is allowed and what is not =
allowed.=20
  <BR><BR>Any Comments? This could be a good practise? <BR>
  <TABLE cellSpacing=3D0 cellPadding=3D0 width=3D"100%">
    <TBODY>
    <TR>
      <TD><PRE>--=20
Regards
Dharmendra.T


This message is intended for the addressee only. It may contain =
privileged or Confidential information. If you have received this =
message in error,please notify the sender and destroy the message =
immediately.Unauthorised use or reproduction of this message is strictly =
prohibited.</PRE></TD></TR></TBODY></TABLE></BLOCKQUOTE>
<DIV><SPAN class=3D421321315-15042003><FONT face=3DArial color=3D#0000ff =

size=3D2>&nbsp;</FONT></SPAN></DIV>
<DIV><SPAN class=3D421321315-15042003><FONT face=3DArial color=3D#0000ff =
size=3D2>If you=20
have a personal firewall (only INPUT, OUTPUT) and only ONE ip. It's=20
not&nbsp;nesecary to put --source. However if you have =
more&nbsp;than&nbsp;ONE=20
ip you could have use for the --source and --sport.</FONT></SPAN></DIV>
<DIV><SPAN class=3D421321315-15042003><FONT face=3DArial color=3D#0000ff =
size=3D2>Myself=20
always add stronger rules to my firewall using --sport --source =
--destination=20
--dport --in-interface --out-interface. And ending&nbsp;up&nbsp;with =
more=20
rules</FONT>&nbsp;<FONT face=3DArial color=3D#0000ff size=3D2> :-(.=20
</FONT></SPAN></DIV>
<DIV><SPAN class=3D421321315-15042003><FONT face=3DArial color=3D#0000ff =
size=3D2>I=20
think that adding stronger rules-set make hacking harder. But will add =
more=20
administrations to the firewall.</FONT></SPAN></DIV>
<DIV><SPAN class=3D421321315-15042003><FONT face=3DArial color=3D#0000ff =
size=3D2>Ex.=20
Adding strong firewall rules to smb is a pain. But thanks to the --state =
the=20
numbers of rules will be shortend.</FONT></SPAN></DIV>
<DIV><SPAN class=3D421321315-15042003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D421321315-15042003><FONT face=3DArial color=3D#0000ff =

size=3D2>/Klintan</FONT></SPAN></DIV></BODY></HTML>

------=_NextPart_000_0012_01C30373.9AE61C40--



