From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: nf_conntrack_sip regression?
Date: Sun, 9 Oct 2016 20:06:56 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1610092001540.22883@aurora.sdinet.de>
References: <20161009001947.4eszsjifuc5wfacq@Redstar.dorchain.net> <5fc84a99-1a7c-7aad-9baf-7e3047ca912d@free.fr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5fc84a99-1a7c-7aad-9baf-7e3047ca912d@free.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adel Belhouane <bugs.a.b@free.fr>
Cc: Joerg Dorchain <joerg@dorchain.net>, netfilter@vger.kernel.org

On Sun, 9 Oct 2016, Adel Belhouane wrote:

> > Is this supposed to work at all?
> > What other concept would work for this setup?
> > 
> > Thanks for a hint,
> 
> I think that's the answer to the problem:
> https://www.spinics.net/lists/netfilter/msg56874.html

Is there a complete list somewhere of all rules needed to entirely 
replicate the previous way of "just modprobe all existing nf_nat_* and 
nf_conntrack_* modules"?

(To make a user NAT gateway "just work for everything, no matter what 
they try to use")

c'ya
sven-haegar

-- 
Three may keep a secret, if two of them are dead.
- Ben F.
