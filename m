From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Source Port
Date: 15 Apr 2003 16:32:13 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050404537.1482.19.camel@india>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Poumfq+7UIPIuWfdlR4r"
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


--=-Poumfq+7UIPIuWfdlR4r
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

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

--=-Poumfq+7UIPIuWfdlR4r
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
Hi Everyone,
<BR>

<BR>
 I am a regular reader of this list and I have absorbed that most of the users won't use the source ports in their rules. Say for ex,
<BR>

<BR>
#iptables -A INPUT -s 192.168.1.0/24 -p tcp -d 0/0 --dport 23 -j ACCEPT
<BR>

<BR>
In these kind of rules they will not specify the source port from 1024 to 65545. I strongly recommend all Linux Users to specify the exact rules what is allowed and what is not allowed.
<BR>

<BR>
Any Comments? This could be a good practise?
<BR>

<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE>-- 
Regards
Dharmendra.T


This message is intended for the addressee only. It may contain privileged or Confidential information. If you have received this message in error,please notify the sender and destroy the message immediately.Unauthorised use or reproduction of this message is strictly prohibited.</PRE>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-Poumfq+7UIPIuWfdlR4r--


