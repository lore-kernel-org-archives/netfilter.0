From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Raw payload matching beyond 2040 bits
Date: Wed, 7 Sep 2022 16:55:38 +0200
Message-ID: <Yxiw6g7/NpotoRqJ@salvia>
References: <20220819100738.63yvp7iggoilt2uc@sourcephile.fr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20220819100738.63yvp7iggoilt2uc@sourcephile.fr>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julien Moutinho <julm+netfilter@sourcephile.fr>
Cc: netfilter@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>

On Fri, Aug 19, 2022 at 12:07:38PM +0200, Julien Moutinho wrote:
> Hi netfilter@,
> 
> Apparently matching beyond 2040 bits (255 bytes) starts again at 0 or something like that.
> Not sure whether this is intended or not,
> but in this case a warning would be appreciated.
> 
> Thanks for your work,
> Julien
> 
> # nft add rule inet nat prerouting udp dport 4242 @th,2040,128 0x12345678912345678912345678912345 log
> 
> # nft add rule inet nat prerouting udp dport 4242 @th,2048,128 0x12345678912345678912345678912345 log
> 
> # nft list ruleset | grep 4242
> udp dport 4242 @th,2040,128 0x12345678912345678912345678912345 log
> udp dport 4242 udp sport 4660 udp dport 22136 udp length 37155 udp checksum 17767 @th,64,64 0x8912345678912345 log

Upstream kernel fix:

commit 94254f990c07e9ddf1634e0b727fab821c3b5bf9
Author: Pablo Neira Ayuso <pablo@netfilter.org>
Date:   Sun Aug 21 11:47:04 2022 +0200

    netfilter: nft_payload: report ERANGE for too long offset and length

