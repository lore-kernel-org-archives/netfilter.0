From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: rule is ignored for the localhost
Date: Mon, 16 Jun 2008 15:49:31 -0500
Message-ID: <4856D1DB.9050107@riverviewtech.net>
References: <86ff9a9a0806161241r65b5a734o2b0ebc8e2ef0c4fe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <86ff9a9a0806161241r65b5a734o2b0ebc8e2ef0c4fe@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/16/08 14:41, Artem Y. Pervin wrote:
> I want to do a simple thing. I want some port of the external 
> interface to redirect TCP traffic to the private network.

Ok...

> So, I have the following rule sequence:

At a quick glance your rules seem to be ok.

> When I try to access my machine from a remote host, everything works 
> fine:

*nod*

> I've tried to use the external ip adress as well, but I'm getting the 
> same result:

*nod*

> What is wrong with my configuration? Why iptables ignore the rule for 
> the localhost case?

I don't think it is anything with your rules per say.  Rather I think 
the problem is that you are trying to redirect something from localhost 
to something not on localhost.  The Linux kernel will prevent this for 
security reasons.

I would suggest that you use some sort of proxy program (see below) 
listening on localhost:30099 that will proxy connections to 
192.168.10.119:22 for you.

You could even have the proxy program listen on the external interface, 
or all interfaces for that matter, and do all the redirecting for you.
However keep in mind that when the proxy program connects to 
192.168.10.119 on your behalf, the connection(s) will appear to be from 
the host running the proxy app, so logging on the target host will not 
show the real source of the connection.  If you think about it, when the 
host that is doing the redirecting connects to 192.168.10.119, it would 
be the source of the traffic, so there is little difference (if any) in 
it connecting via the proxy or connecting directly to 192.168.10.119.

With this in mind, I would be tempted to DNAT with IPTables so that the 
target host will see the real source IP and proxy traffic from localhost 
on the DNAT box to 192.168.10.119.

"socat" and "rinetd" are a couple of example proxy applications.



Grant. . . .
