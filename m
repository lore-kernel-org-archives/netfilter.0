From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: Blocking Squid Requests
Date: 09 May 2003 09:43:47 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052453632.1070.1.camel@india>
References: <001801c31490$fd031670$7107a8c0@maninho>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-I7NSE4Ihst56kt7psxQt"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001801c31490$fd031670$7107a8c0@maninho>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Walter Priesnitz Filho <walterp@via-rs.net>
Cc: IPTables <netfilter@lists.netfilter.org>


--=-I7NSE4Ihst56kt7psxQt
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

 It is better to add the acls on the squid than on the firewall. Proxy
servers will give good performance compared to the firewalls in acls.

Regards
Dharmu

On Wed, 2003-05-07 at 17:35, Walter Priesnitz Filho wrote:

    Hi,
    I have this environment, a subnetwork (192.168.0.0) that access another
    subnetwork (192.168.59.0) and then access the internet. The second lan has a
    proxy server (squid:3128).
    I need to block the requests in th first lan to the squid server to some
    sites. How can I do this?
    I've tried this
    iptables  -A FORWARD -p tcp -m multiport --dport 80,443,3128 -d
    www.someplace.com -j DROP
    but doesn't work.
    Can anybody help-me?
    
    Regards,
          Walter
    --------------------------------------------
      Walter Priesnitz Filho - UIN 121745902
      http://camva.ucs.br/~walterp/
      Linux user 268789 - http://counter.li.org/
    --------------------------------------------



--=-I7NSE4Ihst56kt7psxQt
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
Hi,
<BR>

<BR>
 It is better to add the acls on the squid than on the firewall. Proxy servers will give good performance compared to the firewalls in acls.
<BR>

<BR>
Regards
<BR>
Dharmu
<BR>

<BR>
On Wed, 2003-05-07 at 17:35, Walter Priesnitz Filho wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#737373"><FONT SIZE="3"><I>Hi,</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>I have this environment, a subnetwork (192.168.0.0) that access another</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>subnetwork (192.168.59.0) and then access the internet. The second lan has a</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>proxy server (squid:3128).</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>I need to block the requests in th first lan to the squid server to some</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>sites. How can I do this?</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>I've tried this</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>iptables  -A FORWARD -p tcp -m multiport --dport 80,443,3128 -d</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>www.someplace.com -j DROP</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>but doesn't work.</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Can anybody help-me?</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Regards,</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>      Walter</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>--------------------------------------------</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>  Walter Priesnitz Filho - UIN 121745902</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>  http://camva.ucs.br/~walterp/</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>  Linux user 268789 - http://counter.li.org/</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>--------------------------------------------</FONT></FONT></I></PRE>
    </BLOCKQUOTE>

</BODY>
</HTML>

--=-I7NSE4Ihst56kt7psxQt--


