From: Gerd Zemella <gzemella@gmx.net>
Subject: Re: Port forwarding doesn't work.
Date: Mon, 13 Oct 2003 09:13:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066029196.4010.1.camel@Marvin>
References: <LFEHKEBEBHAFGJBMNKAOKELACCAA.markee@bandwidthco.com>
	 <200310121411.00898.Herman@AerospaceSoftware.com>
	 <1065994862.3562.10.camel@Marvin>
	 <200310121604.06545.Herman@AerospaceSoftware.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-wcWR9vdvKkli7Lxdegsq"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200310121604.06545.Herman@AerospaceSoftware.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Herman@AerospaceSoftware.com
Cc: netfilter@lists.netfilter.org


--=-wcWR9vdvKkli7Lxdegsq
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Herman,

Am Mon, den 13.10.2003 schrieb Herman um 00:04:

> Well, here goes:
> iptables -t nat -I PREROUTING  -d 192.168.10.100 -j DNAT --to 192.168.10.245

did you wrote this --to? you must write --to-destination!


> iptables: Target problem
> 
> At least, now the error message changed and the only difference from before is 
> the -I instead of -A.
> 
> So, with -A, I get Invalid Argument, and with -I, I get Target Problem.  Both 
> cases don't work and the rule doesn't get added.
> 
> Can anybody give me a clue?
> 
> Cheers,

--=-wcWR9vdvKkli7Lxdegsq
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.0.9">
</HEAD>
<BODY>
Hi Herman,<BR>
<BR>
Am Mon, den 13.10.2003 schrieb Herman um 00:04:
<BLOCKQUOTE TYPE=CITE>
<PRE><FONT COLOR="#737373"><I>Well, here goes:
iptables -t nat -I PREROUTING&nbsp; -d 192.168.10.100 -j DNAT --to 192.168.10.245</I></FONT></PRE>
</BLOCKQUOTE>
did you wrote this --to? you must write --to-destination!<BR>
<BR>
<BLOCKQUOTE TYPE=CITE>
<PRE><FONT COLOR="#737373"><I>iptables: Target problem

At least, now the error message changed and the only difference from before is 
the -I instead of -A.

So, with -A, I get Invalid Argument, and with -I, I get Target Problem.  Both 
cases don't work and the rule doesn't get added.

Can anybody give me a clue?

Cheers,</I></FONT></PRE>
</BLOCKQUOTE>
</BODY>
</HTML>

--=-wcWR9vdvKkli7Lxdegsq--


