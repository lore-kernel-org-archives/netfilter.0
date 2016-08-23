From: Yamakaky <yamakaky@yamaworld.fr>
Subject: Re: Add element in set when element already present.
Date: Tue, 23 Aug 2016 21:46:03 +0200
Message-ID: <a73ec2a4-eacc-1af4-9ef9-12dfd5c05c8b@yamaworld.fr>
References: <cd5537f9-20fa-67ff-fd33-d4d8c6b55b9f@yamaworld.fr>
 <alpine.LSU.2.11.1608231921010.3700@maria>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.11.1608231921010.3700@maria>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

> Hi, The current behaviour corresponds to the mathematical definition
> of a set.

Which set operator acts like the current behavior? It seams to me that
union (add) and complement (remove) would be more ergonomic. For
example, a set could be used for banned IPs. Plus it's what every stdlib
does anyway. Is there something useful I miss with the current behavior?

> But you could always write a simple wrapper which feeds the elements
> one by one to "nft add element" and ignores the error messages for
> the duplicates.

That's what I did, but it's not very clean.
