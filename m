From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: iptables logs going to all ttys
Date: Mon, 13 Oct 2003 19:55:19 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F8B3B67.9090204@Loudoun-Fairfax.com>
References: <3F8B2E19.7090601@webone.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F8B2E19.7090601@webone.com.au>
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
To: iptables mailing list <netfilter@lists.netfilter.org>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
lucas wrote:<br>
<blockquote type="cite" cite="mid3F8B2E19.7090601@webone.com.au">Morning
all,
  <br>
  <br>
I have the following in my firewall script, and to my knowledge this is
meant to stop all logs from going to all ttys but this is not the case
and its a real *pain* in the ass.
  <br>
  <br>
$IPTABLES -N drop-and-log-it
  <br>
$IPTABLES -A drop-and-log-it -j LOG --log-level info
  <br>
$IPTABLES -A drop-and-log-it -j DROP
  <br>
  <br>
If someone could give me a hint as to what i have overlooked that would
be much appreciated, thanks
  <br>
  <br>
</blockquote>
<br>
Iptables logging is handled by syslog and the output will go to the
same tty/file as the rest of the kernel messages. Your chain sets the
log level to kern.info, logs the packet, then drops it. To change the
output you can edit your /etc/syslog.conf file.<br>
<br>
Jeff<br>
<br>
</body>
</html>


