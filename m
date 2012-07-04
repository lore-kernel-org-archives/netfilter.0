From: Julien Vehent <julien@linuxwall.info>
Subject: Re: module order: tcp/conntrack vs. conntrack/tcp
Date: Wed, 04 Jul 2012 01:47:19 -0400
Message-ID: <03ed4154933e9e66f1585896d4022f4e@njm.linuxwall.info>
References: <9bfb14742a7ec35d775699fc955f437b@localhost>
 <alpine.LNX.2.01.1207021414160.9210@frira.zrqbmnf.qr>
 <6b9bf8d2fbee67290e206ae8bef72242@njm.linuxwall.info>
 <alpine.LNX.2.01.1207031320400.28179@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=linuxwall.info; h=
	mime-version:content-type:content-transfer-encoding:date:from:to
	:cc:subject:in-reply-to:references:message-id; s=lnw-dkim; bh=pH
	j24kDTfGjFBxTunWtpzgIsDodI2E3LVoy1tsBcHCA=; b=jTUhCrb8CODuhlvaE1
	T5JAm4VFMnNR1k+PgwyJ8ZNNaoue5VhohodaNXUNQmmZ8/ciwvsld9wkFSTcKy6B
	2+d/HBaGWhyeu5JIEc/ffYdqLVd8IYZmgmGiwN+XliTRt4ur5W7mi1CaCbAuchZT
	+Ru35j8nfyGUszuO3ziiXbFkY=
In-Reply-To: <alpine.LNX.2.01.1207031320400.28179@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter@vger.kernel.org

On 2012-07-03 7:56, Jan Engelhardt wrote:
> On Tuesday 2012-07-03 03:57, Julien Vehent wrote:
>
>> On 2012-07-02 8:16, Jan Engelhardt wrote:
>>> The use of -m conntrack (state is obsolete) is cheaper than people
>>> think, because the ct belonging to a packet is already long determined,
>>> so looking at the state is quite simple.
>>
>>I just discovered that -m state is obsolete. There not much to read
>>about -m conntrack on the mailing lists (this one or the dev one).
>>Would you care the elaborate on the advantages of the conntrack module
>>as opposed to the state one?
>
> More states that can be checked.
>
>
>>Should we also stop using -p, -s, -d, --sport and --dport and replace
>>them with the equivalents in the conntrack module?
>
> 1. That is for you to decide. As always, different matches only
> exist because their semantics are reasonably different from the rest.
> Consider
>
> -A FORWARD -s 2001:db8::4 -j ACCEPT
> -A FORWARD -d 2001:db8::4 -j ACCEPT
>
> and
>
> -A FORWARD -m conntrack --ctorigsrc 2001:db8::4 -j ACCEPT
>
> The former will allow all packets from and to 2001:db8::4 no matter who
> started.
>
> The latter will only accept packets that belong to connections initiated
> by 2001:db8::4;  2001:db8::4 can be in the srcip or the dstip field.
> Some unexperienced people may be sufficiently puzzled by that.
>
> So in a way, the latter check is stricter and matches less, but if that
> is what you actually want, you just discovered a rule saver.
>
>
> 2. If you have connection pickup enabled, the order of the orig
> and repl tuples depends on who we see a packet first from.

Very cool ! I guess it's time to update my rulesets :)
Thanks for the answer.

- Julien

-- 
Julien Vehent - http://1nw.eu/!j
