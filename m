From: "Sebastian Vieira" <sebvieira@gmail.com>
Subject: Re: multiprimary conntrackd setup
Date: Mon, 23 Jun 2008 08:46:47 +0200
Message-ID: <279239c70806222346r834dd7bpa6e260794237cdba@mail.gmail.com>
References: <279239c70806170402j47f89251s2379d0909c1bca0e@mail.gmail.com>
	 <48590828.2060206@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=3mboBUiuWEyZmKPF3kQ8YhgS9i/R9oC7YliK4nksDug=;
        b=QfQ5Lm7MV2Jg7RzuY0jwB8V8zsSTGhBpji6qVPe54JqaqAo1F1m3bvgkXe/5e2HC5F
         V152ihVi7CPHGygMS6jAJ4nQ9lHcY2AoNe9Y9v0/CP205nGM3362Gyo3MD+arhE2Qg4K
         vb7OUOsylobKJVsCmNnLir1G7WMq3ubdBsbmk=
In-Reply-To: <48590828.2060206@netfilter.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On Wed, Jun 18, 2008 at 3:05 PM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> What kind of active-active? There are two kind:

-snip-

> b) asymmetric or packet-based: typical case of OSPF setups, there is no
> guarantees that the packet is handled by the same firewall replica as
> OSPF may change the routes at any time. In that case, you have to enable
> the CacheWriteThrough. However, from the design point of view,
> conntrackd suits better in the scenario a).

I'm using the asymmetric setup. Two firewalls connected with BGP to
the service provider, and as you mentioned, no way of knowing which
firewall handles which packet.

But the funny thing is, that it's working now :)  Yes, i enabled the
CacheWriteThrough option, but i was testing with ICMP's. Later i
learnt that ICMP is a kind of unreliable protocol because when i
tested it with a simple tcp connection it worked fine.

I'm still fiddling around a bit with the ip_conntrack_max sysctl
setting because i tend to get dropped packets. Also `conntrackd -s`
indicated that for both nodes it failed to destroy connections on
internal cache. These numbers roughly match  the other node's
succesfully destroyed connections:

node1:
connections destroyed:		    31473050	failed:	        7334

node2:
connections destroyed:		        7441	failed:	    31475657


Is this something i need to worry about?


regards,

Sebastian
