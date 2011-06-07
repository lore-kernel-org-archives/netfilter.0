From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ipv6 link local address
Date: Tue, 7 Jun 2011 11:24:00 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106071120390.25037@frira.zrqbmnf.qr>
References: <92A9C99A1E5FF14F8538DDEE14996A5203341F@chp-exg.coxhp.com> <1307429067.7853.1.camel@hakkenden> <4DEDCE11.3090004@arpa.org> <alpine.LNX.2.01.1106071102460.25037@frira.zrqbmnf.qr> <4DEDEE6B.9000303@arpa.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DEDEE6B.9000303@arpa.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Erik Schorr <erik-lists@arpa.org>
Cc: netfilter@vger.kernel.org


On Tuesday 2011-06-07 11:24, Erik Schorr wrote:
>> There are no accidents. It's your userspace which triggers it loading.
>> And what is it actually that you are trying to fix? It smells more
>> like you have a bug in your environment.
>
>On most Linux distributions and default installations, the ipv6 module gets
>automatically loaded either on startup or when certain utilities try to probe
>ipv6 entities or test for ipv6 connectivity, even when you haven't configured
>any ipv6 interfaces.

Just as tcp and udp - were it compilable as a module - would be,
even if you don't really use any.

>It's nice to be able to unload the module to free up memory and make
>netstat and other programs' output prettier. Prettier in the way
>that you don't have extraneous output that's meaningless when there
>are no ipv6 addresses configured.

You should use ss -4 then if you want to not list IPv6 entries.
And there is an IPv6 address configued, ::1, and IPv6 simply is the
preferred protocolwhen making connections - after all, uptake has
to start somewhere.

>It's impossible to unload the ipv6 module when there's even one
>interface with ipv6 functionality enabled, even when the interface
>is administratively disabled/shutdown.

Because it hooks so deep down into the system, that is only expected.
