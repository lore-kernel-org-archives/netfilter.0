From: Stefan Keller <sk@open.ch>
Subject: Re: Virtual packet tracer for iptables
Date: Fri, 08 Jun 2012 14:33:06 +0200
Message-ID: <4FD1F102.2010609@open.ch>
References: <4FD1E2B1.80801@open.ch> <4FD1E87C.5020004@univ-nantes.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4FD1E87C.5020004@univ-nantes.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jean-philippe.menil@univ-nantes.fr
Cc: netfilter@vger.kernel.org

> not sure to understand what you mean.
> But you have the TRACE target who can help you.
> "This target marks packets so that the kernel will log every rule which
> match the packets as those traverse the tables, chains, rules."
> 
> Hope this help.
> 

Hi Jean-Philippe

Thanks for your reply!
We did some tests with the TRACE target. But if you use
this target, then you need real traffic that matches the
rule base - meaning an off-line analysis is not possible.
Further, we realized that it is quite hard to simulate
a packet that would match the FORWARD chain (we did not
make it that it was accepted by the system).

As a side note:
We run systems with up to 50,000 concurrent sessions
and an iptables rule base with few thousands of lines.
If we activate the TRACE target, we will get a huge
number of log entries!

I look for a tool that could provide the matching rules
without real traffic - just with the information how the
packet would look like (a virtual packet).
For this purpose, one could use the output of iptables-save
or there might be an interface I'm not aware of provided
by netfilter.
This tool would not show me what rules currently match.
It is more a hypothetical question: What rule(s) would match
if I had a packet like this?

Hope this helps to clarify my request.

Best regards
Stefan Keller


-- 
stefan keller
product manager

open systems ag
raeffelstrasse 29
ch-8045 zurich
t: +41 44 455 74 00
f: +44 44 455 74 01
stefan.keller@open.ch

http://www.open.ch
