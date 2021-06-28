From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Reload IPtables
Date: Mon, 28 Jun 2021 14:03:30 +0200
Message-ID: <ef5d64c7-2297-1e97-c6f9-29adbc915f60@thelounge.net>
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
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <fc8a9cbf-7424-1d14-e927-bbf454733434@tana.it>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Alessandro Vesely <vesely@tana.it>, netfilter@vger.kernel.org



Am 28.06.21 um 13:47 schrieb Alessandro Vesely:
> On Mon 28/Jun/2021 12:17:11 +0200 Reindl Harald wrote:
>> Am 28.06.21 um 11:23 schrieb Alessandro Vesely:
>>> A complex script doesn't have to be error prone.
>>
>> it is by definition more error prone than a simple restore which has 
>> exactly that job and it makes no sense to argue about such simple facts
> 
> 
> As Kerin showed, restore is not intrinsically simpler, as it has to deal 
> with the same amount of data.  It is only laid down in a different 
> format.  

for the sake of god you are not supposed to deal with that format as 
human at all - you only need to know where you write it and load it from 
there

> The shell format is more verbose, but has some advantages:

not at boot time

> * it allows to test each single command separately

off-topic in the case of reload the complete ruleset

> * its format is time-honored and fully documented.

off-topic in the case of reload the complete ruleset

>> do what you want but stop talking nonsense when it comes to best practice 
> 
> One "best practice" that I'd object to is blindly restoring whatever was 
> saved on shutdown.  How can one control that?  Booting with some clean, 
> well-defined data looks safer

WTF: there is nothing magically or blindly saved and changed at 
shutdown, it's the whole state as it was, the outcome from your script

do you guys not realize that your shellscripts are fine as mine are but 
at the end the iptables ruleset has a defined state which want you have 
restored 1:1 at boot

this whole discusssion is embarrassing and especially when the target 
audience in this case is a noob-user it's idiotic not follow best practices

nobody gives a shit how you create the ruleset and nobody right in his 
mind would touch the save-file by anything else but "iptables-save 
--file path" as nobody right in his mind would load it by anything else 
than  "iptables-nft-restore path"

arguments like "i don't care if it's atomic in my special situation" and 
"i don't care how long it takes in my special situation" are dumb in 
context of the subject

please stop spreading bullshit - we have enough idiots out there blindly 
follow whatever they read whereever on the internet without the 
slightest clue what they are doing

YOU can do what you want on YOUR machine but best practices are there to 
avoid endless threads over and over again when someone has a problem and 
nobody knows about his setup and your "i do everything like i want" is 
off-topic
