From: John Madden <jmadden@ivytech.edu>
Subject: Re: "DNAT" w/o changing source address?
Date: Thu, 04 Oct 2007 10:19:42 -0400
Message-ID: <1191507582.13379.45.camel@localhost.localdomain>
References: <1191424890.25752.27.camel@localhost.localdomain>
	 <47042728.1060508@riverviewtech.net>
	 <1191503642.13379.12.camel@localhost.localdomain>
	 <4704F430.4070907@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4704F430.4070907@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: gtaylor+reply@riverviewtech.net
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

> That is very odd.  Do you have other rules in place that could be 
> interfering with what you are doing?

I have a dozen or so other rules that do the same thing for different
IP's (this is a load balancer).  

> Normally with a server behind a NAT all I need to do is DNAT the traffic 
> and allow the returning traffic to pass back out through the same NATing 
> system and allow it's outbound MASQUERADEing / SNAT to hide the internal 
> source IP address.

Well I thought that's what I was doing with that SNAT rule. =)

> If you do not have this type of scenario but rather both the redirecting 
> IP and the real mail server's IP are both globally routable, then you 
> may need to do something else.  Is this possibly the case?

Yeah, both machines have globally routable IP's.

John




-- 
John Madden
Sr. UNIX Systems Engineer
Ivy Tech Community College of Indiana
jmadden@ivytech.edu

