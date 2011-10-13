From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: limit module timer precision issue
Date: Thu, 13 Oct 2011 14:32:25 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1110131420310.16250@frira.zrqbmnf.qr>
References: <20111013014310.4369d65e@wwwwww-701SD> <201110130910.33120.mkubecek@suse.cz> <alpine.LNX.2.01.1110131214530.28308@frira.zrqbmnf.qr> <201110131323.04339.mkubecek@suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201110131323.04339.mkubecek@suse.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: =?UTF-8?Q?Michal_Kube=C4=8Dek?= <mkubecek@suse.cz>
Cc: netfilter@vger.kernel.org

On Thursday 2011-10-13 13:23, Michal Kube=C4=8Dek wrote:

>On Thursday 13 of October 2011, Jan Engelhardt wrote:
>> >Not exactly. With "--limit-burst 1", no more than one packet per
>> >jiffy can pass the test. You may have only 30 NEW packets per
>> >second but it doesn't mean one packet every 1/30 s. And if there
>> >are two (or more) NEW packets within one jiffy, only the first
>> >passes the first rule.
>>=20
>> One packet per time quantum (which is 1 second here, not 1 jiffy).
>
>I don't think so. With "--limit 2000/s --limit-burst 1" I can pass muc=
h=20
>more than one packet per second (but no more than 1000 per second with=
=20
>HZ=3D1000).

Well, burst does not specify any rate, so claiming "per second" (or "pe=
r=20
jiffy") does not make sense anyway. As per the manpage, it replenishes=20
the available credit. It's just that the math is not very intuitive. In=
=20
a way it specifies the window for calculation. --limit n/s --limit-burs=
t=20
1, IIRC, enforces 1 packet per 1/n seconds strictly, while --limit n/s=20
--limit-burst n allows for spreading n over 1 second. (The two most=20
common uses.)

--limit 2000/s should always give you 2000 packets somehow distributed=20
over 1 second for any burst value <=3D 2000. The fact that it does not=20
(you observe 1000/s) hints towards what I said earlier that high-rate=20
matching in xt_limit and xt_hashlimit has inaccuracies.
