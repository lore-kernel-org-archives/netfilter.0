From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Iptables issue with EPSV FTP
Date: Mon, 03 Nov 2003 18:41:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FA6E78F.6070703@Loudoun-Fairfax.com>
References: <659503E2-0E4F-11D8-9512-0050E425B26F@yourhost.com> <20031103235737.0bb8b430.netfilter@schuetter.org> <F64DE249-0E52-11D8-9512-0050E425B26F@yourhost.com> <3FA6E36C.1020606@Loudoun-Fairfax.com> <6D5119D8-0E55-11D8-9512-0050E425B26F@yourhost.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6D5119D8-0E55-11D8-9512-0050E425B26F@yourhost.com>
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
To: Matt Kotich <matt@yourhost.com>, Netfilter Mail List <netfilter@lists.netfilter.org>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
Matt Kotich wrote:<br>
<blockquote type="cite"
 cite="mid6D5119D8-0E55-11D8-9512-0050E425B26F@yourhost.com">Now we've
got:
  <br>
  <br>
[root@server root]# lsmod ip_conntrack_ftp
  <br>
Module&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Size&nbsp; Used by&nbsp;&nbsp;&nbsp; Not tainted
  <br>
ip_conntrack_ftp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5312&nbsp;&nbsp; 0&nbsp; (unused)
  <br>
  <br>
Do I need to turn it on?
  <br>
  <br>
</blockquote>
No, it's loaded but it's not being used. Are your rules loaded? Have
you tried to ftp?<br>
<br>
Jeff<br>
</body>
</html>


