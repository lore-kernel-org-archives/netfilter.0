From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: Two IP add
Date: 05 Jun 2003 17:08:33 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054813152.1206.9.camel@india>
References: <200306051156.45624.pandre@darkstar.nom.za>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-3igxPkK4+O2r5JMBd4lC"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200306051156.45624.pandre@darkstar.nom.za>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Paulo Andre <pandre@darkstar.nom.za>
Cc: netfilter <netfilter@lists.netfilter.org>


--=-3igxPkK4+O2r5JMBd4lC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2003-06-05 at 15:26, Paulo Andre wrote:

    I would like to do the following:
    
    Stop MASQUESRADING to two servers say. 10.10.10.5 and 10.10.10.8, how would i 
    do this with a rule.
    
    iptables -t nat -A POSTROUTING -s x.x.x.x -d ! 'servers ip' -j MASQUERADE 
    now how would i put in two ip address's ?
    
    
    	Hi

 iptables -t nat -A POSTROUTING -s 10.10.10.5 -d 'sever ip' -j DROP
 iptables -t nat -A POSTROUTING -s 10.10.10.8 -d 'sever ip' -j DROP

Should work
-- 
Regards
Dharmendra.T


This message is intended for the addressee only. It may contain
privileged or Confidential information. If you have received this
message in error,please notify the sender and destroy the message
immediately.Unauthorised use or reproduction of this message is strictly
prohibited.

--=-3igxPkK4+O2r5JMBd4lC
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
On Thu, 2003-06-05 at 15:26, Paulo Andre wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I>I would like to do the following:</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Stop MASQUESRADING to two servers say. 10.10.10.5 and 10.10.10.8, how would i </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>do this with a rule.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>iptables -t nat -A POSTROUTING -s x.x.x.x -d ! 'servers ip' -j MASQUERADE </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>now how would i put in two ip address's ?</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT SIZE="3">	Hi</FONT></PRE>
    </BLOCKQUOTE>
<FONT SIZE="3"> iptables -t nat -A POSTROUTING -s 10.10.10.5 -d 'sever ip' -j DROP</FONT>
<BR>
<FONT SIZE="3"> iptables -t nat -A POSTROUTING -s 10.10.10.8 -d 'sever ip' -j DROP</FONT>
<BR>
<FONT SIZE="3"></FONT>
<BR>
<FONT SIZE="3">Should work</FONT>
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

--=-3igxPkK4+O2r5JMBd4lC--


