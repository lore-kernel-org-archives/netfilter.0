From: =?iso-8859-1?Q?Juli=E1n_Mar=EDa_M=FCller_Frizza?=
 <julian_muller@speedy.com.ar>
Subject: Re: patch: ipt_string
Date: Sat, 23 Aug 2003 05:46:04 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006c01c36952$fe6a4d00$e800a8c0@tecnico>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="Boundary_(ID_t7zSQ9RNxLCtXuuVBFslLg)"
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

--Boundary_(ID_t7zSQ9RNxLCtXuuVBFslLg)
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT

After compiling kernel, did u do this in with iptables?

make && make install

Like that, after compiling kernel with the new patch-o-matic patch applied, iptables will recognice (built) new libraries

If u did, make sure to copy the librarys (.so) from /usr/local/lib/netfilter to /lib/netfilter

and try :)

--Boundary_(ID_t7zSQ9RNxLCtXuuVBFslLg)
Content-type: text/html; charset=iso-8859-1
Content-transfer-encoding: 7BIT

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META content="MSHTML 6.00.2800.1226" name=GENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=#ffffff>
<DIV><FONT face=Arial size=2>After compiling kernel, did u do this in with 
iptables?</FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>make &amp;&amp; make install</FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>Like that, after compiling kernel with the new 
patch-o-matic patch applied, iptables will recognice (built) new 
libraries</FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>If u did, make sure to copy the librarys (.so) from 
/usr/local/lib/netfilter to /lib/netfilter</FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>and try :)</FONT></DIV></BODY></HTML>

--Boundary_(ID_t7zSQ9RNxLCtXuuVBFslLg)--

