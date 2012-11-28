From: Steven Kath <steven@vyatta.com>
Subject: Re: Mark traffic on one machine, match on another machine?
Date: Tue, 27 Nov 2012 21:25:38 -0800 (PST)
Message-ID: <08eb317b-c614-4117-855b-66ade5d2244d@tahiti.vyatta.com>
References: <50B59C76.5050706@nottheoilrig.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50B59C76.5050706@nottheoilrig.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jack Bates <uo4zau@nottheoilrig.com>
Cc: netfilter@vger.kernel.org

> Is there a way to mark traffic on one machine and match the 
> mark on another machine? so I can classify traffic on the 
> proxy server and shape it on the router?

This question is a good example of the rationale for the 
TOS/DSCP header on IPv4 packets. netfilter/iptables are 
quite capable of matching and manipulating the DSCP field, 
as are some proxy servers. 
