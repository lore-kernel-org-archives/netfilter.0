From: Fabien LE BLEVEC <fleblevec@nerim.net>
Subject: Re: NAT Host down and ICMP host unreachable
Date: Fri, 02 Jan 2004 16:53:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FF593F7.5040600@nerim.net>
References: <20031223063726.83624.qmail@web13421.mail.yahoo.com> <200401021325.09089.Antony@Soft-Solutions.co.uk>
Reply-To: fleblevec@nerim.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401021325.09089.Antony@Soft-Solutions.co.uk>
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
Cc: netfilter@lists.netfilter.org

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body>
<br>
<br>
Antony Stone a &eacute;crit&nbsp;:<br>
<blockquote type="cite"
 cite="mid200401021325.09089.Antony@Soft-Solutions.co.uk">
  <pre wrap="">On Tuesday 23 December 2003 6:37 am, JC wrote:

  </pre>
  <blockquote type="cite">
    <pre wrap="">Hello Everybody,

I apologize if you've seen something like this but
searching on something similar to the subject line
above has turned up nill.

Scenario

HostA ------&gt; FW/NAT -----(port translation) ---&gt;
HOSTB
(10.10.1.1)
(192.168.7.1)

Rules:
iptables -A PREROUTING -t nat -p tcp --dport 80 -j
DNAT --to 192.168.7.1:80
iptables -A FORWARD -p tcp -d 192.168.7.1 --dport 80
-j ACCEPT

So everything works, but when HostB goes down for
maintence or from a DOS or whatevever FW/NAT will send
an ICMP host unreachable with the natted address to
HostA.

I suppose I'm correct in perceiving that this behavior
is normal, so I'll have to ask how do some of you
people go about dealing with situations such as these?
    </pre>
  </blockquote>
  <pre wrap=""><!---->
I don't understand the question.

If host B is down, then "host unreachable" is quite correct.
  </pre>
</blockquote>
Yes of course !<br>
<blockquote type="cite"
 cite="mid200401021325.09089.Antony@Soft-Solutions.co.uk">
  <pre wrap="">
What behaviour would you expect, and what problem do you have with what 
happens at present?
  </pre>
</blockquote>
But, the data contains in the ICMP host unreachable messages have the
natted IP .... <br>
<br>
<blockquote type="cite"
 cite="mid200401021325.09089.Antony@Soft-Solutions.co.uk">
  <pre wrap="">
Antony.
  </pre>
</blockquote>
<br>
Fabien<br>
</body>
</html>



