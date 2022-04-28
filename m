From: Florian Westphal <fw@strlen.de>
Subject: Re: nft add element .. too many fiules opened
Date: Thu, 28 Apr 2022 16:04:27 +0200
Message-ID: <20220428140427.GE9849@breakpoint.cc>
References: <1ECEF323-1FB2-4332-A5BF-81B5D4B9D394@home.hudecof.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1ECEF323-1FB2-4332-A5BF-81B5D4B9D394@home.hudecof.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Peter Hudec <peter@home.hudecof.net>
Cc: netfilter@vger.kernel.org

Peter Hudec <peter@home.hudecof.net> wrote:
> Hi there,
> 
> we have very strange problem with the nftables.
> Our firewall is using heavly the sets and the update of the sets from the path.
> 
> First see part of the firewall, ignore the elemtns in the sets, I just keep few as a sample. Normaly there is about up to 600 records.
> The firewall acts as captive, the elemnts are added externaly by script after user/ip authentification.
> 
> The problem is, that after some time I have got “Too many files opened “ on captive_keepalive set. The update from the path also stoped working.
> 
> #  /usr/sbin/nft add element ip captive captive_keepalive { 10.148.128.168 };
> Error: Could not process rule: Too many open files in system
> add element ip captive captive_keepalive { 10.148.128.168 }
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

How many elements are in this set?

> table ip captive {
>         set captive_keepalive {
>                 type ipv4_addr
>                 size 65535

... this caps at 64k entries.
