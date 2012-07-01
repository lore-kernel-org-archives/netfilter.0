From: Steven Kath <steven.kath@vyatta.com>
Subject: Re: [ANNOUNCE] ipset 6.13 released
Date: Sun, 1 Jul 2012 11:32:39 -0700
Message-ID: <CAKgro6CqFKoyXxKUAZXA6bdYoPaMUKJA0iR=Nb3cL94377StEg@mail.gmail.com>
References: <alpine.DEB.2.00.1206292201340.29738@blackhole.kfki.hu> <4FF02A93.8080603@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <4FF02A93.8080603@googlemail.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On Sun, Jul 1, 2012 at 3:46 AM, Mr Dash Four
<mr.dash.four@googlemail.com> wrote:
> You refer to the incoming interface (interface on which packets arriv=
e) as
> the "source". That cannot be right. To me, it should be a "destinatio=
n", not
> =A0"source" as the very definition of a "destination" is where someth=
ing ends,
> this is where a packet arrives and where the journey of the packet "s=
tops"
> (or where the packet is "destined" to arrive anyway). It should defin=
itely
> not be a "source" as the packet does not originate there, nor does it=
 start
> its journey there.
>
> Similarly for the outgoing interface - this isn't a "destination" int=
erface
> as the packet doesn't arrive there - it is where it starts its journe=
y from!

I think the current terminology is correct FWIW. From a local network
stack perspective for locally- sourced/destined packets, the source of
incoming packets is the interface and the destination is a local
socket.  The source of an outgoing packet is the local socket (where
it starts its journey) and the destination is the outgoing interface.

More importantly, I would consider your proposed terminology
inarguably backward for the case of forwarded packets.
--
To unsubscribe from this list: send the line "unsubscribe netfilter-dev=
el" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
