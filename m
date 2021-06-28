From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Reload IPtables
Date: Mon, 28 Jun 2021 18:35:59 +0200
Message-ID: <031d674a-ba50-6925-5a7a-36db1f2e0fbe@thelounge.net>
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
 <20210628144655.4246a21cb17663ed51981625@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20210628144655.4246a21cb17663ed51981625@plushkava.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Kerin Millar <kfm@plushkava.net>
Cc: Alessandro Vesely <vesely@tana.it>, netfilter@vger.kernel.org



Am 28.06.21 um 15:46 schrieb Kerin Millar:
> On Mon, 28 Jun 2021 14:03:30 +0200
> Reindl Harald <h.reindl@thelounge.net> wrote:
> 
>>>> do what you want but stop talking nonsense when it comes to best practice
>>>
>>> One "best practice" that I'd object to is blindly restoring whatever was
>>> saved on shutdown.  How can one control that?  Booting with some clean,
>>> well-defined data looks safer
>>
>> WTF: there is nothing magically or blindly saved and changed at
>> shutdown, it's the whole state as it was, the outcome from your script
> 
> Not that I can speak on Allesandro's behalf but I'm presuming it's a reference to the save-upon-stop behaviour that may occur as a consequence of the integration performed by certain distro vendors. For example, Gentoo has a SAVE_ON_STOP option that its iptables runscript honours. I'm not sure that I've ever seen it be referred to as a good pratice, per se, but some people appreciate having such options at their disposal

and how do you think should there be something different as you are using?

don't you simply not understand what save/restore does?
your active ruleset don't fall from heaven

it's not magically changed unless you change something with iptables or 
your script

and hell that's why when you changed something and want to reload the 
last boot state you restore and you are done - that's the topic here


