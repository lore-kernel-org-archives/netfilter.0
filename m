From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Subject: Re: cannot create a nat type base (pre/post routing) chain
Date: Wed, 29 Apr 2020 11:56:55 +0200
Message-ID: <340f4e40-de52-d729-af2b-dd1103f1d245@aimvalley.nl>
References: <690dfdf6-8a72-f6a1-8b36-f92fcc458331@aimvalley.nl>
 <daa384d8-51eb-adfa-4872-fcc188c2b931@aimvalley.nl>
 <20200429094433.GA1539@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20200429094433.GA1539@salvia>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org



On 2020-04-29 11:44, Pablo Neira Ayuso wrote:
> On Wed, Apr 29, 2020 at 11:36:13AM +0200, Norbert van Bolhuis wrote:
> [...]
>> I guess it's some kind of openwrt nf_tables (module) build/incompatibility problem!?
> 
> Your lsmod listing does not show nft_chain_nat, this module should
> autoload when you invoke:
> 
>          add chain nat prerouting { type nat hook prerouting priority 0 ; }
> 
> Did you try modinfo / modprobe nft_chain_nat manually to check if you
> can reach this module?
> 


No, I didn't.

I do remember looking for the nft_chain_nat module, but I guess couldn't find it.

I guess this could be it. I may try later to see if this resolves the problem.

Thanks for your answer.

