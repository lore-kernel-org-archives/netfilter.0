From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: How to NAT inside a LAN over a single Interface
Date: Fri, 19 Dec 2003 12:26:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FE334BE.6010408@Loudoun-Fairfax.com>
References: <3FE226DA.5080005@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FE226DA.5080005@gmx.net>
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
Dietmar Hofer wrote:<br>
<blockquote type="cite" cite="mid3FE226DA.5080005@gmx.net">I haven't
found anythink clearing my problem doing some research in this list,
nevertheless I'm sorry if you find my question annoying 'cos I'm quite
new to this issue.
  <br>
  <br>
I'm in a class B LAN and would make a Machine work as Gateway for
another, both in the same network. This because the Internet Gateway
accepts only requests of registered Interfaces (MAC-based).
  <br>
The Machine which I want to let do this has only one eth-Interface.
what in theory should be enough.
  <br>
I set up NAT with "iptables -t nat -A POSTROUTING -o eth0 -j
MASQUERADE" and changed the route on the source machine to use the
other as gateway.
  <br>
When pinging from the source machine, "/var/log/syslog" on the gateway
shows me this requests:
  <br>
  <br>
Dec 18 22:42:44 hogwart kernel: IN=eth0 OUT=eth0 SRC=192.168.2.201
DST=192.168.2.150 LEN=8
  <br>
4 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=7294
SEQ=1
  <br>
  <br>
But I don't get an answer on the source machine, (while naturally i can
ping the given IP from the gateway itself).
  <br>
In a HOWTO I found the hint that doing NAT with only 1 Interface for
input and output may not work with this config 'cos since kernel 2.4
some sort of ICMP redirections doesn't work or so...
  <br>
  <br>
What I want to know is just what I've to do to use this machine as
gateway with only one interface.
  <br>
Hope you can help
  <br>
</blockquote>
<br>
I'm afraid I've never heard of a configuration where you use the same
NIC for both input and output. I doubt this would work for numerous
reasons, but even if it did, why bother? A NIC is $19.95 and a patch
cable is a few bucks. Wouldn't it be much easier to install another NIC
and avoid all the routing headaches?<br>
<br>
Jeff<br>
<br>
</body>
</html>


