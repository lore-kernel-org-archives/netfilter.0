From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: ipset preformance
Date: Mon, 28 Feb 2011 20:23:32 +0200
Message-ID: <AANLkTi=9nahJGA-1YBSer18S1RF6J6onPUFcn6BOzkTV@mail.gmail.com>
References: <AANLkTimNBPsd-a2YbM9Bf755WRrUnchXT7P31U83Txb3@mail.gmail.com>
	<alpine.DEB.2.00.1102272100340.24539@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=a1KGa+/xHiBoYgRKilCpyLGohfyr+CDYbpZDKYgqvgY=;
        b=wRLIh/WxDkqSkvkKccVyWZMGmcBKCKQiRVu1/2o3hdRJBQeUMKLLoCui212Bxr/Qgm
         8lyM5kcMZCaBnf0KbnoxxhbkIqa18nYg61yXTKTItoswwpcmmw32G4k9TfM7kT+BYBet
         Z6jQ+hjJ6syWOxu8STM5bGVbwZPoExCM1Ed1Q=
In-Reply-To: <alpine.DEB.2.00.1102272100340.24539@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

2011/2/27 Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>:
> On Sun, 27 Feb 2011, Anatoly Muliarski wrote:
>
>> I did oprofile test on our router and I found strange things with
>> ipset performance.
>> Using a single check of a nethash set with 3 nets in it consumes 1.8=
8%
>> of CPU, using a single check of an ipportiphash with zero items
>> consumes 3.39% and ip_set module itself =A0consumes 4.9%.
>> Currently I am using 2.6.25.17 kernel with ipset v2.4.9.
>
> That is a really-really old version of ipset.
>
>> Is it worth to upgrade to ipset v4.5 to resolve this issue?
>
> I believe so. But please note, I stopped the development of the 4.x b=
ranch
> and the currently maintained release is 6.x.

I upgraded to ipset v4.5 and got no difference :(
BTW I had to upgrade iptables too as my old v1.4.1 did not work with
set rules. Unfortunately, this fact is not reflected in the manual.
=46inally I optimized my iptables rules to exclude unncessary checks an=
d
remove unused sets, BUT the question is open - what is the cause of
losing performance on a simple set check?
Why a lot of other iptables rules do not consume so much CPU time?

Nevertheless I would like to say personally much thanks for your great =
tool.
It makes a lot of traffic control tasks easier and ever possible.

A one small thing that I was missed( exclude /16 limitation for most
of the set types and a semantic difference between masks 1-31 and mask
32 ) is a possibility of using ipset facilities with not in the
context of a current packet. In other words I was need to store and
use later something like a state.
But it is only a little strange wish that may not be in line of
general development :)


>
> Best regards,
> Jozsef
> -
> E-mail =A0: kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
> =A0 =A0 =A0 =A0 =A0H-1525 Budapest 114, POB. 49, Hungary
>



--=20
Best regards
Anatoly Muliarski
