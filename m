From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: RE: INVALID state
Date: Thu, 13 Nov 2008 14:34:30 -0800
Message-ID: <491cab7d.27b38c0a.772a.42ee@mx.google.com>
References: <491c6f1c.27b38c0a.7748.ffffe1d6@mx.google.com> <200811132331.08821.christoph.paasch@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:references
         :in-reply-to:subject:date:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language
         :message-id;
        bh=WmYJDm+BWGTSDGp+aK5LMqZ33NpXaRdoSDqpm0aZ1h8=;
        b=lFtqjeuL8evaegpP9L+J59pcEYb2/8Oxt/hj7yNmWjxlchwefc9rGvFZp9PlQjUqDi
         qxXfvhHAKeof5tsp9NdUPkGyCdHprLCMKtVjpAeQa0kdHwXtJgEDtD7m5vAyvbtbMbGE
         tsNOUiJCLQXGOkTupifKP/zS5xnbG1PtCIyrw=
In-Reply-To: <200811132331.08821.christoph.paasch@gmail.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Christoph Paasch' <christoph.paasch@gmail.com>, 'Gilad Benjamini' <gilad.benjamini@gmail.com>
Cc: netfilter@vger.kernel.org

Back to my original question then: what is the rule of thumb ?
In other words, for a non-programmer reading proper documentation, how would
the documentation describe INVALID ?

> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-
> owner@vger.kernel.org] On Behalf Of Christoph Paasch
> Sent: Thursday, November 13, 2008 2:31 PM
> To: Gilad Benjamini
> Cc: netfilter@vger.kernel.org
> Subject: Re: INVALID state
> 
> Hi,
> 
> On Thu November 13 2008, Gilad Benjamini wrote:
> > - init_conntrack calls l4proto->new. If a zero value is returned,
> > nf_conntrack_free is called and the packet's connection is considered
> > INVALID
> In fact, the packet isn't marked "INVALID", there is just xt_state.c,
> who
> detects an invalid packet, if nf_ct_get(...) returns 0 or null. Which
> means,
> that skb->nfct == NULL. Which in turn means, that nf_conntrack_in
> doesn't
> assigned a connection to the packet.
> 
> And that will be the case, if any of these calls return a negative
> value (take
> a look at nf_conntrack_in and the functions it's calling):
> l3proto->get_l4proto
> l3proto->pkt_to_tuple
> l3proto->invert_tuple
> l4proto->error
> l4proto->pkt_to_tuple
> l4proto->invert_tuple
> l4proto->new
> l4proto->packet
> nf_conntrack_alloc
> 
> So, there can be A LOT of cases, where conntrack detects an invalid
> packet...
> 
> --
> Christoph Paasch
> 
> www.rollerbulls.be
> --
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

