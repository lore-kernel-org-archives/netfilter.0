From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ipset issues
Date: Tue, 31 May 2016 12:25:05 +0200
Message-ID: <20160531102505.GA2073@salvia>
References: <CANY1rLhdjTYRu51fsDZaMZ04gzkkN5MLa1-MNJHwqx=v-2c3ow@mail.gmail.com>
 <alpine.DEB.2.10.1605252255340.18463@blackhole.kfki.hu>
 <CANY1rLhrLraT3PauKqZp8+8rfJjQGDd-_4Adq=oLGcJ8wUKa+Q@mail.gmail.com>
 <alpine.DEB.2.10.1605302116350.18831@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.10.1605302116350.18831@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Art Emius <art@emius.ru>, netfilter@vger.kernel.org

On Mon, May 30, 2016 at 09:19:34PM +0200, Jozsef Kadlecsik wrote:
> Hello,
> 
> On Sat, 28 May 2016, Art Emius wrote:
> 
> > This makes me feel confused, but seems it doesn't work at all. I've 
> > tried both src,src and src,dst parameters. Still I see packets are being 
> > dropped. But I use -i / -o in iptables rules it works fine.
> 
> Sorry, I messed up the parameters.
>  
> I think your kernel does not contain the patch
> 
> commit ef5b6e127761667f78d99b7510a3876077fe9abe
> Author: Florian Westphal <fw@strlen.de>
> Date:   Sun Jun 17 09:56:46 2012 +0000
> 
>     netfilter: ipset: fix interface comparision in hash-netiface sets
>     
>     ifname_compare() assumes that skb->dev is zero-padded,
>     e.g 'eth1\0\0\0\0\0...'. This isn't always the case. e1000 driver does
>     
>     strncpy(netdev->name, pci_name(pdev), sizeof(netdev->name) - 1);
>     
>     in e1000_probe(), so once device is registered dev->name memory contains
>     'eth1\0:0:3\0\0\0' (or something like that), which makes eth1 compare
>     fail.
>     
>     Use plain strcmp() instead.
> 
> which went into the kernel v4.2. I assume it was not backported into older 
> kernel releases.

This seems to apply cleanly against 3.2.x and 3.4.x.

I can request -stable submission for these two.
