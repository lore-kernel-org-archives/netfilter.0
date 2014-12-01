From: stoffl4ever <stoffl4ever@gmail.com>
Subject: Re: nft icmpv6 mld-listener-query rule not honored?
Date: Mon, 01 Dec 2014 16:53:20 +0100
Message-ID: <547C8EF0.4070200@gmail.com>
References: <547483B3.6040207@gmail.com> <20141201125940.GA11047@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=1McqHouJM2iej+stE/dcyovpVJWzX5CLNDtzVHubDT8=;
        b=lqub3uDOeWcWzfidVyab+ipR/Qx4Civ3Dpcm3cwIK2NQ8k7jg5SsIejxfIh4dF4vY7
         UOI4aSiVroNdAacn4NJhnnTNk4FgzpjFiqn48WSMhs88O+kDIk3RcV2THn2m8pABXeX8
         2FpsIbvo4u87a8e5T77SP/OuGPZcvR3009hHl4p5yz0XyPb9+OKDP3ctdcY84hfrVQU4
         hly57iC6P84fg3u1PGtBWE38BvpvTRPxVHX6l3QIAGpmXt0SEY2lEmZaip9L9qN3rIcy
         BAxbiGzK9oT2japKcRg06nJF9dLY/L2tJ66sh012njtMpmvBJFejO1EEq4bFwF7XQ1ZA
         Lt3w==
In-Reply-To: <20141201125940.GA11047@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On 01.12.2014 13:59, Pablo Neira Ayuso wrote:
> On Tue, Nov 25, 2014 at 02:27:15PM +0100, stoffl4ever wrote:
>> SysInfo:
>> kernel: 3.17.4.201411220955-1-grsec (all nf* modules loaded)
>> nft: nftables v0.3
>> Network setup via systemd-networkd: br0(bridge) is attached to
>> eth0(physical nic)
>>
> You need these two patches:
>
> http://git.kernel.org/cgit/linux/kernel/git/pablo/nf-next.git/commit/?id=68b0faa87d167ec87ba2a26be62241ad94eb449b
> http://git.kernel.org/cgit/linux/kernel/git/pablo/nf-next.git/commit/?id=1b63d4b9b54cee6002757a8d20b537aa4037ae8f
>
> They apply to Linux kernel 3.18-rc.
>
> The second patch sets the transport layer offset to get layer 4
> protocol matching from the bridge. Please, I'd appreciate if you can
> give them a test and report, those two are scheduled for 3.19.
Thank you, I am hoping to try it out asap, but I have to setup another
System because the current system is a semi-production machine that I
don't have any other access then ssh, and no grsec patch set is
available for 3.18-rc.
> BTW, I noticed that you're using the 'inet' family. I guess you're
> using bridge netfilter. I think you should use the 'bridge' family
> instead, it comes with native working reject support since the
> upcoming 3.18.
Okay I'll try that when i have 3.18 on my box.
> One of the goals of nftables is to supersede br_netfilter.
>
I am not using br_netfilter, see lsmod output:

sudo lsmod | grep nf :

nf_log_ipv6             6470  2
nf_log_ipv4             5541  2
nf_log_common           4338  2 nf_log_ipv4,nf_log_ipv6
nft_log                 3411  2
nf_conntrack_ipv6      12173  4
nf_defrag_ipv6         27646  1 nf_conntrack_ipv6
nf_conntrack_ipv4      12554  4
nf_defrag_ipv4          2435  1 nf_conntrack_ipv4
nft_ct                  4498  4
nf_conntrack           86560  3 nft_ct,nf_conntrack_ipv4,nf_conntrack_ipv6
nft_counter             2467  8
nft_meta                4405  29
nft_hash                4219  4
nft_rbtree              3759  0
nf_tables_bridge        2558  0
nf_tables_arp           2546  0
nf_tables_inet          2491  4
nf_tables_ipv6          2878  1 nf_tables_inet
nf_tables_ipv4          2878  1 nf_tables_inet
nf_tables              52221  135
nf_tables_inet,nf_tables_ipv4,nf_tables_ipv6,nft_log,nft_ct,nf_tables_bridge,nft_hash,nft_meta,nft_rbtree,nf_tables_arp,nft_counter
nfnetlink               7016  1 nf_tables

sudo lsmod | grep br :

nf_tables_bridge        2558  0
nf_tables              52221  135
nf_tables_inet,nf_tables_ipv4,nf_tables_ipv6,nft_log,nft_ct,nf_tables_bridge,nft_hash,nft_meta,nft_rbtree,nf_tables_arp,nft_counter
bridge                118306  0
stp                     2653  1 bridge
llc                     5081  2 stp,bridge

