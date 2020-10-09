From: Bernd Naumann <bena@spreadshirt.net>
Subject: Re: Newbie: IPv6 equivalent of 192.168.178.0/24
Date: Fri, 9 Oct 2020 15:20:44 +0200
Message-ID: <018e7799-ce0e-8002-e06f-cee1f698935a@spreadshirt.net>
References: <021101d69e3a$b2ce88e0$186b9aa0$@gmail.com>
 <3febcbd8-5a08-5b1d-724b-30f995d6eeca@spreadshirt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3febcbd8-5a08-5b1d-724b-30f995d6eeca@spreadshirt.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

On 09.10.20 15:16, Bernd Naumann wrote:
> On 09.10.20 14:49, paul.guijt@gmail.com wrote:
>> I had
>>     add rule  inet filter input ip   saddr 192.168.178.0/24         
>> jump LocalIN
>>     add rule  inet filter input ip6 saddr 
>> fe::/10                             jump LocalIN
>> to divert all packets coming from my private network to rules in the 
>> LocalIN chain.
>>
>> Nftables converts the second line into “ip6 saddr c0::/10 jump 
>> LocalIN”. FE into C0.
>> Will that do what I intended? If not, what rule do you prefer?
>>
>> Regards,
>> Paul Guijt
>>
>>
> 
> Hi Paul,
> 
>  From 
> https://www.iana.org/assignments/iana-ipv6-special-registry/iana-ipv6-special-registry.xhtml 
> 
> 
>  > fc00::/7     Unique-Local
>  > fe80::/10     Link-Local Unicast
> 
> I assume you want both in your case. ULA (unique local addr) and 
> link-local.
> Or, if you do not want to allow the whole ULA space, maybe just i.e. a 
> `/48`, like i.e. openwrt generates for you automatically.
> A use case to not accept the whole fc00::/10 would be if you are 
> connected to i.e. dn42, or another community VPNs, which makes use of ULA.
> 


Sorry double-post.

Sorry... double-post.
I wanted to say:

A use case to not accept the whole **fc00::/7** would be if you are 
connected to i.e. dn42, or another community VPNs, which makes use of ULA.
