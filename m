From: Cyril COUPEL <cyril@coupel.homelinux.org>
Subject: Transparent Proxy
Date: 25 Nov 2002 14:04:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038229462.2864.11.camel@sc1.coupel>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-IbFNvtuP4ujFDc8U7lXw"
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


--=-IbFNvtuP4ujFDc8U7lXw
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi all,
First here is my network architecture:
3 Linux Box, B act has router (A and C can even be a group of PCs):

------     ------     ------
|  A  |----|  B  |----|  C  |
------     ------     ------

I need to REDIRECT (DNAT) the traffic from A to B, to a kind of PROXY,
and then forward it to C.

For it, I need to retreave on B the real server address requested by A
to open a new connection from B to C.

My Question is:
How to retreave  the conntrack informations for a connection, without
parsing the /proc/net/ipv4/ip_conntrack?

Thank in advance.
-- 
Cyril COUPEL <cyril@coupel.homelinux.org>

--=-IbFNvtuP4ujFDc8U7lXw
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.1.6">
</HEAD>
<BODY>
Hi all,<BR>
First here is my network architecture:<BR>
3 Linux Box, B act has router (A and C can even be a group of PCs):<BR>
<BR>
------&nbsp;&nbsp;&nbsp;&nbsp; ------&nbsp;&nbsp;&nbsp;&nbsp; ------<BR>
|&nbsp; A&nbsp; |----|&nbsp; B&nbsp; |----|&nbsp; C&nbsp; |<BR>
------&nbsp;&nbsp;&nbsp;&nbsp; ------&nbsp;&nbsp;&nbsp;&nbsp; ------<BR>
<BR>
I need to REDIRECT (DNAT) the traffic from A to B, to a kind of PROXY, and then forward it to C.<BR>
<BR>
For it, I need to retreave on B the real server address requested by A to open a new connection from B to C.<BR>
<BR>
My Question is:<BR>
How to retreave&nbsp; the conntrack informations for a connection, without parsing the /proc/net/ipv4/ip_conntrack?<BR>
<BR>
Thank in advance.<BR>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
-- <BR>
Cyril COUPEL &lt;<A HREF="mailto:cyril@coupel.homelinux.org">cyril@coupel.homelinux.org</A>&gt;
</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-IbFNvtuP4ujFDc8U7lXw--


