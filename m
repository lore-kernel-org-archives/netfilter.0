From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Use case of nftables + Linux combination as network firewall
Date: Fri, 22 Jan 2021 17:18:32 +0100
Message-ID: <07f9c5ce-264c-e029-73a3-17b2bdb7498a@thelounge.net>
References: <CAEx-Y1-yWpUcfQKe_gkkuEhpRr2Nm59CjRp61dA5-GS8os5ihw@mail.gmail.com>
 <636ad821-67fe-d28c-8a55-47fbf00877bc@thelounge.net>
 <CAEx-Y1-ESE7DSbaCbS3eiBKwCjK7qryrUc_CPAU4gaRkdokG_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAEx-Y1-ESE7DSbaCbS3eiBKwCjK7qryrUc_CPAU4gaRkdokG_Q@mail.gmail.com>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Younwook Jang <younwook@gmail.com>
Cc: netfilter@vger.kernel.org



Am 22.01.21 um 16:46 schrieb Younwook Jang:
> Hi Reindl, thank you for your advice.
> 
> I'm looking reference case of the company or organizations that is
> using Linux+nftables as network firewall.
> 
> Is there any good reference...?

sorry, i can't post the ruleset of our datacenter-firewall but at the 
end of the day iptables/iptables-nft/ipset is as trivial as for a local 
machine

if you are not firm with iptables at all you will have a heavy learning 
curve anyways and if you prefer native nft or iptables-nft has also no 
single answer

https://www.lammertbies.nl/comm/info/iptables

Google:
"iptables datacenter firewall"
"iptables forwarding firewall"

> 2021년 1월 22일 (금) 오후 11:27, Reindl Harald <h.reindl@thelounge.net>님이 작성:
>>
>>
>>
>> Am 22.01.21 um 14:31 schrieb Younwook Jang:
>>> Dear netfilter users,
>>>
>>> I'm looking that real reference case that uses nftables+Linux server
>>> as network firewall.
>>>
>>> Would you please share reference cases or related information ?
>>>
>>> I think that Linux VM with well-configured nftables can be act as
>>> network firewall especially cloud environment.
>>>
>>> Please share your advice
>>
>> it's exactly the same as you do for INPUT with iptables/nftables but in
>> the FORDWARD chain
>>
>> on the pure network layer without inspecting content every middlebox you
>> can buy does exactly the same and in many cases is just using linux +
>> iptables
