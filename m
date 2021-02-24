From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: 'Did not kill' written out when redirecting 'nft list ruleset'
 in 0.9.8
Date: Thu, 25 Feb 2021 00:37:31 +0100
Message-ID: <20210224233731.GA16083@salvia>
References: <CANf9dFOxZ9VyjyruHuU3OJu0+-1-Bsnhaw2u8XfqyDpmK26mRg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANf9dFOxZ9VyjyruHuU3OJu0+-1-Bsnhaw2u8XfqyDpmK26mRg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Gignac <martin.gignac@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, Feb 24, 2021 at 06:00:23PM -0500, Martin Gignac wrote:
> Hi,
> 
> With nft 0.9.8, if I run 'nft list ruleset' and redirect to a file, it
> prints out "Did not kill":
> 
>     [root@s116r2l1fw01b magi]# nft -v
>     nftables v0.9.8 (E.D.S.)
>     [root@s116r2l1fw01b magi]# nft list ruleset > /dev/null
>     Did not kill
>     [root@s116r2l1fw01b magi]#
> 
> On 0.9.7, it does not:
> 
>     [root@s116r2l1fw01b magi]# nft -v
>     nftables v0.9.7 (Anyface)
>     [root@s116r2l1fw01b magi]# nft list ruleset > /dev/null
>     [root@s116r2l1fw01b magi]#
> 
> Does anyone else see this behavior? If so, do you know what "Did not
> kill" is/means?

Looks like stderr debugging slipped through master, it's already fixed in:

533565244d88 ("payload: check icmp dependency before removing previous icmp expression")
