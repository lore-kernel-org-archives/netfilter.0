From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: module order: tcp/conntrack vs. conntrack/tcp
Date: Tue, 3 Jul 2012 13:56:06 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1207031320400.28179@frira.zrqbmnf.qr>
References: <9bfb14742a7ec35d775699fc955f437b@localhost> <alpine.LNX.2.01.1207021414160.9210@frira.zrqbmnf.qr> <6b9bf8d2fbee67290e206ae8bef72242@njm.linuxwall.info>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <6b9bf8d2fbee67290e206ae8bef72242@njm.linuxwall.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julien Vehent <julien@linuxwall.info>
Cc: netfilter@vger.kernel.org

On Tuesday 2012-07-03 03:57, Julien Vehent wrote:

> On 2012-07-02 8:16, Jan Engelhardt wrote:
>> The use of -m conntrack (state is obsolete) is cheaper than people
>> think, because the ct belonging to a packet is already long determined,
>> so looking at the state is quite simple.
>
>I just discovered that -m state is obsolete. There not much to read 
>about -m conntrack on the mailing lists (this one or the dev one). 
>Would you care the elaborate on the advantages of the conntrack module 
>as opposed to the state one?

More states that can be checked.


>Should we also stop using -p, -s, -d, --sport and --dport and replace 
>them with the equivalents in the conntrack module?

1. That is for you to decide. As always, different matches only
exist because their semantics are reasonably different from the rest.
Consider

-A FORWARD -s 2001:db8::4 -j ACCEPT
-A FORWARD -d 2001:db8::4 -j ACCEPT

and

-A FORWARD -m conntrack --ctorigsrc 2001:db8::4 -j ACCEPT

The former will allow all packets from and to 2001:db8::4 no matter who 
started.

The latter will only accept packets that belong to connections initiated 
by 2001:db8::4;  2001:db8::4 can be in the srcip or the dstip field.
Some unexperienced people may be sufficiently puzzled by that.

So in a way, the latter check is stricter and matches less, but if that
is what you actually want, you just discovered a rule saver.


2. If you have connection pickup enabled, the order of the orig
and repl tuples depends on who we see a packet first from.
