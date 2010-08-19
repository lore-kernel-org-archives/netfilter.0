From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Bridges
Date: Wed, 18 Aug 2010 22:52:00 -0500
Message-ID: <4C6CAA60.60808@riverviewtech.net>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C65CD.6090707@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6C65CD.6090707@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Pascal Hambourg wrote:
> It depends what "traffic" means. Ethernet frames, no. IP packets, yes 
> if the box also acts as an IP router between the bridges.

I took Jonathan's comment to be referring to ethernet frames.

Even if the box is acting as an IP router between the bridges, I view 
that as an operation that is happening out side of the bridge(s).  Thus 
there is an external process that is taking IP packets and passing them 
between the bridges.  As such, the ""traffic is still not ""leaking / 
""flooding between the bridges as a failure or shortcoming of the 
bridge, but rather an external influence.

The same thing can be said about two switches that have a router between 
them.  When the ""traffic goes between the switches it is not because of 
something the switches did, rather the external router's doing.  ;-)



Grant. . . .
