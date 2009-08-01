From: Andrew Clayton <andrew@digital-domain.net>
Subject: Re: Local to Local via firewall
Date: Sat, 1 Aug 2009 13:25:29 +0100
Message-ID: <20090801132529.1838dae9@digital-domain.net>
References: <20090731144247.01a4f9bb@zeus.int.pccl>
	<1249056381.27177.12.camel@enterprise.ims-firmen.de>
	<20090731172419.669eb256@zeus.int.pccl>
	<1249062563.27177.25.camel@enterprise.ims-firmen.de>
	<20090731215235.06a83d26@digital-domain.net>
	<20090801115253.GA29918@internet24.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090801115253.GA29918@internet24.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

On Sat, 1 Aug 2009 13:52:53 +0200, Thomas Jacob wrote:

> NAT routers always hide some source addresses from at least one
> machine, otherwise they wouldn't be NAT routers ;)
> 
> But sure, if you have a 1000 people behind your NAT router, NATing
> local requests to local services just for the sole reason of not
> having to use different names for services from the inside or a split
> DNS server might not be such a good idea.

Thanks for the help guys.

I've got "views" set up in BIND on one of our internal DNS servers
(which is also our secondary nameserver for all our domains).

Seem to be working a treat.

host.foo.bar will return a different IP address depending on if
the query come in externally or internally.
  
Cheers,
Andrew
