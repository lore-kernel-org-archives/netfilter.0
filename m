From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: a sort of n00b question here but I'ld like to know.
Date: Mon, 20 Oct 2003 22:34:09 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F949B21.1020804@Loudoun-Fairfax.com>
References: <20031021020302.80084.qmail@web40208.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031021020302.80084.qmail@web40208.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/html; charset="us-ascii"
To: netfilter@lists.netfilter.org

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
SBlaze wrote:<br>
<blockquote type="cite"
 cite="mid20031021020302.80084.qmail@web40208.mail.yahoo.com">
  <pre wrap="">
You be the judge. I start my firewall when the box boots up. Pay special
attention to the UDP rule. Note that in the 11 day up time we have 16 Million
droppped UDP NEW/Invalid packets. Is this enough to choke down a Dual Pentium
Pro 200mhz box?

root@nixn00b:/proc/net# uptime ; iptables -vnL
 21:56:57 up 11 days, 21:21,  4 users,  load average: 0.00, 0.00, 0.00
Chain INPUT (policy ACCEPT 1008K packets, 736M bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DROP       all  --  *      *       68.119.x.x          0.0.0.0/0
    0     0 DROP       all  --  *      *       68.119.x.x       0.0.0.0/0
    0     0 DROP       all  --  *      *       68.119.x.x         0.0.0.0/0
85058 5514K ACCEPT     all  --  eth0   *       68.1.x.x         0.0.0.0/0
 4676  432K ACCEPT     all  --  eth0   *       68.63.x.x        0.0.0.0/0
 9656  639K ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0  
       tcp dpt:80
 309K   20M ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0  
       udp dpt:27015 state NEW,RELATED,ESTABLISHED
 3262  191K DROP       tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0  
       state INVALID,NEW
 288K  427M ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0  
       state RELATED,ESTABLISHED
  16M 1945M DROP       udp  --  eth0   *       0.0.0.0/0            0.0.0.0/0  
       state INVALID,NEW
 6815 1166K ACCEPT     udp  --  eth0   *       0.0.0.0/0            0.0.0.0/0  
       state RELATED,ESTABLISHED
 2767  249K DROP       icmp --  eth0   *       0.0.0.0/0            0.0.0.0/0  
       state INVALID,NEW
  339 24646 ACCEPT     icmp --  eth0   *       0.0.0.0/0            0.0.0.0/0  
       state RELATED,ESTABLISHED

  </pre>
</blockquote>
<br>
Some quick math show that roughly 80% of your total traffic is trapped
by that rule. Ouch! Also, do you really want your default policy to be
accept? It looks like you had 736 Mbytes go to some other (unknown?)
destination on your firewall box.<br>
<br>
Jeff <br>
<br>
</body>
</html>


