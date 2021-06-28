From: Alessandro Vesely <vesely@tana.it>
Subject: Re: Reload IPtables
Date: Mon, 28 Jun 2021 19:35:58 +0200
Message-ID: <34c23c2d-1646-8ddf-b88c-92374cc7d51b@tana.it>
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
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
        t=1624901759; bh=gAQxcRkCKYqrueTfM2lNUQn5o5OkVk1X3wlZlnnDvYk=;
        l=3283; h=To:References:From:Date:In-Reply-To;
        b=CGREmaVlq5lxNUefEqPa5OY9lnQIVPmfl2tll2fK+c83GAVge9WLi7IKHWVWJ6MOT
         hIZIASfkbj6Z/5P8pvY/kYgx7qg9QO65SplQTzSnZtT228pgjdKCu2VB6JzAwnFcTM
         0ivsmUrTSYAwm/8Q3sL7DFDf93W8DX3htVFp2sH4IYP52IzNKX1M9phVgnmzu
From: Alessandro Vesely <vesely@tana.it>
In-Reply-To: <ef5d64c7-2297-1e97-c6f9-29adbc915f60@thelounge.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Reindl Harald <h.reindl@thelounge.net>, netfilter@vger.kernel.org

On Mon 28/Jun/2021 14:03:30 +0200 Reindl Harald wrote:
> Am 28.06.21 um 13:47 schrieb Alessandro Vesely:
>> On Mon 28/Jun/2021 12:17:11 +0200 Reindl Harald wrote:
>>> Am 28.06.21 um 11:23 schrieb Alessandro Vesely:
> 
>>> do what you want but stop talking nonsense when it comes to best practice 
>>
>> One "best practice" that I'd object to is blindly restoring whatever was 
>> saved on shutdown.  How can one control that?  Booting with some clean, 
>> well-defined data looks safer
> 
> WTF: there is nothing magically or blindly saved and changed at shutdown, it's 
> the whole state as it was, the outcome from your script
> 
> do you guys not realize that your shellscripts are fine as mine are but at the 
> end the iptables ruleset has a defined state which want you have restored 1:1 
> at boot


If the defined state is the result of a shell script, re-running the same shell 
script should result in the same state.  Restoring from the last-saved state 
may be faster/ cooler, but roughly equivalent.

However, what if, one day, something wrong happens and you try to quickly fix 
the rules.  At some point you realize the rules were fine, the problem was 
somewhere else and now you need to reboot.  Hm... how do you return to the 
previous state?  Maybe the shell script that originally gave place to the 
target state run in 2008 for the last time.  The last iptables-save output 
looks older than some changes applied a couple of weeks ago —there's been no 
reboot in the meantime.  What do you do in that case?


> this whole discusssion is embarrassing and especially when the target audience 
> in this case is a noob-user it's idiotic not follow best practices
> 
> nobody gives a shit how you create the ruleset and nobody right in his mind 
> would touch the save-file by anything else but "iptables-save --file path" as 
> nobody right in his mind would load it by anything else than  
> "iptables-nft-restore path"


That way you exclude comments.  Don't you think it's relevant to annotate why 
you issued a given rule?  What if someone else will have to maintain the 
ruleset?  Or even yourself, if you can happen to forget what daemon is expected 
to filter packets in a given nf queue, or what reason did you have in mind when 
you defined a given chain rather than jumping directly to the next target? 
Where do you write down such maintenance hints?


> please stop spreading bullshit - we have enough idiots out there blindly follow 
> whatever they read wherever on the internet without the slightest clue what 
> they are doing
> 
> YOU can do what you want on YOUR machine but best practices are there to avoid 
> endless threads over and over again when someone has a problem and nobody knows 
> about his setup and your "i do everything like i want" is off-topic


I think that any "idiots out there" who might be following this thread can 
judge by themselves.  However, if you think this is bullshit, you should stop 
amplifying it, because probably that's what you're doing.  There is no well 
established /best practice/, because iptables rules are managed in so many 
different ways.  Don't think that calling my arguments *bullshit* earns more 
points to yours:  You never know what's on an idiot's mind.


Best
Ale
-- 














