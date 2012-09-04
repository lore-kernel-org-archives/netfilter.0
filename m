From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Connection Tracking
Date: Tue, 4 Sep 2012 13:30:16 +0200
Message-ID: <20120904113016.GA2920@1984>
References: <5044DC6C.1070806@cats-muvva.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5044DC6C.1070806@cats-muvva.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicole <nicole@cats-muvva.net>
Cc: netfilter@vger.kernel.org

On Mon, Sep 03, 2012 at 05:35:56PM +0100, Nicole wrote:
> Hello everyone,
> 
> I would be grateful for some advice. Am writing a target using xtables.
> This target saves and restores a field in the IPv{4,6} header to/from
> the connection mark.
> 
> I have read Jan Engelhardt's booklet (3 July 2012), but remain unclear
> on how to ensure that connection tracking is turned on.
> 
> My difficulty arises in the following code snippet:
> 
>         const struct nf_conn *ct;
>         ct = nf_ct_get(skb, &ctinfo);
>         if (ct == NULL) {
>                 return false;
>         }
> 	/* use ct-> */
> 
> ct is always false and therefore I cannot do the save and restore.
> 
> Any suggestions?

Make sure nf_conntrack and nf_conntrack_ipv4 are loaded.
