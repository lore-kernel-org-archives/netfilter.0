From: Psyspy rambo <psyspy2020@gmail.com>
Subject: Re: Netfilter hook doesn't see all packets
Date: Thu, 21 Nov 2019 15:31:48 -0700
Message-ID: <CAFqmWq8JQrZHDuGMFyNG4xV6EWvdXDpUdMaruPr9BH5zyjRWnA@mail.gmail.com>
References: <CAFqmWq_+GgO3uiu6omDxiUPiiV5OcJ9d6A--RHC3-jZCy_sV0A@mail.gmail.com>
 <CAFqmWq_Ha3ces2AAnU_s-Dzbxv7g-pGE4ikg-+HGGq-WNX=gow@mail.gmail.com>
 <5DD6D297.8010609@gmail.com> <CAFqmWq_FNTL4p1i=Ur7V2vbjv=KUOer5Ar+J4owoNbpO_KBCOg@mail.gmail.com>
 <20191121203624.GK20235@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5Hbxuuz4VwZbpQZnuK4ZJMcK4oJJnxSar/HpJ2K/+J4=;
        b=QHE7N5DrPvQcppGZAjZjqef+JC//GH99IAizn4xUw9Jg54QFne0lJVvGDmSGX27XGG
         8JSEdebUKzj4/ZU4158HCOezD2nF09QzFt/I1Nvmgda/J17cq6KG/HAPpiXNBycZEIvi
         HI4JRQo1Wk4zFLq9E1U3COO84ev6/ghBfy1fmheaxPCbqE2n8ySIXh95VdJ/DCLifIXg
         +xW2lHKFvlMBJlrY79w4YgAemNJOOrNH4MlCz2nMBXSaK4xnXvT3aQUFXZm2c4JSjTKQ
         eU2jMpcBFUUNIFj5S8SiULPIOWBI9tsvQ7DLkCnoEucE39O+xs2m1gEpLerugoHvCpJK
         B4CA==
In-Reply-To: <20191121203624.GK20235@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: Gordon Fisher <gordfisherman@gmail.com>, netfilter@vger.kernel.org

Thanks a lot Florian. That fixed it! Curious, why is it unreliable?

On Thu, Nov 21, 2019 at 1:36 PM Florian Westphal <fw@strlen.de> wrote:
>
> Psyspy rambo <psyspy2020@gmail.com> wrote:
> > > >      udp_header = (struct udphdr *)skb_transport_header(skb);
> > > >      sip = (unsigned int)ntohl(ip_header->saddr);
> > > >      dip = (unsigned int)ntohl(ip_header->daddr);
>
> This doesn't work reliably in netfilter hooks.
>
> See skb_header_pointer() usage in other nf modules.
