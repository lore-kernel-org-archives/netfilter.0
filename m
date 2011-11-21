From: Andy Furniss <andyqos@ukfsn.org>
Subject: Re: htb + prio trouble
Date: Mon, 21 Nov 2011 10:16:39 +0000
Message-ID: <4ECA2507.8050008@ukfsn.org>
References: <op.v49c0wstx1lyi3@debiandesk2.net> <1321817770.2382.996.camel@andybev-desktop> <op.v49inevvx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.v49inevvx1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

Lloyd Standish wrote:

> Thanks for your insight. I didn't realize that only the root qdisc
> receives traffic automatically. Any subclasses need to receive traffic
> via a filter, or via the "default" selector. I added "default" as follows:

I am very rusty and out of date with the world of tc.

One thing to consider when using htb default is that all unclassified 
traffic goes there - this includes arp.

HTB by default lets unclassified go unshaped so personally I always 
preferred setting catch all "protocol ip" filters over using default.

If you ever play with HFSC (unless it's changed in recent years) then 
its' default behavior is to drop unclassified, which can easily bite 
you, so you need to make default or explicitly filter protocol arp.

