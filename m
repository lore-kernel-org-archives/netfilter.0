From: Julien <dyna@tri-oxyde.org>
Subject: Re: routing mail on a different gateway
Date: Fri, 23 Jul 2004 14:56:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41010B14.7000206@tri-oxyde.org>
References: <TBEXEDU010ZJPIad6z000000042@smtp.maurickcollege.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <TBEXEDU010ZJPIad6z000000042@smtp.maurickcollege.nl>
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
Rob Sterenborg wrote:<br>
<blockquote cite="midTBEXEDU010ZJPIad6z000000042@smtp.maurickcollege.nl"
 type="cite">
  <blockquote type="cite">
    <pre wrap="">But the problem is that there are originated from 
62.212.120.196, which is the ip of ppp0, not ppp1. So packets 
can't take the way back.

How can I change the "from" ip of packets that are routed 
through ppp1 ?
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Maybe this will do ; use ppp+ instead of ppp0 or ppp1.
ppp+ matches any ppp.


Gr,
Rob</pre>
</blockquote>
Where should I use it ? iproute2 doesn't understand ppp+<br>
<br>
</body>
</html>

