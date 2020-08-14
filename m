From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Is it possible to change a chains default policy when rules are
 already present?
Date: Fri, 14 Aug 2020 13:36:23 +0200
Message-ID: <1ed447f1-da05-38c7-e86e-4451f8040c88@thelounge.net>
References: <AM0PR06MB4628C196EBABF0FD53AA8006C5430@AM0PR06MB4628.eurprd06.prod.outlook.com>
 <20200814110749.GA30331@salvia>
 <c0afef4e-7276-a368-226a-cb315ea1ab69@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c0afef4e-7276-a368-226a-cb315ea1ab69@tootai.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Daniel <tech@tootai.net>, Pablo Neira Ayuso <pablo@netfilter.org>, Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>



Am 14.08.20 um 13:21 schrieb Daniel:
> Le 14/08/2020 à 13:07, Pablo Neira Ayuso a écrit :
>> On Thu, Aug 13, 2020 at 12:28:34PM +0000, Andreas Hoefler wrote:
>>> Hi
>>>
>>> I have a chain with default policy drop.
>>> I would like to first have the default policy set to accept, then add
>>> rules and later change it to drop.
>>> Is this possible?
>> For the record:
>>
>>   nft add chain x y { policy accept\; }
>>
>> Assuming an existing basechain 'y'. The backlash (\) before the
>> semicolon is there in case of invoking this from bash.
> 
> From bash how to you set priority leaded by - like priority -150 \; We
> always get invalid option
> 
> dh@peech:~$ sudo nft add chain ip6 mangle output { type nat hook
> prerouting priority -350 \; policy accept \; }
> nft: invalid option -- '3'

because you don't escape - with \-
don't nft understand quoted params?

nft add chain ip6 mangle output "{ type nat hook prerouting priority
-350 ; policy accept ; }"
