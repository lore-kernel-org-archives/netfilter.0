From: Gerd Zemella <gzemella@gmx.net>
Subject: Re: Port forwarding doesn't work.
Date: Sun, 12 Oct 2003 23:41:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065994862.3562.10.camel@Marvin>
References: <LFEHKEBEBHAFGJBMNKAOKELACCAA.markee@bandwidthco.com>
	 <200310121218.25934.Herman@AerospaceSoftware.com>
	 <200310121411.00898.Herman@AerospaceSoftware.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-ZF4JmZ5TAhcfit/xx6lx"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200310121411.00898.Herman@AerospaceSoftware.com>
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


--=-ZF4JmZ5TAhcfit/xx6lx
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Herman,

did you try something like
 
iptables -t nat -I PREROUTING  -d x.x.x.x -j DNAT --to destination
y.y.y.y

where you can add also protocol,port.....
Important is also that the destination machine routes back the packets
via the nat machine or you must specify an additional POSTROUTING roule
so that it looks for the destination machine that the pakets are
originated from the nat machine. 
Perhaps an example to the PREROUTING roule.

iptables -t nat -I POSTROUTING -d y.y.y.y -j SNAT --to-source z.z.z.z
then z.z.z.z should be bind to the natting machine.

works for iptables 1.2.7a

greetings 
Gerd

Am Son, den 12.10.2003 schrieb Herman um 22:11:

> Has anybody got me a *working* port forwarding rule please???
> 
> This thing is driving me nuts, since the rules straight from the manuals don't 
> work with 1.2.7a or 1.2.9rc1.
> 
> Cheers,

--=-ZF4JmZ5TAhcfit/xx6lx
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
did you try something like<BR>
 <BR>
iptables -t nat -I PREROUTING&nbsp; -d x.x.x.x -j DNAT --to destination y.y.y.y<BR>
<BR>
where you can add also protocol,port.....<BR>
Important is also that the destination machine routes back the packets via the nat machine or you must specify an additional POSTROUTING roule so that it looks for the destination machine that the pakets are originated from the nat machine. <BR>
Perhaps an example to the PREROUTING roule.<BR>
<BR>
iptables -t nat -I POSTROUTING -d y.y.y.y -j SNAT --to-source z.z.z.z<BR>
then z.z.z.z should be bind to the natting machine.<BR>
<BR>
works for iptables 1.2.7a<BR>
<BR>
greetings <BR>
Gerd<BR>
<BR>
Am Son, den 12.10.2003 schrieb Herman um 22:11:
<BLOCKQUOTE TYPE=CITE>
<PRE><FONT COLOR="#737373"><I>Has anybody got me a *working* port forwarding rule please???

This thing is driving me nuts, since the rules straight from the manuals don't 
work with 1.2.7a or 1.2.9rc1.

Cheers,</I></FONT></PRE>
</BLOCKQUOTE>
</BODY>
</HTML>

--=-ZF4JmZ5TAhcfit/xx6lx--


