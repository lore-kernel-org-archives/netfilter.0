From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Weird NAT problem
Date: Sat, 01 Nov 2008 17:52:25 -0500
Message-ID: <490CDDA9.90200@riverviewtech.net>
References: <200811012307.18305.bero@linux.cd> <490CDCC2.3070202@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490CDCC2.3070202@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

(Let's try this again with out fat fingering the /Send/ button too soon.)

> Any idea what's going wrong there? Is there anything I'm overlooking 
> with my routing setup, or do I need to look for the problem on the OSX 
> side?

The first thing that comes to mind is that you may be dealing with an 
MTU / MSS issue.  Some of your connections work and some never seem to 
start, which is a classic symptom of an MTU / MSS mis-match with the 
ICMP error being filtered out along the way.

Try playing with the TCPMSS match extension and target to clamp the MSS 
to some lower values.  Try something extremely low and then start 
raising it until you start to have failures again and then back it down 
a bit.

PPPoE, despite being nice for providers, has many different problems 
that simple static IPs or even DHCP does not have.



Grant. . . .
