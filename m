From: Fallucchi Antonio <fallucch@cisbic.com>
Subject: Re: ip_conntrack_max
Date: Thu, 08 Jul 2004 12:31:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40ED226E.8070808@cisbic.com>
References: <40ED161F.5070804@cisbic.com> <200407081056.14826.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407081056.14826.Antony@Soft-Solutions.co.uk>
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
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
  <title></title>
</head>
<body bgcolor="#ffffff" text="#000000">
Antony Stone wrote:
<blockquote cite="mid200407081056.14826.Antony@Soft-Solutions.co.uk"
 type="cite">
  <pre wrap="">On Thursday 08 July 2004 10:38 am, Fallucchi Antonio wrote:

  </pre>
  <blockquote type="cite">
    <pre wrap="">hi

i have the problem width "ip_conntrack: table full, dropping packet."

what is the good and max dimension  of the ip_conntrack_max ?
    </pre>
  </blockquote>
  <pre wrap=""><!---->
The answer to this depends on:

1. How many connections you need to support through your firewall.
2. How much memory you have in your machine (each connection table entry uses 
a small amount of memory, therefore this is what sets the limit on the 
maximum size you can make it on a given machine.
  </pre>
</blockquote>
the memory of my machie is 128 MB, I don't know how many connection I
have need..<br>
<br>
<blockquote cite="mid200407081056.14826.Antony@Soft-Solutions.co.uk"
 type="cite">
  <pre wrap="">
What is the output of "wc -l /proc/net/ip_conntrack", and how much memory do 
you have in your system?

  </pre>
</blockquote>
wc -l /proc/net/ip_conntrack<br>
&nbsp;&nbsp;&nbsp; 626 /proc/net/ip_conntrack<br>
<br>
<blockquote cite="mid200407081056.14826.Antony@Soft-Solutions.co.uk"
 type="cite">
  <pre wrap="">Regards,

Antony.

  </pre>
</blockquote>
<br>
</body>
</html>

