From: Oscar Arranz <oarranz@riafinancial.com>
Subject: Re: Iptables don't block traffic
Date: Thu, 22 Apr 2004 19:03:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4087FAC9.7000300@riafinancial.com>
References: <4087CE5F.5030503@riafinancial.com> <200404221546.14351.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404221546.14351.Antony@Soft-Solutions.co.uk>
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
OK, I saw the problem. The default for FORWARD chain is another chain
called block and its rules don't block this traffic.<br>
<br>
Thanks for your interest.<br>
<br>
Oscar<br>
<br>
Antony Stone wrote:<br>
<blockquote type="cite"
 cite="mid200404221546.14351.Antony@Soft-Solutions.co.uk">
  <pre wrap="">On Thursday 22 April 2004 2:53 pm, Oscar Arranz wrote:

  </pre>
  <blockquote type="cite">
    <pre wrap="">    I have a Red Hat box running as a firewall in my network. It's
working fine, but now I'm doing tests in order to block certain Internet
traffic. I've added the following rules which should drop packets from
my PC to a known public IP (a web server):

iptables -A FORWARD -s 192.138.35.110 -d 193.110.128.200 -j DROP

    But the packets are not droped because I still can connect to the
web server.

    The default rule for FORWARD chain is DROP

   Any ideas?
    </pre>
  </blockquote>
  <pre wrap=""><!---->
You say you have added the above rule.

But, what have you added it *to*?

In other words, what other rules do you also have running on the machine?

That information would help us greatly in answering your question.

Regards,

Antony

  </pre>
</blockquote>
</body>
</html>



