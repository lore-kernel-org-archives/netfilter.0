From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Foolish question
Date: Sat, 15 Nov 2003 16:38:40 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FB69CE0.9050707@Loudoun-Fairfax.com>
References: <Law9-F237wyfwjHNuQu00001416@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Law9-F237wyfwjHNuQu00001416@hotmail.com>
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
Meerz 70 wrote:<br>
<blockquote type="cite"
 cite="midLaw9-F237wyfwjHNuQu00001416@hotmail.com">Hello List,
  <br>
I am using RH 7.3 as a proxy serverin an ISP Enviornment.There is a
problem with my users is that they are not able to use other services
like voice chat, sms etc because of my firewall if I give following
configuration in my ipchains it start browsing but stop other services
  <br>
:input ACCEPT
  <br>
:output ACCEPT
  <br>
:forward ACCEPT
  <br>
-A input -p tcp -s 0/0 -d 0/0 80 -j REDIRECT 8080
  <br>
-A input -p tcp -s 0/0 -d x.x.x.x/255.255.255.240 80 -j ACCEPT
  <br>
  <br>
Please help in resolving this issue.I will be grate ful if some one
give me configuration.
  <br>
  <br>
</blockquote>
<br>
I don't know anything about ipchains and very few people still use it.
You really ought to update to iptables; it's included in RH 7.3. <br>
<br>
Jeff<br>
</body>
</html>


