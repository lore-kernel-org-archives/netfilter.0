From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ebtables ACCEPT policy vs ACCEPT target
Date: Wed, 29 Dec 2010 20:29:56 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012292026440.28059@obet.zrqbmnf.qr>
References: <AANLkTi=w6jf1y8bH3=9AX7fLDORkbm2dAKS4uBv5KQPZ@mail.gmail.com> <alpine.LNX.2.01.1012170451520.21601@obet.zrqbmnf.qr> <AANLkTikWo-QEQ+xGBmZEnfjphM5SX5FfMRGAWG5FqTA_@mail.gmail.com> <alpine.LNX.2.01.1012171024200.21893@obet.zrqbmnf.qr>
 <AANLkTik9XEM-0EwAs0m5atpXigQp88zQM+uxFd=bg1Ng@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTik9XEM-0EwAs0m5atpXigQp88zQM+uxFd=bg1Ng@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Robert Pipca <robertpipca@gmail.com>
Cc: netfilter@vger.kernel.org, Amos Jeffries <squid3@treenet.co.nz>

On Wednesday 2010-12-29 19:48, Robert Pipca wrote:

>Hi Mr. Engelhardt,
>
>2010/12/17 Jan Engelhardt <jengelh@medozas.de>:
>>>ebtables -t broute -A BROUTING -i eth1 -p ipv4 --ip-dst
>>>200.152.32.0/24 -j redirect --redirect-target ACCEPT
>>>ebtables -t broute -A BROUTING -i eth2 -p ipv4 --ip-src
>>>200.152.32.0/24 -j redirect --redirect-target ACCEPT
>>
>> Odd combination of redirect with BROUTING. I am surprised ebtables
>> even allows the use of "redirect" outside its nat table.
>
>It's a recommendation from the squid guys:
>
>http://wiki.squid-cache.org/Features/Tproxy4#ebtables_on_a_Bridging_de=
vice

It is not overly wrong, just I did not expect to see it. Then again,=20
ebtables has starkly diverged from iptables.


>>>ebtables -t broute -A BROUTING -i eth1 -p ipv4 --ip-proto tcp
>>>--ip-dport 80 =C2=A0-j redirect --redirect-target DROP
>>>ebtables -t broute -A BROUTING -i eth2 -p ipv4 --ip-proto tcp
>>>--ip-sport 80 =C2=A0-j redirect --redirect-target DROP
>>
>
>Do you have any other suggestions on how to do something like this:
>"Bridge all the traffic. Route tcp/80....BUT if it's from this
>network, then bridge it".

ebtables -t broute (...condition for "this network"...) -j ACCEPT
ebtables -t broute -p tcp --dport 80 -j DROP
ebtables -t broute -j ACCEPT

That wouold be a simple translation of your sentence.
