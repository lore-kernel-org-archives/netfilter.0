From: Roger Price <roger@rogerprice.org>
Subject: Re: Add element in set when element already present.
Date: Tue, 23 Aug 2016 19:28:23 +0200 (CEST)
Message-ID: <alpine.LSU.2.11.1608231921010.3700@maria>
References: <cd5537f9-20fa-67ff-fd33-d4d8c6b55b9f@yamaworld.fr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cd5537f9-20fa-67ff-fd33-d4d8c6b55b9f@yamaworld.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Tue, 23 Aug 2016, Yamakaky wrote:

> When I add an element in a set (same with maps) and the set already 
> contains the element, the command fails with an error.

Hi, The current behaviour corresponds to the mathematical definition of a 
set.  But you could always write a simple wrapper which feeds the elements 
one by one to "nft add element" and ignores the error messages for the 
duplicates.

> Expected: no error and the set contains { 0.0.0.0, 1.1.1.1}.

The simple wrapper would have your expected behaviour. What would be 
helpful is a specific return code from "nft add element", and from ipset 
for the same error.

Roger

