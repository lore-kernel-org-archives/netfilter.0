From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: About nftable nat rule
Date: Wed, 24 May 2017 12:44:46 +0200
Message-ID: <20170524104446.GA23302@salvia>
References: <CAG1z+7_ngCZQcT7WSU+pzCeb2S8DS4kHe6+Z1+R0+ccPs6dWJQ@mail.gmail.com>
 <CAOkSjBhMSkyTKAqLYDMu88eAH=k2Hz_DxtLRB4mqPxbJHJOM5g@mail.gmail.com>
 <CAG1z+78-vrwDkSfvfy21NVhPqrYuxivmX5u-k+on6SW7cU5khw@mail.gmail.com>
 <CAOkSjBiuGUkVirqtAbCSPQd5pwvMcjgvt6FPApUaAgU2eXZ7Bg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOkSjBiuGUkVirqtAbCSPQd5pwvMcjgvt6FPApUaAgU2eXZ7Bg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arturo Borrero Gonzalez <arturo@debian.org>
Cc: Zheng konia <konianet@gmail.com>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

On Wed, May 24, 2017 at 11:49:04AM +0200, Arturo Borrero Gonzalez wrote:
> On 24 May 2017 at 11:30, Zheng konia <konianet@gmail.com> wrote:
> > Hi, I do have read your wiki.
> >
> > However, there's less example about DNAT --to-destination-port range.
> > You do have examples about to different destination, while I am
> > looking for the different destination-port balance.
> >
> > Any suggestion?
> >
> 
> Try something like this:
> 
> nft add rule t c ip protocol tcp dnat to 192.168.1.100 : numgen inc
> mod 2 map { 0 : 4040 , 1 : 4050 }
> (i.e, the destination address doesn't change, but port does)
> 
> We can update the wiki if that works.

BTW, depending on your environment, you may want to use a stateless
NAT approach too that should be faster, eg.

nft add rule t c ip protocol ip daddr set 192.168.1.100 \
        tcp dport set numgen inc mod 2 map { 0 : 4040 , 1 : 4050 }

This requires a recent Linux kernel though.

Note: Beware with stateless NAT, it only works with 1:1 mappings, it's
easy to shoot yourself on your own feet... Otherwise, stick to the
stateful approach.
