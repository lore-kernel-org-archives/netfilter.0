From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: What is the BEST GUI frontend to iptables firewall?
Date: Fri, 27 Mar 2020 14:59:48 +0100
Message-ID: <cf9f289c-b0c5-42cf-2289-926de172f436@thelounge.net>
References: <65bb6d398e79b3d924f518d20f40b48e@teo-en-ming.com>
 <330d7201-6561-61a9-9095-8bdf8ee1518b@hajes.org>
 <fc1f0389e127ff74ee2b22c003918c73@teo-en-ming.com>
 <170b849d-a5cd-aa1c-e7da-4a189e1591be@tootai.net>
 <2a0019439ce80f32af6efe8cc33b497e@teo-en-ming.com>
 <7a8ae72b-1484-6620-a1e6-6ed04fac30a8@thelounge.net>
 <df34cf4de4d39fb3878f5c9d8c2ad177@teo-en-ming.com>
 <1856ba12-090a-5065-1bc9-94203f15b9d4@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1856ba12-090a-5065-1bc9-94203f15b9d4@tootai.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Daniel <tech@tootai.net>, Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming.com>
Cc: david@hajes.org, netfilter@vger.kernel.org



Am 27.03.20 um 13:13 schrieb Daniel:
> 
> Le 27/03/2020 à 13:11, Turritopsis Dohrnii Teo En Ming a écrit :
>> On 2020-03-27 19:35, Reindl Harald wrote:
>>> Am 27.03.20 um 12:24 schrieb Turritopsis Dohrnii Teo En Ming:
>>>>>> What is nftables?
>>>>>
>>>>> It's the replacement of iptables
>>>>>
>>>>> https://wiki.debian.org/nftables
>>>>
>>>> Noted with thanks.
>>>>
>>>> I understand that nftables has replaced iptables since the year 2014
>>>> with the release of Linux kernel 3.13.
>>>
>>> you can use *both* (even at the same time while it's nonsense), kernel
>>> 5.5 and above still support iptables as all the years before
>>
>> But it's better to use nftables over iptables?
> nftables is the future

the future don't help when you have working stuff running and on my
prodcution machines the future is nice but the *present* is relevant

the present with ipset as example

but yes, please as much as possible people should jump to nftables, i am
early adopter enough with Fedora in production over 15 years :-)
