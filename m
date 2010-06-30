From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: ebtables & VLAN redirect
Date: Wed, 30 Jun 2010 23:54:21 +0300
Message-ID: <AANLkTinR6BX8jk6QRl3j-srd1_yprRQz30cKJjGNLtGd@mail.gmail.com>
References: <AANLkTilVkFmW0SL3t6ESUN72On5y52OvxYBUz2ZZdAWc@mail.gmail.com>
	<4C262DA2.1040103@riverviewtech.net>
	<AANLkTikWc-CNXMieyxv2lB69UphqQRsjjJATJYrpjkMK@mail.gmail.com>
	<4C2805A3.4070801@riverviewtech.net>
	<AANLkTikeVKxFv4jTp2vLTh80BOQW1nAQxmCc8M7EsPJ1@mail.gmail.com>
	<4C2909D9.8010506@riverviewtech.net>
	<AANLkTindtJ35xk2AgQxS_Fkac86s-n1riksh7D2oD34o@mail.gmail.com>
	<4C2A49A3.1030600@riverviewtech.net>
	<4C2A49F6.2060704@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=fKecaLrUGUOFyiWRju4XpRwnRglpWAytvnL0gdGsr9U=;
        b=PwyhYr5tlLXwaUOE/L5c0oGGgRzq8GDGE/VdWr6ONyILvKIOUqzL/8veA3kzyLTnbL
         KWPitbEbg9Xfj3odbrFE/mjB+6dcj8sDfFuNv7eIBe+UOHhnLJBZwaizFJapKMTEoFCP
         yQiJbZ/P2HhObxv05CbrJ9TwgzzgGNYLUUN6c=
In-Reply-To: <4C2A49F6.2060704@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

2010/6/29 Grant Taylor <gtaylor@riverviewtech.net>:
> On 06/29/10 14:29, Grant Taylor wrote:
>>
>> The simple fact that you have the amount of incoming traffic that yo=
u want
>> to filter and forward a subset of implies that there will be CPU tim=
e spent
>> analyzing which traffic to forward.
>
> Along these lines, I have what some might consider a devious idea.
>
> Create a bridge for each VLAN. =A0That will give you the VLAN interfa=
ce and
> it's associated bridge interface. =A0Then bridge the bridge interface=
s in to a
> larger bridge.
>
> Using all the smaller bridges will keep the possible rules that you n=
eed to
> match smaller, thus less load on the CPU. =A0You could also turn down=
 the
> VLANs individual bridge when you didn't want to monitor any traffic o=
n it,
> thus reducing the load further.
>
> So, you would end up with a topology somewhat like this:
>
> eth0.101 <-> br101 <-> br9
> eth0.102 <-> br102 <-> br9
> eth0.103 <-> br103 <-> br9 <-> eth1.9
> ...
> eth0.199 <-> br199 <-> br9
>
> In this case, br9 is nothing more than a collector from all the other
> bridges.
>
> It's the interaction between eth0.<VID> and br<VID> that has to do th=
e
> filtering.
>
> When you don't want to monitor traffic on say, eth0.123, simply remov=
e it
> from br123. =A0Doing so will cause br123 to disable (but not remove) =
its self
> which will cause br9 to disable the port that is br123. =A0- Then whe=
n you
> want to monitor eth0.123, re-add it to br123, causing br123 to re-ena=
ble,
> causing br9 to re-enable br123's port.
>
> Using br9 to aggregate all the VLANs together will also make it easie=
r /
> less load to make sure that you don't have inter-VLAN communications =
because
> only the traffic you are interested in will make it that far, not all=
 the
> traffic that you are talking about. =A0Seeing as how there will be mu=
ch less
> traffic, matching the EBTables rules to see what can talk to what (fo=
r br9)
> will be much less load on the system.
>
> Something to think about.
>

A nice idea.
I have thought about it a bit earlier.
BUT linux implementation of bridging has two limitations that makes it
impossible:
1. There cannot be nested bridge devices.
2. Each device can belong to only one bridge device.

Eventually I have come to understanding that my problem has no fine
solution with no risks for performance. Partially I can solve it on
application layer, partially by using bridging.
And talking with you enlightened me on the ways of doing it.
Thanks for your efforts and ideas.

--=20
Best regards
Anatoly Muliarski
