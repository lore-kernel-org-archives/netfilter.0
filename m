From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Failing to compile latest iptables from git
Date: Wed, 10 Feb 2016 17:31:39 +0100
Message-ID: <56BB65EB.4070809@chello.at>
References: <56BA5718.6040403@chello.at>
Reply-To: mart.frauenlob@chello.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56BA5718.6040403@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 09.02.2016 22:16, netfilter-owner@vger.kernel.org wrote:
> Hello list,
>
> I'm trying to prepare a patch for iptables, but unfortunately I'm
> failing to build it. I've done it many times before, but this time I
> don't know what's wrong, so I hope for your assistance.
>
> The ./configure step runs just fine. It stops at the make process with
> this error:
>
>    CC       libxt_connlabel.oo
>    CCLD     libxt_connlabel.so
> libxt_connlabel.oo: In function `connlabel_open':
> /home/ellen/git/iptables.git/extensions/libxt_connlabel.c:40: undefined
> reference to `nfct_labelmap_new'
> libxt_connlabel.oo: In function `connlabel_mt_parse':
> /home/ellen/git/iptables.git/extensions/libxt_connlabel.c:56: undefined
> reference to `nfct_labelmap_get_bit'
> libxt_connlabel.oo: In function `connlabel_get_name':
> /home/ellen/git/iptables.git/extensions/libxt_connlabel.c:76: undefined
> reference to `nfct_labelmap_get_name'
> collect2: ld returned 1 exit status
[...]

Ok, I'm running into the same problem on fresh install of debian 8.3 
(stable).
Only non standard libs are mnl netlink and conntrack.
This time I added the CPPFLAGS variable I previously forgot, but doesn't 
change anything.
pkg-config --list-all shows all the libs with correct versions.
I'm bit clueless, I must admit.

Looking for help, thank you
Mart
