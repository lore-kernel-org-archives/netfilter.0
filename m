From: "Joao Cesar Marigonda" <joao@webnow.com.br>
Subject: NAT and FTP connection track
Date: Tue, 6 May 2003 23:29:59 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000d01c31440$8ed6f360$0200a8c0@WORKFIX>
Reply-To: <joao@webnow.com.br>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000E_01C31427.6989BB60"
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

------=_NextPart_000_000E_01C31427.6989BB60
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello

I have found lots of explanations about ip_conntrack_ftp but no one
could help me to solve the following problem:
 
My FTP server is behind a firewall, so FTP should be always active and
the client needs to send PORT command
So, the FTP server will open data connection.
But the client is behind a NAT and the data connection from the FTP
server is rejected by the NAT. The client in the LAN will timeout
because it will never receive the SYN packet.

Question: How to configure NAT to track this incoming FTP data
connection from any server behind a firewall to any clients in the LAN
????
 
Thanks very much!
 
 
Joao

------=_NextPart_000_000E_01C31427.6989BB60
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 6.00.2800.1126" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D852182102-07052003><FONT face=3DVerdana =
size=3D2>Hello<BR><BR>I=20
have found lots of explanations about ip_conntrack_ftp but no one could =
help me=20
to solve the following problem:</FONT></SPAN></DIV>
<DIV><SPAN class=3D852182102-07052003><FONT face=3DVerdana=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D852182102-07052003><FONT face=3DVerdana size=3D2>My =
FTP server is=20
behind a firewall, so FTP should be always active and the client needs =
to send=20
PORT command</FONT></SPAN></DIV>
<DIV><SPAN class=3D852182102-07052003><FONT face=3DVerdana size=3D2>So, =
the FTP server=20
will open data connection.</FONT></SPAN></DIV>
<DIV><SPAN class=3D852182102-07052003><FONT face=3DVerdana size=3D2>But=20
the&nbsp;client is behind a NAT and the data connection from the FTP =
server is=20
rejected by the NAT. The client in the LAN will timeout because it will =
never=20
receive the SYN packet.</FONT></SPAN></DIV><SPAN =
class=3D852182102-07052003>
<DIV><BR><FONT face=3DVerdana size=3D2>Question: How to configure NAT to =
track this=20
incoming&nbsp;<SPAN class=3D852182102-07052003>FTP data =
</SPAN>connection<SPAN=20
class=3D852182102-07052003> from any server behind a=20
firewall</SPAN>&nbsp;to&nbsp;<SPAN class=3D852182102-07052003>any =
</SPAN>clients=20
in the LAN ????</FONT></DIV>
<DIV><FONT face=3DVerdana size=3D2></FONT>&nbsp;</DIV>
<DIV></SPAN><SPAN class=3D852182102-07052003><FONT face=3DVerdana =
size=3D2>Thanks very=20
much!</FONT></SPAN></DIV>
<DIV><FONT face=3DVerdana size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DVerdana size=3D2></FONT>&nbsp;</DIV>
<DIV><SPAN class=3D852182102-07052003><FONT face=3DVerdana=20
size=3D2>Joao</FONT></SPAN></DIV></BODY></HTML>

------=_NextPart_000_000E_01C31427.6989BB60--


