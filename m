From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: What are these and how can I not log them?
Date: Mon, 07 Jul 2008 21:29:58 -0500
Message-ID: <4872D126.8090304@riverviewtech.net>
References: <48729139.8040505@libertytrek.org> <48729582.909@riverviewtech.net> <48729F72.5060502@libertytrek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48729F72.5060502@libertytrek.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 7/7/2008 5:57 PM, Simon wrote:
> Thanks for the response...

You are welcome.

> Ok, makes sense, at least for the computers inside my network - but when 
> the flood happens, it is from a non-local IP address, although I can't 
> swear that the source/dest ports are the same... I'll have to watch for 
> the next one and grab a snippet...

Hum.  I'd be between curious to concerned to find unexpected IPs in 
logs.  Now, if the logs are the "Default Drop and Log" type and not just 
your internal interface, then it could be external traffic that appears 
similar.

> Yeah, I had someone help me set this up years ago, and I told him I 
> wanted it buttoned up as tight as possible. He even added rules to block 
> most OUT bound traffic as well, which I have since learned is probably 
> not a great idea...

Doing egress filtering is not necessarily a bad idea, you just have to 
be careful.  Usually egress filtering helps ensure that you are a good 
internet neighbor which is usually a good thing.

> Any chance you or someone could help me in re-evaluating my current 
> ruleset?

I'm not sure that this mailing list is the best place to ask for help in 
creating and / or (re)assessing a rule set.  IMHO this list is more of a 
place to ask how to make something specific work rather than how should 
I / what firewall should I use for my network with this <bla> config. 
(However I'd be willing to do so off list if you will email me directly.)

> To dump the current rules to a file I'd just do:
> 
> iptables-save > myrules
> 
> Then just copy/paste the contents here for evaluation (if thats ok)?

Yes, that will probably work the best.

> Thanks again for your time...

*nod*

You are welcome.



Grant. . . .
