From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: help with routing/firewall
Date: Thu, 18 Dec 2003 13:19:57 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FE1EFCD.2050307@Loudoun-Fairfax.com>
References: <20031218180112.66315.qmail@web20419.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031218180112.66315.qmail@web20419.mail.yahoo.com>
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
Fred Gurn wrote:<br>
<blockquote type="cite"
 cite="mid20031218180112.66315.qmail@web20419.mail.yahoo.com">
  <div>Hi,</div>
  <div>I have set up suse linux as bridge/firewall.</div>
  <div>Simple configuration. </div>
  <div>eth0 internet</div>
  <div>eth1 local net</div>
  <div>Everything accepted from eth1, nothing from eth0, traffic from
eth1 is routed to internet.</div>
  <div>IP forwarding is enabled.</div>
  <div>From local net I can ping eth1 and eth0 (that means machine is
routing packets), but I cant go outside eth0. Same happens when ther is
no firewall. What's the problem with routing?</div>
</blockquote>
<br>
You've answered your own question. You have a problem with routing.
Check the default routes on your LAN and make sure they point to the
firewall box.<br>
<blockquote type="cite"
 cite="mid20031218180112.66315.qmail@web20419.mail.yahoo.com">
  <div>What comands can I use to monitor what is happening with packets?</div>
</blockquote>
<br>
Insert LOG rules in the ruleset and then check for entries in
/var/log/messages. You can use LOG just like any other target. Until
you fix the routing issue you can't do much with iptables.<br>
<br>
Jeff<br>
<br>
</body>
</html>


