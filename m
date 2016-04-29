From: Daniel Wagner <wagi@monom.org>
Subject: Re: autoload of nft modules
Date: Fri, 29 Apr 2016 07:33:45 +0200
Message-ID: <9ca55cc7-1951-3151-0df3-335e17443ee9@monom.org>
References: <67e90927-885f-e860-a1dd-9f61ea95b53e@monom.org>
 <20160427125447.GA6899@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20160427125447.GA6899@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, connman@lists.01.org, Dragos Tatulea <dragos@endocode.com>

On 04/27/2016 02:54 PM, Pablo Neira Ayuso wrote:
> On Wed, Apr 27, 2016 at 10:52:13AM +0200, Daniel Wagner wrote:
>> Dragos and I are working on getting nft support into ConnMan [1]. Now we
>> face a small problem with the rule we load, which are essentially:
>>
>>  nft add table connman
>>  nft add chain connman nat-prerouting			\
>> 	{ type nat hook prerouting priortiy 0 ; }
>>  nft add chain connman nat-postrouting			\
>> 	{ type nat hook postrouting priortiy 0 ; }
>>  nft add chain connman filter-output			\
>> 	{ type filter hook output priority 0 ; }
>>
>> These work nicely using the nft CLI but when we run those commands
>> via libnftnl after a fresh reboot of the system, there is a ENOENT at
>> the third rule.
> 
> Most likely you're missing the NLM_F_CREATE flags in your netlink
> messages.

Yes, that did they the trick.

> Please, send us patches for the example so other don't hit this
> problem.

Will do.

thanks,
daniel
