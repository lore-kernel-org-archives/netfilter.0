From: Andrew Beverley <andy@andybev.com>
Subject: Re: htb + prio trouble (additional info)
Date: Sun, 20 Nov 2011 19:43:15 +0000
Message-ID: <1321818195.2382.1003.camel@andybev-desktop>
References: <op.v49c0wstx1lyi3@debiandesk2.net>
	 <op.v49d61oxx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1321818194;
	bh=1Bnps1mh3wT4leHT0wHpLdh2LA2IR6cmfyDrGdPtjHU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=e88CIccabswm6eUh56zahatkXsUDQfpyThecIqCIuydfJpvyev+BN2iv1fLiJ/GMm
	 3uefokEJdkATJl8+nVKaU6VK6hZfacn5NG4MfLqkR4X6yr+dwIVctMgArNNa6IsnW4
	 xiwriUrBoxcvCDeutul/E+YkGJdOjwG802wsdmQs=
In-Reply-To: <op.v49d61oxx1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

On Sun, 2011-11-20 at 13:10 -0600, Lloyd Standish wrote:
> On Sun, 20 Nov 2011 12:44:46 -0600, Lloyd Standish <lloyd@crnatural.net> wrote:
> 
> > Hello All,
> >
> > While configuring a load-balancing router, I have run into trouble setting up traffic shaping (at least the load-balancing is working!)
> >
> > I am trying to:
> > (1) limit total upload speed to somewhat below the interface bandwidth
> > (2) do some traffic shaping, particularly avoid queuing of VOIP packets.
> >
> > To accomplish this I am trying to create a HTB qdisc on each outward-facing interface, each containing a PRIO qdisc with the default 3 classes.  sfq qdiscs are created for each PRIO class.
> 
> PS I should point out that in this case VOIP and DNS traffic should
>  always have priority, even at the expense of some bandwidth and/or
>  hurting other flows.

In which case the prio qdisc is the right choice.

>  I will look for better ways to filter for VOIP traffic

You might want to look at one of the traffic classifier projects such as
opendpi or l7-filter. You could maybe set a mark value and match that
using a tc filter with the "handle" parameter.

Andy


