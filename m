From: slow_speed@att.net
Subject: Re: Reload IPtables
Date: Sun, 27 Jun 2021 14:32:39 -0400
Message-ID: <227edb33-b86d-2310-bc63-c6d903bea95d@att.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
 <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
 <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
 <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
 <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
 <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
 <20210627191107.79ca63b9cf4dfe9028649524@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024; t=1624818764; bh=5iZ0d85X6dILGbnKA4TrjJAlxaMbVBHIMw3w9qFuaeo=; h=Subject:To:References:From:Date:In-Reply-To:From:Subject:Reply-To; b=ei3mR1mQhkRAWHSzqt1mVgK5c31/33a5Ef9npBu11OiHR8Qql3wDCoLrYqVkOBnqOmbbx7s8jKjwPFctRR5sZB8NjwhfNRZZEBIXayUo2KIC1oeSNKdGA5J5DA1pL3fUQJWYmVehbOYQVAdB7EILFhtPngxocrLebyc6TaTa4R0=
In-Reply-To: <20210627191107.79ca63b9cf4dfe9028649524@plushkava.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Kerin Millar <kfm@plushkava.net>, netfilter@vger.kernel.org

Thank you for that very good explanation.

As it turns out, I am learning two ways at once.=C2=A0 One is my desktop =

computer running Debian 10 which used nftables (and I believe=20
nftables-persistent is built-in to the nftables mechanism).=C2=A0 The oth=
er=20
is a little Raspian server which is based on Debian 10, but does not use =

nftables.

In the second case, one must reload iptables when changes are made to=20
it.=C2=A0 If I correctly understand, one must use sudo iptables -F, follo=
wed=20
by sudo iptables-restore < /etc/iptables.up.rules (or wherever they=20
are).=C2=A0 Doesn't it need the little left arrow/less-than sign?=C2=A0 D=
oes that=20
sound correct?


On 6/27/21 2:11 PM, Kerin Millar wrote:
> On Fri, 25 Jun 2021 19:47:02 -0400
> slow_speed@att.net wrote:
>
>> Yes, that was exactly my initial question.=C2=A0 I couldn't agree more=
=2E
>>
>> The issue was knowing the correct command to use force the reload. I
>> remain unclear on that if my files are in either /etc/iptables.up.rule=
s
>> or /etc/iptables/rules.v4.
> Debian offers an iptables-persistent package which, if installed, will =
provide a plugin for their netfilter-persistent package. In turn, that im=
plements a pseudo-service that is capable of automatically loading iptabl=
es rules from "/etc/iptables/rules.v4" upon being started, and saving the=
m there upon being stopped. It does so by executing iptables-restore(8) a=
nd iptables-save(8) behind the scenes and the decision to use this partic=
ular location is an arbitrary one made by the Debian maintainers. As for =
"/etc/iptables.up.rules", it has no significance beyond serving as one ex=
ample of how to manually deal with ruleset persistence, as far as the aut=
hor of the https://wiki.debian.org/iptables article is concerned.
>
> So, if you needed to manually (re)load an iptables ruleset that had pre=
viously been saved through the use of the iptables-persistent plugin, you=
 might run `iptables-restore /etc/iptables/rules.v4` but it would probabl=
y be wiser to run `netfilter-persistent start` instead. For further infor=
mation, refer to the netfilter-persistent(8) man page. On the other hand,=
 should you choose not to use iptables-persistent, the decision of where =
exactly to save rulesets is yours to make. If in doubt, observe the conve=
ntions chosen by your distribution.
>


