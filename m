From: Kevin Cernekee <cernekee@gmail.com>
Subject: Re: [PATCH v3] netfilter: nf_conntrack_sip: Handle Cisco 7941/7945 IP phones
Date: Sun, 16 Dec 2012 23:26:31 -0800
Message-ID: <CAJiQ=7BBquMQmQWp3=aD_s3-rSYr4Y+gke0GJKCkJV-mq5buug@mail.gmail.com>
References: <f0955e6c2110044fa058d0f3ecf945ca@localhost>
	<1290412334.2756.141.camel@edumazet-laptop>
	<1355703441.18919.6.camel@shinybook.infradead.org>
	<20121217004457.GA12234@1984>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=uFjfVvl/RSFk6JT85hDzDh/ZoPNNdY8zjjKIsX+wRAc=;
        b=wF54Stg1iCNF9aVHpJM+XhRgcsgWhVaeH0zVmKCLar5hrrkGsD3Gz5YGYzyTitHQrZ
         PCfmrc6BPdUarA5O7Re86LJecAuD/cY3xoVZ7K6G4TiwbIF9vV39HWGjqunzFXNNsfYq
         5FdieSfW9v4jU4ripAoNDMGEO23Cu157S7i7iDEGMEjAHqigM2FuDOtAD/+LPoToIBxe
         /KtIRXahWV9txqEj44T5XddKHes+SVtmhsgN1JHyk+WBaib/67n/I8Xj/WrmTNOUQQjb
         HNXCaXWkWkH6etMGVz4yEf+rG+c8St3sSTs2soODz4xYKWHGe+1XhYp1A80UjtfYkd7K
         mrLg==
In-Reply-To: <20121217004457.GA12234@1984>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Eric Dumazet <eric.dumazet@gmail.com>, Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, "Pekka Savola (ipv6)" <pekkas@netcore.fi>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

On Sun, Dec 16, 2012 at 4:44 PM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>> What happened to this? OpenWRT is still carrying it, and it broke in
>> 3.7. Here's a completely untested update...
>
> I requested Kevin to resend a new version based on the current kernel
> tree while spinning on old pending patches since I have no access to
> that hardware, but no luck.
>
> So I'll review this and, since OpenWRT is carrying, I guess we can get
> this into net-next merge window.

Sorry, been putting it off since the OpenWRT version has worked flawlessly...

I just reassembled my test rig and I'll get you a working patch this week.

Is it OK to use
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git as the
baseline?
