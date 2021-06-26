From: David Hajes <david@hajes.org>
Subject: Re: Reload IPtables
Date: Sat, 26 Jun 2021 12:54:11 +0200
Message-ID: <fbc2c10b-c888-827c-e15c-73288c5e96cc@hajes.org>
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hajes.org; s=f2019;
        t=1624704852; bh=HcS6m20CnVzK5rtdRjD1BpIl/0bWHBi+EwywWYxJZk4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type;
        b=IuKn66d8IIKJSe6JPLucRmRRNKxhup0E9dPjB03buX3byKI9d6hUoULe/+NXsiJ6O
         SR6Q+8pWFOJiYPSvUI9Fa5qqgLqTlLHSabZ7OaAOSwmQhrKFPjHXem04yL/N8V7dWR
         ppKMSbqJDRmqEtuC95yoAURGks5yN7YQTzHY5ykAGvAOaIGoP6joldOR90Z5dN5Cii
         Vw7PpWVQUIUQweKaE8tNwW7D+yqljvNKYYxosNemk7Cxp1+kVNi4HOWJ4xL7qYwkXy
         SQUwb/cfVDcY3/DIWXTNdUmUFFAK0o+ped1HCj0grNkisA0AdfAW2XG85umQFaY+T1
         02IyQ4mont+CA==
In-Reply-To: <16b55f10-5171-590f-f9d2-209cfaa7555d@thelounge.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org


> that's why ipset exists which don't care much if there is 1 or 1=20
> million entries
>
fail2ban use(d) sqlite/ipset...it is issue with fail2ban, not=20
iptables+ipset...it didn't improve with nftables either.

I used to use a kludge where I manually loaded persistently banned IPs=20
into ipset table...it loaded 100x faster than fail2ban native function


>> if guy asks how to reload properly ruleset - I doubt he has got any=20
>> complex filtering on his machine ;-)
>
> that may be true
>
>>> it's not it's job to handle sysctl
>>>
>>> that belongs into a different file and running the iptables-script=20
>>> at boot is a terrible idea because it's slow an non-atomic
>>>
>>> the only time when you should run a complex script is when you=20
>>> change something and not at boot time where you simply restore the=20
>>> last state
>>>
>>> /usr/sbin/ipset -file /etc/sysconfig/ipset restore
>>> /usr/sbin/iptables-nft-restore /etc/sysconfig/iptables
>>> /usr/sbin/sysctl -q --load=3D/etc/sysctl*.conf
>>>
>>> that way first all rules are loaded atomic and *then* "ip_forward"=20
>>> and friends are set to avoid a leak at boot
>>
>> it may be good for you pro administrators with complex=20
>> configurations...I have all in one file and do not need to bother=20
>> about 1ms lost during reload nor seeking 10 different config files=20
>> for simple tasks and wasting hours by config. I like easy life.
>
> mixing things together which don't belong together like iptables and=20
> sysctl is the opposite of simple as well as running a ton of commands=20
> at boot where it should be a oneliner is also the opposite
>
> to be honest that sounds more like "i didn't know about save/restore=20
> as i wrote that stuff"
>
>> My guess was that guy who asked doesn't have anything special and=20
>> simple script resolves is terrible life trauma ;-)
>>
>> Otherwise, he wouldn't ask such a question that is simple RTFM or=20
>> UTFG ;-)
>
> that may be true
>
>>>> why would you reboot machine just because you need reload firewall?
>>>>
>>>> it seems to me that you need to learn basics of firewalling and=20
>>>> Linux management.
>>>>
>>>> On 26/06/2021 01:47, slow_speed@att.net wrote:
>>>>> Yes, that was exactly my initial question.=C2=A0 I couldn't agree mor=
e.
>>>>>
>>>>> The issue was knowing the correct command to use force the reload.=20
>>>>> I remain unclear on that if my files are in either=20
>>>>> /etc/iptables.up.rules or /etc/iptables/rules.v4.
>>>>>
>>>>>
>>>>>
>>>>> On 6/25/21 7:43 PM, Reindl Harald wrote:
>>>>>>
>>>>>>
>>>>>> Am 25.06.21 um 23:30 schrieb slow_speed@att.net:
>>>>>>> I do not believe it is something one would use a script for.=20
>>>>>>> Rather, there should be a way to reload the information into=20
>>>>>>> memory without having to reboot.
>>>>>>
>>>>>> why would you ever reboot a linux system for something trivial=20
>>>>>> than exchange, reset or realod iptables?
>>>>>>
>>>>>> * you have your ruleset
>>>>>> * you have saved it
>>>>>> * just load it
>>>>>>
>>>>>> "/usr/sbin/iptables-nft-restore /etc/sysconfig/iptables" or=20
>>>>>> "iptables-restore" or "iptables-legacy-restore"
>>>>>>
>>>>>> there is no difference doing that at boot or any moment in time
>>>>>>
>>>>>>> On 6/25/21 4:51 PM, David Hajes wrote:
>>>>>>>> on Debian I flushed all tables including custom tables and used=20
>>>>>>>> to run iptables bash script before I moved to nftables. OpenBSD=20
>>>>>>>> same strategy - flush and reload pf.conf
>>>>>>>>
>>>>>>>> if that is what you mean by reload.
>>>>>>>>
>>>>>>>> On 25/06/2021 21:24, slow_speed@att.net wrote:
>>>>>>>>> What is the preferred command to reload the current rules for=20
>>>>>>>>> iptables? (Please include Debian environment, if=20
>>>>>>>>> distro-specific.)
