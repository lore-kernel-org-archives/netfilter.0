From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Reload IPtables
Date: Sun, 27 Jun 2021 23:33:25 +0200
Message-ID: <6e0a9e55-bef3-0cad-9869-2a89928c07a9@thelounge.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
 <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
 <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
 <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
 <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
 <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
 <20210627191107.79ca63b9cf4dfe9028649524@plushkava.net>
 <227edb33-b86d-2310-bc63-c6d903bea95d@att.net>
 <bc2e17dc-76ad-cc86-733b-32700b5adc07@thelounge.net>
 <d03acc84-93b2-c901-d897-f93748c5babd@att.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d03acc84-93b2-c901-d897-f93748c5babd@att.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: slow_speed@att.net, netfilter@vger.kernel.org



Am 27.06.21 um 22:57 schrieb slow_speed@att.net:
> 
> On 6/27/21 2:57 PM, Reindl Harald wrote:
>>
>> it's very distribution specific and that's why this is likely the 
>> wrong mailing list
> Yes, I understand the distribution issue; I was just pointing that out. 
> However, netfilter@vger.kernel.org appears to be the end-all and be-all 
> of netfilter issues.  Thus, one should address this list.
> 
> Further, we should not learn just for one distro.  That would be a huge 
> mistake.

exactly, but which file is where holding your config is distribution 
specific unless you ignore all that stuff and start standing on your own 
feet

>> why do you think you need a manual flush? 
> 
> Because I do not have the experience regarding the internal workings of 
> iptables/nftables in this regard.
> 
> It is very simply; does one need to flush before reloading or not?

no and the word "reload" is simply wrong
you *load* a saved rulestate as you do at boot time
