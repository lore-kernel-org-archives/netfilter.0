From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How to completely disable conntrack?
Date: Wed, 13 Jul 2011 11:45:47 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107131143420.13151@frira.zrqbmnf.qr>
References: <4D7785DC.8050904@centrum.cz> <AANLkTimkFarQO63ekSKJBL0PUqaMQV8QWWGLSQyQrDfq@mail.gmail.com> <4D7954EB.1050704@plouf.fr.eu.org> <loom.20110713T092047-270@post.gmane.org> <CAHOuc7Ooi5qiXcsnuR6FxNzwUvrZBcR27h_3q7pEmScQf+ZivA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAHOuc7Ooi5qiXcsnuR6FxNzwUvrZBcR27h_3q7pEmScQf+ZivA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oskar Berggren <oskar.berggren@gmail.com>
Cc: nany <naveen.sadanand@gmail.com>, netfilter@vger.kernel.org

On Wednesday 2011-07-13 10:07, Oskar Berggren wrote:

>>>> I'm sure there's a sysctl knob, but off the top of my head:
>>>>
>>>> -t raw -A PREROUTING -j NOTRACK
>>
>> -t raw -A OUTPUT -j NOTRACK

-t raw -A PREROUTING (or OUTPUT depending on which you want) -j CT --notrack

>> hey man i applied above rules, its not working,

It certainly does work.

>> the connections shows in /proc/net/ip_conntrack

Of course - because you only disabled it for new packets. Old CTs
live on until they are cleared.

>> is any one can tell how to disable connection tracking completely,
>>
>> please help me man

["yo man" this ain't the hood, ya dig.]

>Unload the module.

That won't work if it is locked by iptables rules, though.
