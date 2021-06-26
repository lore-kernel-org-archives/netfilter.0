From: David Hajes <david@hajes.org>
Subject: Re: Reload IPtables
Date: Sat, 26 Jun 2021 09:19:03 +0200
Message-ID: <f5314629-8a08-3b5f-cfad-53bf13483ec3@hajes.org>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
 <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
 <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
 <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
 <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
 <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hajes.org; s=f2019;
        t=1624691945; bh=q5KoZqbRs74LgB/6esD/dYIOD1ARs3T/6zkT9sDoidc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type;
        b=Q1GMbGbNELHCKYOjKcNjZibEueZSizt4YWlKC9AOsz1o1/DfY1WgCjv1fmOl/yh1G
         hf6iIUgfYVTCaVKJB7VVgJiyxbItpEZMkFf/APKFJLFXrd+dA6Wx+8N9mxmV6+YQnU
         V6+3nYVnbTNPbWt2uNWQ01lPOLEeyntrW3ydfdFuODbZNoaXcgsqMIdRIV9+LQZJLo
         HhexCqYVElL8yTILfTe0BEaHTh6dWmxppWFEO0D3jRW36f29QCJFq4jzVFFI1v5nJt
         R2hDpDio1gP+f8HMiJRA0MyPXkje3dVZltJlFH3HAJtznf6pY+cEXgvELL9/oef/+m
         vVQsyFqLt0AAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hajes.org; s=f2019;
        t=1624691945; bh=q5KoZqbRs74LgB/6esD/dYIOD1ARs3T/6zkT9sDoidc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type;
        b=Q1GMbGbNELHCKYOjKcNjZibEueZSizt4YWlKC9AOsz1o1/DfY1WgCjv1fmOl/yh1G
         hf6iIUgfYVTCaVKJB7VVgJiyxbItpEZMkFf/APKFJLFXrd+dA6Wx+8N9mxmV6+YQnU
         V6+3nYVnbTNPbWt2uNWQ01lPOLEeyntrW3ydfdFuODbZNoaXcgsqMIdRIV9+LQZJLo
         HhexCqYVElL8yTILfTe0BEaHTh6dWmxppWFEO0D3jRW36f29QCJFq4jzVFFI1v5nJt
         R2hDpDio1gP+f8HMiJRA0MyPXkje3dVZltJlFH3HAJtznf6pY+cEXgvELL9/oef/+m
         vVQsyFqLt0AAw==
In-Reply-To: <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: slow_speed@att.net, netfilter@vger.kernel.org

now you know why I use own scripts that are portable to any=20
Linux/OpenBSD/BSD-like machine

I have never used iptable-save/restore in my life...it doesn't handle=20
variables like "ip_forward" for example and there is more to setup.

why would you reboot machine just because you need reload firewall?

it seems to me that you need to learn basics of firewalling and Linux=20
management.

On 26/06/2021 01:47, slow_speed@att.net wrote:
> Yes, that was exactly my initial question.=C2=A0 I couldn't agree more.
>
> The issue was knowing the correct command to use force the reload. I=20
> remain unclear on that if my files are in either=20
> /etc/iptables.up.rules or /etc/iptables/rules.v4.
>
>
>
> On 6/25/21 7:43 PM, Reindl Harald wrote:
>>
>>
>> Am 25.06.21 um 23:30 schrieb slow_speed@att.net:
>>> I do not believe it is something one would use a script for. Rather,=20
>>> there should be a way to reload the information into memory without=20
>>> having to reboot.
>>
>> why would you ever reboot a linux system for something trivial than=20
>> exchange, reset or realod iptables?
>>
>> * you have your ruleset
>> * you have saved it
>> * just load it
>>
>> "/usr/sbin/iptables-nft-restore /etc/sysconfig/iptables" or=20
>> "iptables-restore" or "iptables-legacy-restore"
>>
>> there is no difference doing that at boot or any moment in time
>>
>>> On 6/25/21 4:51 PM, David Hajes wrote:
>>>> on Debian I flushed all tables including custom tables and used to=20
>>>> run iptables bash script before I moved to nftables. OpenBSD same=20
>>>> strategy - flush and reload pf.conf
>>>>
>>>> if that is what you mean by reload.
>>>>
>>>> On 25/06/2021 21:24, slow_speed@att.net wrote:
>>>>> What is the preferred command to reload the current rules for=20
>>>>> iptables? (Please include Debian environment, if distro-specific.)
>
>
