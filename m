From: Christoph Paasch <christoph.paasch@gmail.com>
Subject: Re: INVALID state
Date: Thu, 13 Nov 2008 23:31:08 +0100
Message-ID: <200811132331.08821.christoph.paasch@gmail.com>
References: <491c6f1c.27b38c0a.7748.ffffe1d6@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=/3YA1cYNHOiYqV943M3D3qWB/m1Sv3C9OX5gvnY2dEk=;
        b=XVmwwYkuJkTc2sgNuQRiW2HpmPXWT2YTwSOOlTbnqHZURG5jzQtxHeBCuy/Hb6ekmF
         raPyyYHDZDW+jxT/1pV7NLmE1zoooXLX8aMpv3YJmSET/t9iEWkkohWYaZCxAjawG1wX
         xkmf1CKGqqmxSywimHc9Gx6PmHCYkVXYPcnL0=
In-Reply-To: <491c6f1c.27b38c0a.7748.ffffe1d6@mx.google.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gilad Benjamini <gilad.benjamini@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

On Thu November 13 2008, Gilad Benjamini wrote:
> - init_conntrack calls l4proto->new. If a zero value is returned,
> nf_conntrack_free is called and the packet's connection is considered
> INVALID
In fact, the packet isn't marked "INVALID", there is just xt_state.c, who 
detects an invalid packet, if nf_ct_get(...) returns 0 or null. Which means, 
that skb->nfct == NULL. Which in turn means, that nf_conntrack_in doesn't 
assigned a connection to the packet.

And that will be the case, if any of these calls return a negative value (take 
a look at nf_conntrack_in and the functions it's calling):
l3proto->get_l4proto
l3proto->pkt_to_tuple
l3proto->invert_tuple
l4proto->error
l4proto->pkt_to_tuple
l4proto->invert_tuple
l4proto->new
l4proto->packet
nf_conntrack_alloc

So, there can be A LOT of cases, where conntrack detects an invalid packet...

--
Christoph Paasch

www.rollerbulls.be
--
