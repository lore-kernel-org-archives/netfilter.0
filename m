From: "Regalado, Ron" <Ron.Regalado@mci.com>
Subject: TARPIT Redhat 9 error
Date: Wed, 22 Oct 2003 17:53:52 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E26ABBCB14D369428125D23DF8BE94E52CD0BB@DGEXCH06.mcilink.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="Boundary_(ID_gW6S+ASVSd4Teq/vQix/NA)"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-return: allowed
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

--Boundary_(ID_gW6S+ASVSd4Teq/vQix/NA)
Content-type: text/plain; CHARSET=us-ascii

I have upgraded to iptables 1.2.8, installed the patch-o-matic extra for
tarpit, recompiled the kernel.  I am getting the error 
 
iptables -A INPUT -p tcp -m tcp --dport 135 -j TARPIT
iptables: No chain/target/match by that name
 
Will tarpit work with redhat's rpm package?
Or do I need to download and install the package from the netfilter site?
 
Thanks,
 
Ron

--Boundary_(ID_gW6S+ASVSd4Teq/vQix/NA)
Content-type: text/html; CHARSET=us-ascii

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=us-ascii">


<META content="MSHTML 6.00.2800.1264" name=GENERATOR></HEAD>
<BODY>
<DIV><FONT face=Arial size=2><SPAN class=438185017-22102003>I have upgraded to 
iptables 1.2.8, installed the patch-o-matic extra for tarpit, recompiled the 
kernel.&nbsp; I am getting the error </SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>iptables -A INPUT -p tcp -m tcp --dport 135 -j 
TARPIT</FONT></DIV>
<DIV><FONT face=Arial size=2>iptables: No chain/target/match by that 
name</FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2><SPAN class=438185017-22102003>Will tarpit work 
with redhat's rpm package?</SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN class=438185017-22102003>Or do I need to 
download and install the package from the netfilter site?</SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN 
class=438185017-22102003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2><SPAN 
class=438185017-22102003>Thanks,</SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN 
class=438185017-22102003></SPAN></FONT>&nbsp;</DIV>
<DIV><SPAN class=438185017-22102003><FONT face=Arial 
size=2>Ron</FONT></SPAN></DIV></BODY></HTML>

--Boundary_(ID_gW6S+ASVSd4Teq/vQix/NA)--

