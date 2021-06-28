From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Reload IPtables
Date: Mon, 28 Jun 2021 20:15:10 +0200
Message-ID: <6c11cb87-6d80-8304-8f3f-59026ac8b682@thelounge.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
 <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
 <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
 <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
 <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
 <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
 <f5314629-8a08-3b5f-cfad-53bf13483ec3@hajes.org>
 <adc28927-724f-2cdb-ca6a-ff39be8de3ba@thelounge.net>
 <96559e16-e3a6-cefd-6183-1b47f31b9345@hajes.org>
 <16b55f10-5171-590f-f9d2-209cfaa7555d@thelounge.net>
 <54e70d0a-0398-16e4-a79e-ec96a8203b22@tana.it>
 <f0daea91-4d12-1605-e6df-e7f95ba18cac@thelounge.net>
 <8395d083-022b-f6f7-b2d3-e2a83b48c48a@tana.it>
 <83719383-c18d-dcb6-07f6-f123872fa68b@thelounge.net>
 <fc8a9cbf-7424-1d14-e927-bbf454733434@tana.it>
 <ef5d64c7-2297-1e97-c6f9-29adbc915f60@thelounge.net>
 <34c23c2d-1646-8ddf-b88c-92374cc7d51b@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <34c23c2d-1646-8ddf-b88c-92374cc7d51b@tana.it>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Alessandro Vesely <vesely@tana.it>, netfilter@vger.kernel.org



Am 28.06.21 um 19:35 schrieb Alessandro Vesely:
> On Mon 28/Jun/2021 14:03:30 +0200 Reindl Harald wrote:
>> Am 28.06.21 um 13:47 schrieb Alessandro Vesely:
>>> On Mon 28/Jun/2021 12:17:11 +0200 Reindl Harald wrote:
>>>> Am 28.06.21 um 11:23 schrieb Alessandro Vesely:
>>
>>>> do what you want but stop talking nonsense when it comes to best 
>>>> practice 
>>>
>>> One "best practice" that I'd object to is blindly restoring whatever 
>>> was saved on shutdown.  How can one control that?  Booting with some 
>>> clean, well-defined data looks safer
>>
>> WTF: there is nothing magically or blindly saved and changed at 
>> shutdown, it's the whole state as it was, the outcome from your script
>>
>> do you guys not realize that your shellscripts are fine as mine are 
>> but at the end the iptables ruleset has a defined state which want you 
>> have restored 1:1 at boot
> 
> If the defined state is the result of a shell script, re-running the 
> same shell script should result in the same state.  Restoring from the 
> last-saved state may be faster/ cooler, but roughly equivalent

* it's faster
* it's atomic
* it has less dependencies
* it has less involved software
* it has less chances of breaking bugs

it's not about "cool" but acting with a brain and following the unix 
way: one tool for one job

give me *one* vaild reason to waste ressources other than "everybody 
does, that's why machines 10000 times faster than 30 years ago are in 
many cases as slow because we waste ressources when they are available"

only the idea doing "roughly equivalent" but way slower when it costs 
you *one line* do do it fast, clean and atomic should get you fired 
whereever you work

but argue about it is braindead
