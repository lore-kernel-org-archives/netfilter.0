From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Reload IPtables
Date: Sat, 26 Jun 2021 12:13:13 +0200
Message-ID: <adc28927-724f-2cdb-ca6a-ff39be8de3ba@thelounge.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
 <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
 <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
 <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
 <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
 <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
 <f5314629-8a08-3b5f-cfad-53bf13483ec3@hajes.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <f5314629-8a08-3b5f-cfad-53bf13483ec3@hajes.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: David Hajes <david@hajes.org>, slow_speed@att.net, netfilter@vger.kernel.org



Am 26.06.21 um 09:19 schrieb David Hajes:
> now you know why I use own scripts that are portable to any=20
> Linux/OpenBSD/BSD-like machine

sounds like a terrible mess with a ton of conditions which only works=20
with a simple ruleset

> I have never used iptable-save/restore in my life...it doesn't handle=20
> variables like "ip_forward" for example and there is more to setup.

it's not it's job to handle sysctl

that belongs into a different file and running the iptables-script at=20
boot is a terrible idea because it's slow an non-atomic

the only time when you should run a complex script is when you change=20
something and not at boot time where you simply restore the last state

/usr/sbin/ipset -file /etc/sysconfig/ipset restore
/usr/sbin/iptables-nft-restore /etc/sysconfig/iptables
/usr/sbin/sysctl -q --load=3D/etc/sysctl*.conf

that way first all rules are loaded atomic and *then* "ip_forward" and=20
friends are set to avoid a leak at boot

> why would you reboot machine just because you need reload firewall?
>=20
> it seems to me that you need to learn basics of firewalling and Linux=20
> management.
>=20
> On 26/06/2021 01:47, slow_speed@att.net wrote:
>> Yes, that was exactly my initial question.=C2=A0 I couldn't agree more.
>>
>> The issue was knowing the correct command to use force the reload. I=20
>> remain unclear on that if my files are in either=20
>> /etc/iptables.up.rules or /etc/iptables/rules.v4.
>>
>>
>>
>> On 6/25/21 7:43 PM, Reindl Harald wrote:
>>>
>>>
>>> Am 25.06.21 um 23:30 schrieb slow_speed@att.net:
>>>> I do not believe it is something one would use a script for. Rather,=20
>>>> there should be a way to reload the information into memory without=20
>>>> having to reboot.
>>>
>>> why would you ever reboot a linux system for something trivial than=20
>>> exchange, reset or realod iptables?
>>>
>>> * you have your ruleset
>>> * you have saved it
>>> * just load it
>>>
>>> "/usr/sbin/iptables-nft-restore /etc/sysconfig/iptables" or=20
>>> "iptables-restore" or "iptables-legacy-restore"
>>>
>>> there is no difference doing that at boot or any moment in time
>>>
>>>> On 6/25/21 4:51 PM, David Hajes wrote:
>>>>> on Debian I flushed all tables including custom tables and used to=20
>>>>> run iptables bash script before I moved to nftables. OpenBSD same=20
>>>>> strategy - flush and reload pf.conf
>>>>>
>>>>> if that is what you mean by reload.
>>>>>
>>>>> On 25/06/2021 21:24, slow_speed@att.net wrote:
>>>>>> What is the preferred command to reload the current rules for=20
>>>>>> iptables? (Please include Debian environment, if distro-specific.)
