From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: Firewall performance querry
Date: 09 Sep 2003 12:36:44 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063091215.9187.4.camel@india.nsecure.net>
References: <20030905062950.M87452@ahm.cmc.net.in> 
	<20030909053404.M44692@ahm.cmc.net.in>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-0uJ3EoVJewRq9+Bcbwa6"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030909053404.M44692@ahm.cmc.net.in>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Pradeep Bhomia <pradeepbhomia@ahm.cmc.net.in>
Cc: netfilter@lists.netfilter.org


--=-0uJ3EoVJewRq9+Bcbwa6
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2003-09-09 at 11:21, Pradeep Bhomia wrote:

    Hello Friends,
    
    I have recently setup an iptables based firewall and put a Sendmail server 
    behind firewall (although after facing some problems and with help from 
    friends in this mailling list). Now I want to put a proxy server behind this 
    same firewall. Right now the proxy server is connected directly to the 
    internet. Before moving ahead I want to know what will be the load on the 
    firewall. The configuration of firewall box is P4, ~1.8GHz, 256MB RAM, 
    Mandrake Linux 9.1, IPTables 1.2.7 and Shorewall 1.3.14. I will be having 
    aroung 300-400 concurrent users. I plan to setup NATting. Can anybody help me 
    in this regard. Whether NATting will be sufficient to take care about this 
    load or some other method can be used ( Total load on firewall will be some 
    1000 email accounts on sendmail server and around 400 clients for web 
    browsing). If anybody can direct me to some websites having some sort of 
    statistics for iptables.
    
    Thanks a lot,
    
    Pradeep Bhomia
    

See basically the firewall will not process much of your traffic, which
simply forwards the packets. So the currnet configuration for
firewalling is sufficient for iptables.
And you have to use natting if you are placing the proxy server before
the firewall. 
-- 
Regards
Dharmendra.T
dharmu@nsecure.net
Linux Security and Admin

--=-0uJ3EoVJewRq9+Bcbwa6
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
On Tue, 2003-09-09 at 11:21, Pradeep Bhomia wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I>Hello Friends,</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>I have recently setup an iptables based firewall and put a Sendmail server </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>behind firewall (although after facing some problems and with help from </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>friends in this mailling list). Now I want to put a proxy server behind this </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>same firewall. Right now the proxy server is connected directly to the </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>internet. Before moving ahead I want to know what will be the load on the </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>firewall. The configuration of firewall box is P4, ~1.8GHz, 256MB RAM, </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Mandrake Linux 9.1, IPTables 1.2.7 and Shorewall 1.3.14. I will be having </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>aroung 300-400 concurrent users. I plan to setup NATting. Can anybody help me </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>in this regard. Whether NATting will be sufficient to take care about this </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>load or some other method can be used ( Total load on firewall will be some </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>1000 email accounts on sendmail server and around 400 clients for web </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>browsing). If anybody can direct me to some websites having some sort of </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>statistics for iptables.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Thanks a lot,</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Pradeep Bhomia</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<FONT SIZE="3">See basically the firewall will not process much of your traffic, which simply forwards the packets. So the currnet configuration for firewalling is sufficient for iptables.</FONT>
<BR>
<FONT SIZE="3">And you have to use natting if you are placing the proxy server before the firewall. </FONT>
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

--=-0uJ3EoVJewRq9+Bcbwa6--


