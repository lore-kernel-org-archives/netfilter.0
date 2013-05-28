From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Strange behavior with ipset not matching on public range
Date: Tue, 28 May 2013 15:35:16 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1305281534080.15994@blackhole.kfki.hu>
References: <1369662135.4058.24.camel@BEWS005.euractiv.com>   <alpine.DEB.2.00.1305271548390.11760@blackhole.kfki.hu>  <1369665896.4058.29.camel@BEWS005.euractiv.com>  <alpine.DEB.2.00.1305272011390.13657@blackhole.kfki.hu>
 <1369747804.5217.2.camel@BEWS005.euractiv.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1369747804.5217.2.camel@BEWS005.euractiv.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jimmy Thrasibule <thrasibule.jimmy@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, 28 May 2013, Jimmy Thrasibule wrote:

> > I think you should upgrade: some drivers doesn't zero pad interface names 
> > and than can fool ipset up to 6.12.1. It was fixed in 6.13.
> 
> Looking at the changelog, it looks like 6.13 is fixing an issue which
> can be the one I encounter. Do you have a link to this commit or a
> commit hash so I can report the bug to the Debian team?

commit ef5b6e127761667f78d99b7510a3876077fe9abe
Author: Florian Westphal <fw@strlen.de>
Date:   Sun Jun 17 09:56:46 2012 +0000

    netfilter: ipset: fix interface comparision in hash-netiface sets
    
    ifname_compare() assumes that skb->dev is zero-padded,
    e.g 'eth1\0\0\0\0\0...'. This isn't always the case. e1000 driver does
    
    strncpy(netdev->name, pci_name(pdev), sizeof(netdev->name) - 1);
    
    in e1000_probe(), so once device is registered dev->name memory contains
    'eth1\0:0:3\0\0\0' (or something like that), which makes eth1 compare
    fail.
    
    Use plain strcmp() instead.
    
    Signed-off-by: Florian Westphal <fw@strlen.de>
    Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
