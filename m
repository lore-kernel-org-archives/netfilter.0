From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Query:  the limit module stateless or stateful?
Date: Wed, 24 Feb 2010 13:06:22 +0100
Message-ID: <4B85163E.8040702@chello.at>
References: <4B850624.9090001@4c.ucc.ie>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B850624.9090001@4c.ucc.ie>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: wfitzgerald@4c.ucc.ie, netfilter@vger.kernel.org

On 24.02.2010 12:30, netfilter-owner@vger.kernel.org wrote:
> Dear Experts,
> 
> Would one regard the limit module as being stateful or stateless?
> 
> My gut feeling is to say that it is stateless.
> 
> I presume while it maintains some (simple) state information, it has no
> semantic context of previous packets. Rather it only refers to packet
> counter statistics of which the limit module maintains or can query.
> Therefore, regardless of previously accepted traffic, if there are more
> connections than deemed acceptable, then even legitimate reconnection's
> are also blocked/logged.
> 
> Under this assumption, I would classify the limit module as stateless.
> Comments?

The limit extension operates on packets, it does not know/care about
connections.
-A CHAIN -m state --state NEW -m limit --limit 3/s -j ACCEPT
would allow 3 state NEW packets/second.

> 
> The reason I ask is that I'd like to classify/categorise various
> iptables filter capabilities. Rather than defining just stateless (for
> example, TCP match), stateful (for example, state match),
> application-layer (l7-filter) and extension (for example, limit match)
> filter capabilities, various matches may be a member of more than one
> category. For example, l7-filter could be considered as both stateful
> and application-layer, in that it operates at layer 7 and it maintains
> state of previous packets in a buffer in order to discover if a set of
> packets describe a particular traffic flow. l7-filter could also be
> considered an extension ;-)

Best regards

Mart
