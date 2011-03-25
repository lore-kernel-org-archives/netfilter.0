From: Pandu Poluan <pandu@poluan.info>
Subject: Re: netfilter pecularities
Date: Fri, 25 Mar 2011 23:33:20 +0700
Message-ID: <AANLkTi=S7SfyMxkLUHbFDDqHVQpi4br4DHc11Mq08CfL@mail.gmail.com>
References: <20110325090527.M18530@kdtc.net>
	<AANLkTimcOQd46KDwH5=7Er6Q2yud2N8qUsAgFazbmN4u@mail.gmail.com>
	<alpine.LNX.2.01.1103251137010.23435@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1103251137010.23435@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>, cc <cc@kdtc.net>, netfilter@vger.kernel.org

Ahh, so that's how exactly iptables decided to modprobe or not.

Thanks for the explanation Jan :)

Rgds,


On 2011-03-25, Jan Engelhardt <jengelh@medozas.de> wrote:
>
> On Friday 2011-03-25 11:31, Pandu Poluan wrote:
>>
>>> When I run iptables, is it supposed to 'insmod' ip_tables, etc
>>> to the modules list? =C2=A0Even if it's compiled into the kernel?
>>>
>>
>>I don't think so. IMO if the modules are compiled into the kernel,
>>iptables will not load them.
>>
>>But I'm not a developer, though. I *could* be wrong.
>
> If the module is compiled in, the functionality is already available,
> thus trying to use the functionality does not fail and iptables
> won't attempt to modprobe.
>


--=20
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
