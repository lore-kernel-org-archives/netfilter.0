From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Failing to compile latest iptables from git
Date: Thu, 11 Feb 2016 04:34:09 +0100
Message-ID: <56BC0131.3030900@chello.at>
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
>
>
> I have installed latest libs (libmnl, libnetlink,
> libnetfilter_conntrack) from git. The ld.so.conf.d files point to the
> libaries but that seems to be ignored (ldconfig was run), so I put this
> into my environment:
>
> export LDFLAGS="-L/usr/local/lib/
> -L/opt/k_3.2.35/libnetfilter_conntrack/lib/
> -L/opt/k_3.2.35/libnfnetlink/lib -L/opt/k_3.2.35/libmnl/lib/"
>
> export LD_LIBRARY_PATH="-L/opt/k_3.2.35/libnfnetlink/lib
> -L/opt/k_3.2.35/libmnl/lib -L/opt/k_3.2.35/libnetfilter_conntrack/lib"
>
> export LD_RUN_PATH="-L/opt/k_3.2.35/libnfnetlink/lib
> -L/opt/k_3.2.35/libmnl/lib -L/opt/k_3.2.35/libnetfilter_conntrack/lib"

omg, those two should be colon separated, not -L prefixed.
Now it works....

