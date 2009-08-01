From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Local to Local via firewall
Date: Sat, 1 Aug 2009 13:52:53 +0200
Message-ID: <20090801115253.GA29918@internet24.de>
References: <20090731144247.01a4f9bb@zeus.int.pccl> <1249056381.27177.12.camel@enterprise.ims-firmen.de> <20090731172419.669eb256@zeus.int.pccl> <1249062563.27177.25.camel@enterprise.ims-firmen.de> <20090731215235.06a83d26@digital-domain.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090731215235.06a83d26@digital-domain.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Clayton <andrew@digital-domain.net>
Cc: netfilter@vger.kernel.org

 
> Thanks again, but after trying this and numerous variations I still
> can't make this work, and I've read plenty of other stuff that says to
> do what you say, but no cigar :(

Well there is no fundamental reason why it shouldn't work along those lines,
most likely your other rules get in the way. I'd start by reducing
the ruleset to the basics and then I'd readd rules till I'd find
the culprit.
 
> It's annoying and I'd like to get it working at the firewall. But for
> now I think I'm going to take Robby's advice and have a look at split
> views with Bind. This also does seem to be the recommended way to do it.

NAT routers always hide some source addresses from at least one machine,
otherwise they wouldn't be NAT routers ;)

But sure, if you have a 1000 people behind your NAT router, NATing local
requests to local services just for the sole reason of not having to use
different names for services from the inside or a split DNS server
might not be such a good idea.
