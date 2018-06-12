From: Greg KH <greg@kroah.com>
Subject: Re: ct helper ipv6
Date: Tue, 12 Jun 2018 11:51:46 +0200
Message-ID: <20180612095146.GA23752@kroah.com>
References: <2c145015821e6e830beddf376e0f563dac2d1867.camel@tin.it>
 <20180612090232.rnri3rf4nlnjrrqn@breakpoint.cc>
Mime-Version: 1.0
Return-path: <stable-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :content-type:date:from:in-reply-to:message-id:mime-version
        :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=5/ti+OQOxdItA6LyWDmRx9tMHHMYBpWCapsuEljT/F4=; b=SVMxg3ju
        C+zynB7pnObRnchn0iUlMXO3jB+uO24XHoBtZ/tsARO03tfGDoN7QEA9ivUBKv8A
        02W7Nc6VDTF42/PlSiyG7M3Uob24cJa9JxMKlXYPw5CloKtNaqi27eDvWZAOR4LL
        FuzGUjDEk5weobj/sfj0QqRN2CGc884Mac8HIbkIRlxQ/RQOT2OZR/ka28u+/LY5
        PyoVuYjB7kLh+eBZ0TfyWfPouzgD6STmK12Hus2ATGb21oZsHuYerbfqRJTctFbZ
        DRg7W10sJSBTFtiRDuQfe2sbhAXZp0hFfzuh9XcuHwpXbGT7ETgF6XJg9d1PaFXU
        RsvO9YbaOF8gKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm3; bh=5/ti+OQOxdItA6LyWDmRx9tMHHMYB
        pWCapsuEljT/F4=; b=LYYAQpLmyo2sj46uPJ+Kh4yhcRLS9ZKb96vBM7L3hCMVc
        xt8Xb/+GUQtnvC3X6xEnbUFp7nhxZOc0viGkCg4lLrE7yQyxKYONoPoFcKk99TBO
        yi46HGwcSyRuywpi047Mog4onGJ1VRE2iU7rfmLdMRZAj3+69tC/vRIbqpKP0JqV
        Wx9v5rgJUPBWpvm+/3tAV2nDjSP8QsE4R8qsUetolscSUHldg7Hctqe5FozVEK5i
        HfhTAKsV/tCQO/YBTx1+ntkWd7ZYmU0EJfnIqlkv3Sb41aRwbzm3p/tCu5cNVBKf
        7blp1wVBb0bnn1aIVXczNO9rpy2x7GoL4wzrHV7sw==
Content-Disposition: inline
In-Reply-To: <20180612090232.rnri3rf4nlnjrrqn@breakpoint.cc>
Sender: stable-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: Ale <mystic@tin.it>, netfilter@vger.kernel.org, stable@vger.kernel.org

On Tue, Jun 12, 2018 at 11:02:32AM +0200, Florian Westphal wrote:
> Ale <mystic@tin.it> wrote:
> 
> [ cc stable, could you please queue below fix?  ]
> 
> > When I try to use CT HELPER for the ipv6, nft it dies and I have to
> > restart the pc. But it works well for ip and inet.
> > 
> > nft add ct helper ip6 filter ftp-std { type \"ftp\" protocol tcp\; }
> > nft add rule ip6 filter WAN-IN iifname $IF_WAN_1 tcp sport $UP_PORTS
> > tcp dport $UP_PORTS ct helper set \"ftp-std\" counter accept
> > 
> > Kernel: RIP: strlen+0x0/0x20 RSP: ffffae1b4c67f980
> > kernel: Code: f8 48 89 f9 74 09 48 83 c1 01 80 39 00 75 f7 31 d2 44 0f
> > b6 04 16 44 88 04 11 48 83 c2 01 45 84 c0 75 ee c3 0f 1f 80 00 00 00 00
> > <80> 3f 00 74 10 48 89 f8 48 >
> 
> This is most likely fixed in 4.17 by
> 
> commit b71534583f22d08c3e3563bf5100aeb5f5c9fbe5
> netfilter: nf_tables: fix NULL pointer dereference on nft_ct_helper_obj_dump
> 
> The bug was added in Linux 4.12.

Queued up to 4.16.y and 4.14.y, thanks.

greg k-h
