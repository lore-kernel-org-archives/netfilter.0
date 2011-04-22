From: Pandu Poluan <pandu@poluan.info>
Subject: Re: How can I get rules with all resolved IPs for FQDN?
Date: Fri, 22 Apr 2011 19:31:42 +0700
Message-ID: <BANLkTi=V8=XFT6U7hUvhLOqRuvLAd_bg7A@mail.gmail.com>
References: <ED3A8D81130D4C0CB0D9B98DA81D188F@brianlu>
	<20110422110021.GB2976@cardinal>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110422110021.GB2976@cardinal>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On 2011-04-22, /dev/rob0 <rob0@gmx.co.uk>
> The fact is: outside of Facebook itself, no one has any way to know
> how many IP addresses they have set up to answer HTTP connections as
> www.facebook.com. They use a very short TTL, which implies that they
> might dynamically change the list of IP addresses as needed.
>
>> I am having a problem about not all FQDN can work for iptables
>> commands . If I run an iptable command for www.google.com , it can
>> work fine. I can find 6 rules from the rules table.
>
> BTW, Google and just about every other large site does variations of
> the same thing. You're wrong if you think that your 6 IP addresses
> found for www.google.com. are the ONLY 6 they use. They are the 6
> presented to you as a choice at that particular moment.
>
> As Jan tried to explain to you, this is how iptables works. Names
> given are resolved only once. Bottom line: you can't rely on using
> DNS names which you don't control.
>
> The answer to your real question, "X", might be to hijack the DNS for
> facebook.com. and other Internet domains as desired. Or perhaps more
> likely, to force use of an HTTP proxy like Squid to control access.
>

Another option would be to use ipset. Do a dig against
www.facebook.com every minute and feed any new address found into the
ipset.

But, then again, this is the *wrong* way to clamp down on facebook access :)

> I suspect that this all boils down to a clueless and ineffective
> manager's desire to solve a social problem using technical means. :)

*Wrong* technical means, you mean :)

Rgds,
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
