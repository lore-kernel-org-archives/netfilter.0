From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: Installing iptables 1.2.8 in a SUSE 8.1
Date: 08 Sep 2003 11:29:45 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063000795.831.31.camel@india.nsecure.net>
References: <89DFDF0DBB95BF47AB7A83A5A72FC402416559@ntmail5.corp.ute.com.uy>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-LYQhBRhCUA32h5Ehupow"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <89DFDF0DBB95BF47AB7A83A5A72FC402416559@ntmail5.corp.ute.com.uy>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Fried Melgar, Gustavo" <GFried@ute.com.uy>
Cc: netfilter@lists.netfilter.org


--=-LYQhBRhCUA32h5Ehupow
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2003-09-05 at 20:22, Fried Melgar, Gustavo wrote:

    Hi all,
     
    I want to upgrade my SUSE 8.1 (with 2.4.19 kernel) from iptables 1.2.7 to iptableas 1.2.8. But also I want to install some patches to the kernel (kernel-source-2.4.19.SuSE-340.i586.patch.rpm )

Patch the kernel and then install the new kernel and then install
iptables.  

     
    I don't know in which order I have to do that.
    Do I have to install the SUSE's patch first, then iptables 1.2.8 and at last patch-o-matic? Is this the right order to install this patches?
    Do I need to install patch-o-matic-20030107 (I don't need extra options)

If you don't want this option you don't have to patch this.

    
    Do I have to recompile the kernel each time I modify the kernel source or can I recompile it at the end?

Whatever the chnges you make in the kernel source will only be reflected
when you compile and install it. 

    Do you have any other suggestions for this task?

no

     
    Best regards and thank you in advance,
    Gustavo

-- 
Regards
Dharmendra.T
dharmu@nsecure.net
Linux Security and Admin

--=-LYQhBRhCUA32h5Ehupow
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
On Fri, 2003-09-05 at 20:22, Fried Melgar, Gustavo wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I>Hi all,</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I> </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>I want to upgrade my SUSE 8.1 (with 2.4.19 kernel) from iptables 1.2.7 to iptableas 1.2.8. But also I want to install some patches to the kernel (kernel-source-2.4.19.SuSE-340.i586.patch.rpm )</FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<FONT SIZE="3">Patch the kernel and then install the new kernel and then install iptables.&nbsp; </FONT>
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I> </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>I don't know in which order I have to do that.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Do I have to install the SUSE's patch first, then iptables 1.2.8 and at last patch-o-matic? Is this the right order to install this patches?</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Do I need to install patch-o-matic-20030107 (I don't need extra options)</FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<FONT SIZE="3">If you don't want this option you don't have to patch this.</FONT>
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Do I have to recompile the kernel each time I modify the kernel source or can I recompile it at the end?</FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<FONT SIZE="3">Whatever the chnges you make in the kernel source will only be reflected when you compile and install it. </FONT>
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I>Do you have any other suggestions for this task?</FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<FONT SIZE="3">no</FONT>
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I> </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Best regards and thank you in advance,</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Gustavo</FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE>-- 
Regards
Dharmendra.T
dharmu@nsecure.net
Linux Security and Admin</PRE>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-LYQhBRhCUA32h5Ehupow--


