From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Migrate ipsets to nftables
Date: Wed, 20 Jan 2021 13:41:19 +0100
Message-ID: <4edf6763-f221-14f2-8b38-dce4b087cbfe@thelounge.net>
References: <520e46a0d20803c22d515aca5e8df7045ca09497.camel@lusan.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <520e46a0d20803c22d515aca5e8df7045ca09497.camel@lusan.id.au>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: nikolai@lusan.id.au, netfilter@vger.kernel.org



Am 20.01.21 um 11:41 schrieb Nikolai Lusan:
> Hi all,
> 
> I am in the process of migrating from iptables+ipsets to nftables. Is
> there an easy way to migrate exisiting ipsets to nftables sets.

not really but you can use iptables-nft which is nearly 100% compatible, 
can use ipset unchanged and behind the scenes uses nft
