From: Matteo Croce <technoboy85@gmail.com>
Subject: Re: nft error
Date: Wed, 26 Feb 2014 11:28:15 +0100
Message-ID: <CAFnufp3s=miaGinQ6x27L2QS1UON5Upr5YJFS6rRM4zgS=wQ4A@mail.gmail.com>
References: <CAFnufp3Wzw9fLk2SU16kR1vfAbwaFQfhAo9dwNqk_80LVUfx4g@mail.gmail.com>
 <20140226102530.GA4093@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=CU5IcN6AexENB8CKtAXARJoelg4Mz1vak6PzVGki9A4=;
        b=TthFoNvmYNp0a5PpJwN/txRXcBd0D5Bt3yVmm05/EZYk55ToAJow/eDWxoazEBWuVc
         QZA04i/P4Vgh8G6ZmRAa8LtSHuawOnfIE8d3JqikFwInNJSfBJwwj3AUShIGxwZZzB7e
         RuOeMfCXg8hLDk0z4UeKVtOP3RySv46Q/oOOiw2c1YZ85bIpqi4StlwPpqg2TZ7aMwKl
         Bm+8eXrIbVF928yt/M7YbswYyPMajhjS3Dt6ErAwJB+ZFbxkWKZ3T7i8P+Ipb7zHJ/TL
         P0eH0vQDM7l86Y3BWxuaTVn+T+4sqwhsVn1bYnwY/bihJ/e5tHp5t+dfYBrH4Hi2roCK
         Pg7A==
In-Reply-To: <20140226102530.GA4093@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

it gets loaded after running 'nft add table filter' as Eric suggested

2014-02-26 11:25 GMT+01:00 Pablo Neira Ayuso <pablo@netfilter.org>:
> On Wed, Feb 26, 2014 at 11:12:29AM +0100, Matteo Croce wrote:
>> Hi,
>>
>> I'm trying to run nftables on Debian with a vanilla 3.13 kernel.
>> I've compiled libnftnl and nftables from git, but when I try to start
>> ntf I get this error:
>>
>> # nft list table filter
>> <cmdline>:1:1-17: Error: Could not receive sets from kernel: Address
>> family not supported by protocol
>> list table filter
>> ^^^^^^^^^^^^^^^^^
>>
>> I think I have all modules loaded:
>>
>> lsmod |grep nf
>> nfnetlink_log          12935  0
>> nft_ct                 12486  0
>> nft_compat             12844  0
>> nft_nat                12459  0
>> nf_tables              36626  3 nft_nat,nft_ct,nft_compat
>> nfnetlink              12818  3 nf_tables,nfnetlink_log,nft_compat
>> nf_conntrack_ipv4      13078  1
>> nf_defrag_ipv4         12443  1 nf_conntrack_ipv4
>> nf_nat_ipv4            12757  1 iptable_nat
>>
>> What can it be?
>
> I don't see the nf_tables_ipv4 and nf_tables_ipv6 modules there.



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
