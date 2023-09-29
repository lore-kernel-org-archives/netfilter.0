From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: ipset swap to nftables set
Date: Fri, 29 Sep 2023 16:36:54 +0200
Message-ID: <540ed704-0167-821c-48fb-f6f1d3579b33@thelounge.net>
References: <befa0f8e-e76f-8671-81b1-587351b0cf53@gmail.com>
 <BjREwaQOkZH39wBPsI8ssbjemY70ncttNem9PHtJiq-_5H7NfnmFDCyS7nf6pPMtUR2BCZS_KG2SMuMyXZfL7gUdsM_93_kLkCdQWG-H2lg=@proton.me>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <BjREwaQOkZH39wBPsI8ssbjemY70ncttNem9PHtJiq-_5H7NfnmFDCyS7nf6pPMtUR2BCZS_KG2SMuMyXZfL7gUdsM_93_kLkCdQWG-H2lg=@proton.me>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eric <evil.function@proton.me>, marek <cervajs64@gmail.com>
Cc: netfilter@vger.kernel.org



Am 29.09.23 um 16:30 schrieb Eric:
> On Friday, September 29th, 2023 at 06:44, marek <cervajs64@gmail.com> wrote:
>> - nft flush set ip filter blackhole
>>
>> - nft add element ip filter blackhole { X } (bash for loop)
> 
> Hi Marek,
> 
> Do that last step atomically and it should be plenty fast.
> 
> nft flush set ip filter blackhole
> nft add element ip filter blackhole {\
>      1.0.0.1, \
>      1.0.0.2, \
>      1.0.0.3, \
>      1.1.1.1, \
>      1.1.1.2, \
>      1.1.1.3, \
>      1.193.146.35, \
> ...
>      99.99.99.99, \
> }

still horrible ciomoared to ipset swap beause it is *not* atomically
