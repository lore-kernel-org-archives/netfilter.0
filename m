From: =?iso-8859-2?Q?Kamil_Jo=F1ca?= <kjonca@op.pl>
Subject: Re: how to use meters?
Date: Mon, 19 Sep 2022 12:00:44 +0200
Message-ID: <87czbrn0oj.fsf@alfa.kjonca>
References: <871qs9neip.fsf@alfa.kjonca> <Yygss6Pkwuwgmy4o@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=op.pl; s=2011;
        t=1663581646; bh=+dkgUvQj87R3kaGPfnMHWJxpvXHnHaOMhLynAx8yt2Y=;
        h=From:To:Subject:References:Date:In-Reply-To:From;
        b=KPwtqGLGyW7AZ8ePQ9ZBGEPIGLBqX0iwhOf2JsiNBmHLUeeSY8X4nL2KqaLGjBj7+
         0CBhXirqF+L0Fcp8Vx6QsqrVC1+8B4bIHANjAzk2HRsQx19qgcVqEoej9HTWk4ymvK
         UG043YWJ4WOYWyEW1J+Up2MTtfUf60tYDQdgx8PQ=
In-Reply-To: <Yygss6Pkwuwgmy4o@salvia> (Pablo Neira Ayuso's message of "Mon,
        19 Sep 2022 10:47:47 +0200")
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Pablo Neira Ayuso <pablo@netfilter.org> writes:

> On Sun, Sep 18, 2022 at 12:49:34PM +0200, Kamil Jo=F1ca wrote:
> [...]
>> For example:
>> https://wiki.archlinux.org/title/Nftables#Dynamic_blackhole
>> --8<---------------cut here---------------start------------->8---
>>  ct state new tcp dport 443 \
>>                 meter flood size 128000 { ip saddr timeout 10s limit rat=
e over 10/second } \
>>                 add @blackhole { ip saddr timeout 1m }
>> --8<---------------cut here---------------end--------------->8---
>>=20
>> I understand " add @blackhole { ip saddr timeout 1m }" - adds address to
>> set for 1 min.
>> but what is
>> "meter flood size 128000 { ip saddr timeout 10s limit rate over 10/secon=
d }"
>>=20
>> (I can guess but I cannot see proper doc of this)
>> Any hint?
>
> I'd suggest you use a set declaration for this, instead of the meter synt=
ax.
>
> This example shows how to ratelimit new connections to 10 per second:
>

[... snip ...]
Thank you. After some digging and reading manual (especially "SET
STATEMET" ) i wrote similar thing (two tables flood +blaclist, etc)
So thanks for confirmation. :)

The only thing is
"    set flood {
        type ipv4_addr
        flags dynamic
        timeout 1m
        limit rate over 10/second
        size 65536
    }
"

I did not found "limit" statement in set definition in manual.
Am I overlooked something?

KJ

--=20
http://wolnelektury.pl/wesprzyj/teraz/
