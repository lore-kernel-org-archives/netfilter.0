From: Rob Sterenborg <r.sterenborg@hsl-brabantzuid.nl>
Subject: RE: iptables 1.2.7a and kernel 2.4.19
Date: Tue, 17 Sep 2002 16:46:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B32101987B@hslex01.hsl-brabantzuid.nl>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C25E58.FBB5BDC0"
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C25E58.FBB5BDC0
Content-Type: text/plain

and then built the kernel, rebooted and then tried to install 
> iptables 
> 1.2.7a
> 
> I get 
> 
> make
> Extensions found: IPv4:ipv4options IPv4:IPV4OPTSSTRIP IPv4:mport 
> IPv4:NETMAP IPv

Do a : "make clean" first.
Then do "make KERNEL_DIR=..." etc..


Rob

------_=_NextPart_001_01C25E58.FBB5BDC0
Content-Type: text/html

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=us-ascii">
<META NAME="Generator" CONTENT="MS Exchange Server version 5.5.2653.12">
<TITLE>RE: iptables 1.2.7a and kernel 2.4.19</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=2>and then built the kernel, rebooted and then tried to install </FONT>
<BR><FONT SIZE=2>&gt; iptables </FONT>
<BR><FONT SIZE=2>&gt; 1.2.7a</FONT>
<BR><FONT SIZE=2>&gt; </FONT>
<BR><FONT SIZE=2>&gt; I get </FONT>
<BR><FONT SIZE=2>&gt; </FONT>
<BR><FONT SIZE=2>&gt; make</FONT>
<BR><FONT SIZE=2>&gt; Extensions found: IPv4:ipv4options IPv4:IPV4OPTSSTRIP IPv4:mport </FONT>
<BR><FONT SIZE=2>&gt; IPv4:NETMAP IPv</FONT>
</P>

<P><FONT SIZE=2>Do a : &quot;make clean&quot; first.</FONT>
<BR><FONT SIZE=2>Then do &quot;make KERNEL_DIR=...&quot; etc..</FONT>
</P>
<BR>

<P><FONT SIZE=2>Rob</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C25E58.FBB5BDC0--

