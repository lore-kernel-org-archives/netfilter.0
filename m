From: Glenn Hancock <ghancock@softeksoftware.com>
Subject: Iptables problem
Date: 13 Aug 2003 13:09:57 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060794597.2054.2.camel@localhost.localdomain>
Reply-To: ghancock@softeksoftware.com
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-S4gBe3IBsT7Ip2G0Z3E5"
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


--=-S4gBe3IBsT7Ip2G0Z3E5
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I have the following setup in my /etc/sysconfig/iptables file.  I start
the iptables service and do a --list and see all my rules.  I can attach
to the computer from outside so I know that the incoming rules work,
however, I can not perform any outgoing tasks.  No pings, no ssh no
nothing.

Can someone please explain why this is not working?

*filter
-A INPUT -p tcp --dport 110 --syn -j ACCEPT
-A INPUT -p tcp --dport 42 --syn -j ACCEPT
-A INPUT -p tcp --dport 7777 --syn -j ACCEPT
-A INPUT -p tcp --dport 7775 --syn -j ACCEPT
-A INPUT -p tcp --dport 22 --syn -j ACCEPT
-A INPUT -p tcp --dport 80 --syn -j ACCEPT
-A INPUT -p udp --dport 53 -j ACCEPT
-A INPUT -p udp --dport 42 -j ACCEPT
-A INPUT -p tcp --syn -j REJECT
-A INPUT -p udp -j REJECT
COMMIT


Thanks,

-- 
Glenn Hancock
SofTek Software International, Inc.
813 Pavilion Court
T: 678-583-5720
I: ghancock@softeksoftware.com
www.softeksoftware.com
www.Spambite.com
NOTE: My email address is currently protected by Spambite. If
you send me an email, you will be asked to validate your email
address on the Spambite network AND re-send you original email
to me. Or, you can pro-actively register your email address on
the Spambite network by visiting the website:
www.spambite.com
When visiting the website, please feel free to look around to
learn about this exciting new technology.

--=-S4gBe3IBsT7Ip2G0Z3E5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.0.7">
</HEAD>
<BODY>
I have the following setup in my /etc/sysconfig/iptables file.&nbsp; I start the iptables service and do a --list and see all my rules.&nbsp; I can attach to the computer from outside so I know that the incoming rules work, however, I can not perform any outgoing tasks.&nbsp; No pings, no ssh no nothing.<BR>
<BR>
Can someone please explain why this is not working?<BR>
<BR>
*filter<BR>
-A INPUT -p tcp --dport 110 --syn -j ACCEPT<BR>
-A INPUT -p tcp --dport 42 --syn -j ACCEPT<BR>
-A INPUT -p tcp --dport 7777 --syn -j ACCEPT<BR>
-A INPUT -p tcp --dport 7775 --syn -j ACCEPT<BR>
-A INPUT -p tcp --dport 22 --syn -j ACCEPT<BR>
-A INPUT -p tcp --dport 80 --syn -j ACCEPT<BR>
-A INPUT -p udp --dport 53 -j ACCEPT<BR>
-A INPUT -p udp --dport 42 -j ACCEPT<BR>
-A INPUT -p tcp --syn -j REJECT<BR>
-A INPUT -p udp -j REJECT<BR>
COMMIT<BR>
<BR>
<BR>
Thanks,<BR>
<BR>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE>-- 
Glenn Hancock
SofTek Software International, Inc.
813 Pavilion Court
T: 678-583-5720
I: ghancock@softeksoftware.com
www.softeksoftware.com
www.Spambite.com
NOTE: My email address is currently protected by Spambite. If
you send me an email, you will be asked to validate your email
address on the Spambite network AND re-send you original email
to me. Or, you can pro-actively register your email address on
the Spambite network by visiting the website:
www.spambite.com
When visiting the website, please feel free to look around to
learn about this exciting new technology.</PRE>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-S4gBe3IBsT7Ip2G0Z3E5--


