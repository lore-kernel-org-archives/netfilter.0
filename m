From: slow_speed@att.net
Subject: Re: Reload IPtables
Date: Fri, 25 Jun 2021 18:37:41 -0400
Message-ID: <b2553582-f1a2-5f57-07d0-c2d9884e94dd@att.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
 <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
 <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
 <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
 <cd80bdd2-7816-f27f-d3fe-5042d213700e@satchell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024; t=1624660665; bh=ODQ7Np0Z8ekLD/1EWG7+K45robnRXWfRJFEpRVED7kw=; h=Subject:To:References:From:Date:In-Reply-To:From:Subject:Reply-To; b=dvSBFCuJpmw7fWYQfFSPhA/FBQ7EtcFaW8ah8U7Sog+V7UKALIR+Pzu1PjCQUaXQiJre3a6P2Po2+eq8b2NkIHnzN1Qcrw89qf3OCqnEkAPkj1uWdaw19o9ZC2t4SMSXaJR/B7BW3aTRuOE4CQ5hTiEjrvokGnhH8OMzAiRBEFk=
In-Reply-To: <cd80bdd2-7816-f27f-d3fe-5042d213700e@satchell.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: list@satchell.net, netfilter@vger.kernel.org

Interesting.=C2=A0 I did not understand how that one worked.=C2=A0 I thou=
ght it=20
was for something else.

So if a person had installed iptables-persistent, then=20
/etc/iptables/rules.v4 and /etc/iptables/rules.v6 were created.=C2=A0 If =
I=20
understand your usage, one would then run:
iptables-restore </etc/iptables/rules.v4.

Is that correct?


On 6/25/21 6:19 PM, Stephen Satchell wrote:
> Look into iptables-restore(8)
>
> Assuming that you have previously used
> "iptables-save >/root/iptables.ipv4" and
> "ip6tables-save >/root/iptables.ipv6",
>
> then you can reload the tables using
> "iptables-restore </root/iptables.ipv4" and
> "ip6tables-restore </root/iptables.ipv6"
>
> Note that a save does not save the state of /proc/sys/net variables=20
> (like /proc/sys/net/ipv4/ip_forward), and consequently restore doesn't =

> change the state of /proc/sys/net variables.
>
> When I have written scripts to handle this sort of stuff, I handle=20
> /proc/sys/net/ipv4/ip_forward and /proc/sys/net/ipv6/conf/*/forwarding =

> myself.=C2=A0 To make a reload as atomic as possible, I first turn off =

> forwarding, the issue the two restore commands, then set the /proc=20
> variables to their saved values.
>
> On 6/25/21 2:30 PM, slow_speed@att.net wrote:
>> Thank you.
>>
>> I do not believe it is something one would use a script for. Rather,=20
>> there should be a way to reload the information into memory without=20
>> having to reboot.
>>
>>
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
>>>>
>>
>


