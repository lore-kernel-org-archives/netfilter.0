From: Matteo Croce <technoboy85@gmail.com>
Subject: Re: nft error
Date: Wed, 26 Feb 2014 17:26:58 +0100
Message-ID: <CAFnufp3Jigct_=uwUO+7sgNzQuRUHAczSWJ3yS+jSBhu=9H6VQ@mail.gmail.com>
References: <CAFnufp3Wzw9fLk2SU16kR1vfAbwaFQfhAo9dwNqk_80LVUfx4g@mail.gmail.com>
 <20140226102530.GA4093@localhost> <20140226104555.GA4215@localhost> <CAFnufp2EFQcaT6rKQaRLjOrgu32CPgaHvOjBfKzTAawkxOayVg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=r8KpFBdr+y9GWXypPzDVO5SF1rVhgY9SiyISV1BFR1A=;
        b=E07wjP9RbwtqnXpVO97AvNladAV0lzSEZAN6wx8BpEx4mY1SAhd5z15B3wNKe9I9TO
         8WZaPs0SzLF73E2qKLUdJR74KoSVKDx5l8hwf6MmTUEh6yEjpgigsfKkNFmlVxN+SZYk
         C10I+aftqwJgvgNvTHaqbYrjICgblaL6cj06pW4w8BwtUvPFACTvqZf4jy0ECXgjJc/6
         /Z7N5v4S51qr7WBIgBkbNmv1zW+C+oK9BBMZja4bu3zZdOW4NUN0ZTGXNtcVxqVZRaFX
         qE2OAWiTboXyfs1yiYzPm4H2Y18tldKeajcSDB3FUTQuSJVf3GD7CaKUF18RiMOu2egb
         MOsw==
In-Reply-To: <CAFnufp2EFQcaT6rKQaRLjOrgu32CPgaHvOjBfKzTAawkxOayVg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

What module I'm missing now?

# nft list table global
table ip global {
        chain one {
                 type filter hook input priority 0;
        }
}

# nft add set global ipv4_ad \{ type ipv4_address \; \}
internal:0:0-0: Error: Could not add set: Operation not supported

2014-02-26 11:47 GMT+01:00 Matteo Croce <technoboy85@gmail.com>:
> thank you very much
>
> 2014-02-26 11:45 GMT+01:00 Pablo Neira Ayuso <pablo@netfilter.org>:
>> On Wed, Feb 26, 2014 at 11:25:30AM +0100, Pablo Neira Ayuso wrote:
>>> On Wed, Feb 26, 2014 at 11:12:29AM +0100, Matteo Croce wrote:
>>> > Hi,
>>> >
>>> > I'm trying to run nftables on Debian with a vanilla 3.13 kernel.
>>> > I've compiled libnftnl and nftables from git, but when I try to start
>>> > ntf I get this error:
>>> >
>>> > # nft list table filter
>>> > <cmdline>:1:1-17: Error: Could not receive sets from kernel: Address
>>> > family not supported by protocol
>>> > list table filter
>>> > ^^^^^^^^^^^^^^^^^
>>> >
>>> > I think I have all modules loaded:
>>> >
>>> > lsmod |grep nf
>>> > nfnetlink_log          12935  0
>>> > nft_ct                 12486  0
>>> > nft_compat             12844  0
>>> > nft_nat                12459  0
>>> > nf_tables              36626  3 nft_nat,nft_ct,nft_compat
>>> > nfnetlink              12818  3 nf_tables,nfnetlink_log,nft_compat
>>> > nf_conntrack_ipv4      13078  1
>>> > nf_defrag_ipv4         12443  1 nf_conntrack_ipv4
>>> > nf_nat_ipv4            12757  1 iptable_nat
>>> >
>>> > What can it be?
>>>
>>> I don't see the nf_tables_ipv4 and nf_tables_ipv6 modules there.
>>
>> JFYI: Just created this section:
>>
>> http://wiki.nftables.org/wiki-nftables/index.php/Troubleshooting
>>
>> I'll try to collect similar questions in that article.
>
>
>
> --
> Matteo Croce
> OpenWrt Developer
>   _______                     ________        __
>  |       |.-----.-----.-----.|  |  |  |.----.|  |_
>  |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
>  |_______||   __|_____|__|__||________||__|  |____|
>           |__| W I R E L E S S   F R E E D O M
>  -----------------------------------------------------
>  BARRIER BREAKER
>  -----------------------------------------------------
>   * 1/2 oz Galliano         Pour all ingredients into
>   * 4 oz cold Coffee        an irish coffee mug filled
>   * 1 1/2 oz Dark Rum       with crushed ice. Stir.
>   * 2 tsp. Creme de Cacao
>  -----------------------------------------------------



-- 
Matteo Croce
OpenWrt Developer
  _______                     ________        __
 |       |.-----.-----.-----.|  |  |  |.----.|  |_
 |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
 |_______||   __|_____|__|__||________||__|  |____|
          |__| W I R E L E S S   F R E E D O M
 -----------------------------------------------------
 BARRIER BREAKER
 -----------------------------------------------------
  * 1/2 oz Galliano         Pour all ingredients into
  * 4 oz cold Coffee        an irish coffee mug filled
  * 1 1/2 oz Dark Rum       with crushed ice. Stir.
  * 2 tsp. Creme de Cacao
 -----------------------------------------------------
