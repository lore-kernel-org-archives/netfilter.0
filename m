From: jalvarez <jalvarez@toulouse.viveris.com>
Subject: Re: netfilter/nftables: chain rule dumps
Date: Tue, 19 Jul 2016 15:47:41 +0200
Message-ID: <578E2F7D.2000604@toulouse.viveris.com>
References: <578636F6.70802@toulouse.viveris.com>
 <20160713144036.GA1385@salvia> <578DEBF0.2090707@toulouse.viveris.com>
 <20160719102855.GA11848@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20160719102855.GA11848@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On 19/07/2016 12:28, Pablo Neira Ayuso wrote:
> On Tue, Jul 19, 2016 at 10:59:28AM +0200, jalvarez wrote:
>> My current changes might actually break the expected behavior if it was some
>> kind of "rule id counter" instead of "iteration counter". If it is possible,
>> I would rather not put the continues in the rules loop, as the goal of these
>> changes is mostly to avoid looping through the whole ruleset.
>>
>> Again, I am very thankful for your help.
>>
>> Here is the patch
> Just sent a patch to netfilter-devel, I've Cc'ed you. It would be good
> if you can test it.
>
> Thanks.

Thank you.
I'll be testing this as soon as my test environment is ready.

Would you like me to send the changes to the nft-rule-get.c example in 
libnftnl afterwards ?
