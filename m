From: Arturo Borrero Gonzalez <arturo@debian.org>
Subject: Re: nft list ruleset miss nat config information
Date: Wed, 31 May 2017 12:32:06 +0200
Message-ID: <CAOkSjBiz-j+z2p866jzdi1L+igx_P1N1Am6mWUKkHg+sSoTAMA@mail.gmail.com>
References: <CAG1z+7_yU2Br2eu3h3-+oTseUnKpcCfrj+rkYQpBU+QGVsnkMQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAG1z+7_yU2Br2eu3h3-+oTseUnKpcCfrj+rkYQpBU+QGVsnkMQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zheng konia <konianet@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 31 May 2017 at 10:13, Zheng konia <konianet@gmail.com> wrote:
> Hi,
>       Refer to the wiki from this
> https://wiki.nftables.org/wiki-nftables/index.php/Multiple_NATs_using_nftables_maps
>
>      I configured the my server's nftables like this
>
> % nft add rule nat prerouting dnat \
>       tcp dport map { 1000 : 1.1.1.1, 2000 : 2.2.2.2, 3000 : 3.3.3.3} \
>       : tcp dport map { 1000 : 1234, 2000 : 2345, 3000 : 3456 }
>
>
> However, when I try nft list ruleset, I can't get the destination ip
> addr, like 1.1.1.1 or 2.2.2.2
>


This has been fixed already. The next release will contain the fix.
