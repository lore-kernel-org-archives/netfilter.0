From: Jacek Tomasiak <jtomasiak@arista.com>
Subject: Re: Matching on protocols inside IPv6 IPSec AH (legacy vs nft)
Date: Mon, 26 Jun 2023 14:06:47 +0200
Message-ID: <CAPEBPyMWBzsROxN5Em7dGCpG2TXncC+Gu_1BD81vV2HysLo2Ow@mail.gmail.com>
References: <CAPEBPyMNe5dPTC9Dwp888M5RR-2ThC7ZtuaQPxNG+5VqbJinsQ@mail.gmail.com>
 <ZJTEiNy6v0QR+ovT@calendula>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1687781219; x=1690373219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PRZhX2OedO6yvy8le6qjqBiOXWwhqwkwfvnbxnNZWRQ=;
        b=Wo2lY5t1f7qnY1bGdUCTr2JTck3ieG15EmKmK0QCqyjfGda4PMxY7eof2wHnyudnOt
         RvswsaZYPTb7F4eAwFiYdFDSqT0M45rE85x1gCk8+ofcFcPySW1m28lJhpp2b/lYZEOw
         uJcAkfG86Pcg9ddaDx9ka6fKLCeXsmMNYYALTpJ2e6aHMi8CwjmERcKu8ByQPXJmNTrs
         8NWUn0DGBiJf236JYW777PLvR+i4amY6zG252BuI5t5j+qedlPm4UM+5F/68Oz+uC5vP
         yH65XCoWocXWjtmyfy5azlfkJvDFUxugarBlgN4V6ZgEWFlxmgVFpaln4EsairNXRq0s
         QxHg==
In-Reply-To: <ZJTEiNy6v0QR+ovT@calendula>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

> > My main concern is that in the nft version the AH rule matches one of the ICMP
> > packets even though the ICMP rule is higher up on the list.
> >
> > I tried to debug this and it seems to be related to this change:
> > https://github.com/torvalds/linux/commit/568af6de058cb2b0c5b98d98ffcf37cdc6bc38a7
> > IIUC, this "stop ipv6_find_hdr on AH" is not a regression but intended behavior.
> >
> > Now the question: is there some way to define rules which will match
> > the same way
> > as it works in iptables-legacy? That is, look at the inner protocol
> > and not stop on AH?
>
> IIRC behaviour between iptables-legacy and ip6tables-legacy with
> regards to AH is inconsistent, because ip6tables-legacy -p matches on
> the inner header encapsulated by AH, but iptables-legacy matches on AH
> with -p.

OK, I understand that this was an inconsistency and it was fixed with
above change
in the kernel but does this mean that there is currently no way to
check the inner
protocol? Or maybe there is some other match or extension which could be used
to get the "old iptables style" behaviour?
