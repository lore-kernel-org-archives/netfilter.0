From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: my iptables rules is not work for DNAT redirect to internal IP
Date: Thu, 30 Oct 2003 23:16:13 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FA1E20D.8000805@Loudoun-Fairfax.com>
References: <oprxxu5bepxfqk2w@10.20.1.181>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <oprxxu5bepxfqk2w@10.20.1.181>
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
Phiphat Watanasard [KLIM] wrote:<br>
<blockquote type="cite" cite="midoprxxu5bepxfqk2w@10.20.1.181">Dear
sir/madam
  <br>
&nbsp;&nbsp;&nbsp;&nbsp;my this iptables rules is not work but this rules useto use on
yesterday
  <br>
but this day my mechine is reboot (Power down) and boot again but
cannot work
  <br>
i compile kernel to 2.4.22 and update iptables to 1.2.9.rc1 please help
me
  <br>
</blockquote>
<br>
Did it stop working before you installed the new kernel? If this is
true, you need to find out what was different after the reboot. Make
sure IP forwarding is enabled and all of the modules have loaded
correctly. When you run your script what error do you get?<br>
<br>
Jeff<br>
</body>
</html>


