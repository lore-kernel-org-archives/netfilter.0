From: David Hajes <david@hajes.org>
Subject: Re: Reload IPtables
Date: Sat, 26 Jun 2021 12:27:52 +0200
Message-ID: <96559e16-e3a6-cefd-6183-1b47f31b9345@hajes.org>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
 <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
 <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
 <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
 <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
 <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
 <f5314629-8a08-3b5f-cfad-53bf13483ec3@hajes.org>
 <adc28927-724f-2cdb-ca6a-ff39be8de3ba@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hajes.org; s=f2019;
        t=1624703273; bh=9LpJdS9l5G0PznzcGJ/s92X3SSlbpJei2c8hXuPhDoU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type;
        b=VJwF+iXNOaWNFFTK9hFm0BqA/WXgsfCt2jzQ4DoTABxyMNVjTbNp28srFMx/HHa+I
         K4Mm5HSX8P74owcKuNmXN/Lht0AGm+/ZX/XtCOYeOX2aZb6MfA8Txy9e0PaQO0jbGW
         Pih46YIPBQXeLUrOTfcCvJcFleuupJzBPOigZUmkz8Z8Z1RRNlNU3NUo6kKXEU7z3F
         EO0hYJYJYlN4PDEJcGL1yb5Gm22BI81P8+voygNnskp7XmpRKLGknTTTxU6tpPrviP
         MK7x5QDowSg7W3tscV7ABKtQ/ThUvMmmISXdprx7uCNVXor9Vew+gNXPIXOG6Rqtdp
         aS3VybCurzMwA==
In-Reply-To: <adc28927-724f-2cdb-ca6a-ff39be8de3ba@thelounge.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org


> sounds like a terrible mess with a ton of conditions which only works=20
> with a simple ruleset

how many people do you know that use Linux with 10k lines in iptables?

slowest thing about loading iptables script was dealing with fail2ban=20
that takes ages to load all banned IPs.

if guy asks how to reload properly ruleset - I doubt he has got any=20
complex filtering on his machine ;-)

>
> it's not it's job to handle sysctl
>
> that belongs into a different file and running the iptables-script at=20
> boot is a terrible idea because it's slow an non-atomic
>
> the only time when you should run a complex script is when you change=20
> something and not at boot time where you simply restore the last state
>
> /usr/sbin/ipset -file /etc/sysconfig/ipset restore
> /usr/sbin/iptables-nft-restore /etc/sysconfig/iptables
> /usr/sbin/sysctl -q --load=3D/etc/sysctl*.conf
>
> that way first all rules are loaded atomic and *then* "ip_forward" and=20
> friends are set to avoid a leak at boot

it may be good for you pro administrators with complex=20
configurations...I have all in one file and do not need to bother about=20
1ms lost during reload nor seeking 10 different config files for simple=20
tasks and wasting hours by config. I like easy life.

My guess was that guy who asked doesn't have anything special and simple=20
script resolves is terrible life trauma ;-)

Otherwise, he wouldn't ask such a question that is simple RTFM or UTFG ;-)

>
>> why would you reboot machine just because you need reload firewall?
>>
>> it seems to me that you need to learn basics of firewalling and Linux=20
>> management.
>>
>> On 26/06/2021 01:47, slow_speed@att.net wrote:
>>> Yes, that was exactly my initial question.=C2=A0 I couldn't agree more.
>>>
>>> The issue was knowing the correct command to use force the reload. I=20
>>> remain unclear on that if my files are in either=20
>>> /etc/iptables.up.rules or /etc/iptables/rules.v4.
>>>
>>>
>>>
>>> On 6/25/21 7:43 PM, Reindl Harald wrote:
>>>>
>>>>
>>>> Am 25.06.21 um 23:30 schrieb slow_speed@att.net:
>>>>> I do not believe it is something one would use a script for.=20
>>>>> Rather, there should be a way to reload the information into=20
>>>>> memory without having to reboot.
>>>>
>>>> why would you ever reboot a linux system for something trivial than=20
>>>> exchange, reset or realod iptables?
>>>>
>>>> * you have your ruleset
>>>> * you have saved it
>>>> * just load it
>>>>
>>>> "/usr/sbin/iptables-nft-restore /etc/sysconfig/iptables" or=20
>>>> "iptables-restore" or "iptables-legacy-restore"
>>>>
>>>> there is no difference doing that at boot or any moment in time
>>>>
>>>>> On 6/25/21 4:51 PM, David Hajes wrote:
>>>>>> on Debian I flushed all tables including custom tables and used=20
>>>>>> to run iptables bash script before I moved to nftables. OpenBSD=20
>>>>>> same strategy - flush and reload pf.conf
>>>>>>
>>>>>> if that is what you mean by reload.
>>>>>>
>>>>>> On 25/06/2021 21:24, slow_speed@att.net wrote:
>>>>>>> What is the preferred command to reload the current rules for=20
>>>>>>> iptables? (Please include Debian environment, if distro-specific.)
