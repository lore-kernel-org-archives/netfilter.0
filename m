From: Andrey Wagin <avagin@gmail.com>
Subject: Re: [PATCH] netfilter: nf_conntrack: release conntrack from rcu callback
Date: Tue, 7 Jan 2014 14:39:14 +0400
Message-ID: <CANaxB-w0-ErUvrEiGmG7dxV-dBwnYX3eX8rE0NQ=boKbc6HU8w@mail.gmail.com>
References: <1389023672-14351-1-git-send-email-avagin@openvz.org>
	<20140106170235.GJ28854@breakpoint.cc>
	<20140106205414.GA19788@gmail.com>
	<20140106215335.GC9894@breakpoint.cc>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=Va3UlXrt/v9FMPqEgLWzm92tecUngg6Df/oTb0bV6Gw=;
        b=RWsJFP4Y8EOedvfd6FDMhc1KuIAF7DAsLmHOpe9dhei2EteV7hzef7q9xnTwe9emB/
         9aWy+9r6SUA9/SxSvxW4av+hXvQYZSWmztJG/rFKmnhxEjQmE32geRiK4U/PLvQE8QZs
         7bIWpbH9+0XTEbLrIEde7iNH+Xy5tDqFV7vC/HE5XsZ5CQ886wCIcNU54sVsV/qLLyri
         vM/tLkIBHcCbAF+UTDguLYUnMS6F4MTw22dodvRUPWMKCRK3k3HLj5vAdbTvlaBHbBz0
         3awREL50hsn+QIWWj7CkI2y10kHXT5Gcyy+x2IXOsq40ptBqcMM1+T7Tm91SPw+K0INR
         qRuw==
In-Reply-To: <20140106215335.GC9894@breakpoint.cc>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, vvs@openvz.org, Pablo Neira Ayuso <pablo@netfilter.org>, Patrick McHardy <kaber@trash.net>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "David S. Miller" <davem@davemloft.net>, Cyrill Gorcunov <gorcunov@openvz.org>

Hi Florian,

2014/1/7 Florian Westphal <fw@strlen.de>:
> Andrew Vagin <avagin@gmail.com> wrote:

>> >                 ct = nf_ct_tuplehash_to_ctrack(h);
>> >                 if (unlikely(nf_ct_is_dying(ct) ||
>> >                              !atomic_inc_not_zero(&ct->ct_general.use)))
>> >                     // which means we should hit this path (0 ref).
>> >                         h = NULL;
>> >                 else {
>> >                     // otherwise, it cannot go away from under us, since
>> >                     // we own a reference now.
>> >                         if (unlikely(!nf_ct_tuple_equal(tuple, &h->tuple) ||
>> >                                      nf_ct_zone(ct) != zone)) {
>
> Perhaps this needs additional !nf_ct_is_confirmed()?

Yes, it think it must help. Thank you for the comments. I resent this patch:
[PATCH] netfilter: nf_conntrack: fix RCU race in nf_conntrack_find_get

>
> It would cover your case (found a recycled element that has been put on
> the unconfirmed list (refcnt already set to 1, ct->tuple is set) on another cpu,
> extensions possibly not yet fully initialised), and the same tuple).
>
> Regards,
> Florian

Thanks,
Andrey
