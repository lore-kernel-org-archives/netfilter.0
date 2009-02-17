From: Jarek Poplawski <jarkao2@gmail.com>
Subject: Re: problem with IPoA (CLIP),  NAT, and VLANS
Date: Tue, 17 Feb 2009 09:52:00 +0000
Message-ID: <20090217095200.GA5538@ff.dom.local>
References: <20090216232016.GA4803@ami.dom.local> <499A7D7D.1090607@trash.net>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:references:mime-version:content-type:content-disposition
         :in-reply-to:x-mutt-references:x-mutt-fcc:user-agent;
        bh=TRUirMNwPam+kDx/uK/WEHJLKJJ/spjwR8nvHyeYTgY=;
        b=bYiXy2o8ogISbELhphMtRDIrfjxUYWVpA0Wn4AsTpO7OLFOCbScZsH2EdO4G5kfrWk
         8vhZz+6kZc55KbUG7kBE4tL2LtFI7vtYsBuT/ypWjuQbLH1pkZNzHlDqYrwdrR4eE37A
         RFRKq7LdRczyFyMgF3D8WN84IUK7Na1C9lEYk=
Content-Disposition: inline
In-Reply-To: <499A7D7D.1090607@trash.net>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: Karl Hiramoto <karl@hiramoto.org>, netdev@vger.kernel.org, netfilter@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Feb 17, 2009 at 10:03:57AM +0100, Patrick McHardy wrote:
...
> The first patch looks fine. As for the second one, I would like
> to understand why we're seing these packets. The VLAN driver uses
> the original headroom plus the space it needs itself, which suggests
> that the underlying driver specifies an incorrect headroom.
> The driver doesn't appear to be part of the mainline kernel though.

On the other hand, if Karl added his patch it seems this change of
NET_SKB_PAD isn't enough, and if omitting skb_cow_head() works, then
the headroom isn't the main problem?

Jarek P.
