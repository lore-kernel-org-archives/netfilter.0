From: Ryan Daly <daly@ctcgsc.org>
Subject: Re: making services invisible
Date: 10 Oct 2002 09:25:28 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1034256328.549.41.camel@linux13.ctcgsc.org>
References: <3DA57D10.8040904@bol.com.br>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Dfc73hjCcLqiBciLkDAH"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DA57D10.8040904@bol.com.br>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Julio Cesar Ody <julioody@bol.com.br>, netfilter@lists.netfilter.org


--=-Dfc73hjCcLqiBciLkDAH
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Use DROP instead of REJECT.

REJECT action tells tables to send back an ICMP message indicating that
you're REJECTing the packet.  DROPing will just DROP with no further
action.

--

On Thu, 2002-10-10 at 09:13, Julio Cesar Ody wrote:

    Hello. I'm using Slackware 8.1, kernel 2.4.18 and iptables v1.2.7a. I 
    blocked external acess to some services using the following rule:
    
    iptables -A INPUT -i ! eth0 -p tcp -m multiport --destination-port 
    <port1>,<port2>,<blablabla> -j REJECT
    
    However, when I perform a stealth scan using nmap on my host, I still 
    can see them running, but instead of "opened" I get them as "filtered". 
    Is there a way to block these results, making the services literally 
    invisible ? Appreciate any help, and also any technical information 
    (links, docs) regarding the answer.
    
    
    
    Julio Cesar Ody

--=-Dfc73hjCcLqiBciLkDAH
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
Use DROP instead of REJECT.
<BR>

<BR>
REJECT action tells tables to send back an ICMP message indicating that you're REJECTing the packet.&nbsp; DROPing will just DROP with no further action.
<BR>

<BR>
--
<BR>

<BR>
On Thu, 2002-10-10 at 09:13, Julio Cesar Ody wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#505357"><FONT SIZE="3"><I>Hello. I'm using Slackware 8.1, kernel 2.4.18 and iptables v1.2.7a. I </FONT></FONT></I>
<FONT COLOR="#505357"><FONT SIZE="3"><I>blocked external acess to some services using the following rule:</FONT></FONT></I>
<FONT COLOR="#505357"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#505357"><FONT SIZE="3"><I>iptables -A INPUT -i ! eth0 -p tcp -m multiport --destination-port </FONT></FONT></I>
<FONT COLOR="#505357"><FONT SIZE="3"><I>&lt;port1&gt;,&lt;port2&gt;,&lt;blablabla&gt; -j REJECT</FONT></FONT></I>
<FONT COLOR="#505357"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#505357"><FONT SIZE="3"><I>However, when I perform a stealth scan using nmap on my host, I still </FONT></FONT></I>
<FONT COLOR="#505357"><FONT SIZE="3"><I>can see them running, but instead of &quot;opened&quot; I get them as &quot;filtered&quot;. </FONT></FONT></I>
<FONT COLOR="#505357"><FONT SIZE="3"><I>Is there a way to block these results, making the services literally </FONT></FONT></I>
<FONT COLOR="#505357"><FONT SIZE="3"><I>invisible ? Appreciate any help, and also any technical information </FONT></FONT></I>
<FONT COLOR="#505357"><FONT SIZE="3"><I>(links, docs) regarding the answer.</FONT></FONT></I>
<FONT COLOR="#505357"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#505357"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#505357"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#505357"><FONT SIZE="3"><I>Julio Cesar Ody</FONT></FONT></I></PRE>
    </BLOCKQUOTE>
</BODY>
</HTML>

--=-Dfc73hjCcLqiBciLkDAH--

