From: Eugene Joubert <eugenej@centratel.co.za>
Subject: RE: iptables -L *very* slow
Date: Mon, 17 Feb 2003 08:14:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B848917C9D07D71199C5005004D778B8017B56@TELECOMS04>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2D64B.DD6FD420"
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
To: 'Jean-Christian Imbeault' <jc@mega-bucks.co.jp>, netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2D64B.DD6FD420
Content-Type: text/plain

Try using iptables -n -L "whatever"

It may be trying to do reverse lookups.

Hope this helps

-----Original Message-----
From: Jean-Christian Imbeault [mailto:jc@mega-bucks.co.jp] 
Sent: 17 02 2003 07:36 AM
To: netfilter@lists.netfilter.org
Subject: iptables -L *very* slow


When I try and print out my iptable rules using iptables -L, it takes 
about three minutes for the rules to print out (and there are only 9 of 
them).

Why is does this take so long? Is this a bug?

I am using the newest version of iptables with a custom 2.4.20 kernel.

Thanks!

jc


------_=_NextPart_001_01C2D64B.DD6FD420
Content-Type: text/html

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=us-ascii">
<META NAME="Generator" CONTENT="MS Exchange Server version 5.5.2653.12">
<TITLE>RE: iptables -L *very* slow</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=2>Try using iptables -n -L &quot;whatever&quot;</FONT>
</P>

<P><FONT SIZE=2>It may be trying to do reverse lookups.</FONT>
</P>

<P><FONT SIZE=2>Hope this helps</FONT>
</P>

<P><FONT SIZE=2>-----Original Message-----</FONT>
<BR><FONT SIZE=2>From: Jean-Christian Imbeault [<A HREF="mailto:jc@mega-bucks.co.jp">mailto:jc@mega-bucks.co.jp</A>] </FONT>
<BR><FONT SIZE=2>Sent: 17 02 2003 07:36 AM</FONT>
<BR><FONT SIZE=2>To: netfilter@lists.netfilter.org</FONT>
<BR><FONT SIZE=2>Subject: iptables -L *very* slow</FONT>
</P>
<BR>

<P><FONT SIZE=2>When I try and print out my iptable rules using iptables -L, it takes </FONT>
<BR><FONT SIZE=2>about three minutes for the rules to print out (and there are only 9 of </FONT>
<BR><FONT SIZE=2>them).</FONT>
</P>

<P><FONT SIZE=2>Why is does this take so long? Is this a bug?</FONT>
</P>

<P><FONT SIZE=2>I am using the newest version of iptables with a custom 2.4.20 kernel.</FONT>
</P>

<P><FONT SIZE=2>Thanks!</FONT>
</P>

<P><FONT SIZE=2>jc</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2D64B.DD6FD420--

