From: slow_speed@att.net
Subject: Re: Reload IPtables
Date: Fri, 25 Jun 2021 19:47:02 -0400
Message-ID: <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
 <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
 <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
 <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
 <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024; t=1624664829; bh=HXw7SoaQzVTziLFA2VEh/JFstRZrIFhaehNkftg2MnA=; h=Subject:To:References:From:Date:In-Reply-To:From:Subject:Reply-To; b=qrj/Dw54lkVsoYvPTICOyUb66a7PwU1UmqkExdrGK94362RiGeb/0ACQITsaurWGqrmCnRbGceArKrRpokyDaAgV+FE+wnwae9KaFDSHbVFlT8ZU9Z5Wriwayy99laCg5/03phahzV2yc/tYKOsOXhD9GYUYyrYyCYax2IBmbB4=
In-Reply-To: <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Reindl Harald <h.reindl@thelounge.net>, netfilter@vger.kernel.org

Yes, that was exactly my initial question.=C2=A0 I couldn't agree more.

The issue was knowing the correct command to use force the reload. I=20
remain unclear on that if my files are in either /etc/iptables.up.rules=20
or /etc/iptables/rules.v4.



On 6/25/21 7:43 PM, Reindl Harald wrote:
>
>
> Am 25.06.21 um 23:30 schrieb slow_speed@att.net:
>> I do not believe it is something one would use a script for. Rather,=20
>> there should be a way to reload the information into memory without=20
>> having to reboot.
>
> why would you ever reboot a linux system for something trivial than=20
> exchange, reset or realod iptables?
>
> * you have your ruleset
> * you have saved it
> * just load it
>
> "/usr/sbin/iptables-nft-restore /etc/sysconfig/iptables" or=20
> "iptables-restore" or "iptables-legacy-restore"
>
> there is no difference doing that at boot or any moment in time
>
>> On 6/25/21 4:51 PM, David Hajes wrote:
>>> on Debian I flushed all tables including custom tables and used to=20
>>> run iptables bash script before I moved to nftables. OpenBSD same=20
>>> strategy - flush and reload pf.conf
>>>
>>> if that is what you mean by reload.
>>>
>>> On 25/06/2021 21:24, slow_speed@att.net wrote:
>>>> What is the preferred command to reload the current rules for=20
>>>> iptables? (Please include Debian environment, if distro-specific.)


