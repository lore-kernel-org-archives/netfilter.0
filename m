From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Chain Policy DROP versus ACCEPT and logging
Date: Mon, 13 Oct 2003 21:29:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F8B5189.1080104@Loudoun-Fairfax.com>
References: <7A3B4AA360FDEF448F3390421FC8D731F419BF@coxhpexg.coxhp.com> <1066093284.21277.10.camel@tarkus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1066093284.21277.10.camel@tarkus>
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
  <meta http-equiv="Content-Type"
 content="text/html;charset=ISO-8859-15">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
Ted Kaczmarek wrote:<br>
<blockquote type="cite" cite="mid1066093284.21277.10.camel@tarkus">
  <pre wrap="">And that applies to when default input and forward policies are drop?
Having a hard time grasping that in my brain, but I do believe I may be
overheating a few neurons :-)
  </pre>
</blockquote>
<br>
LOG is a little different from other rule targets since it doesn't
cause a
packet to be redirected. After logging the packet continues on to the
next rule in the same chain.<br>
<br>
Think of the default policy as the very last rule in the chain that
only gets used when all the previous rules don't redirect the packet.
Since it alway comes after the logging rule, it has no effect on it.<br>
<br>
HINT: Beer cools neurons!<br>
<br>
Jeff<br>
<br>
</body>
</html>


