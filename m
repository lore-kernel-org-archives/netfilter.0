From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: setting meta priority to select link vlan qos 802.1q priority
 via egress map
Date: Wed, 11 May 2016 22:49:06 +0200
Message-ID: <20160511204906.GA24369@salvia>
References: <CAGBdaZm-3nTMOp=zTF_=h3=epRDDAA13UCwZxnGg5jg8MV1yGg@mail.gmail.com>
 <CAGBdaZ=9bcechsjddxbcFZJGTv7UpkTSi22stnWBnyAsOvxHjw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGBdaZ=9bcechsjddxbcFZJGTv7UpkTSi22stnWBnyAsOvxHjw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brad Pousland <bpousland@izuma.net>
Cc: netfilter@vger.kernel.org

On Wed, May 11, 2016 at 03:07:42PM -0500, Brad Pousland wrote:
> It appears to be a bug with the nftables userspace utility nft. I
> wrote a program to decode nftables rules and found the nft utility is
> trying to fill the BPF data register with the priority value in
> big-endian format.  If I hack it to use little-endian format for the
> meta value, the skb->priority is set appropriately.

Could you pass your hack so we can have a look?

Thanks!
