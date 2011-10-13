From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: limit module timer precision issue
Date: Thu, 13 Oct 2011 12:15:26 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1110131214530.28308@frira.zrqbmnf.qr>
References: <20111013014310.4369d65e@wwwwww-701SD> <201110130910.33120.mkubecek@suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201110130910.33120.mkubecek@suse.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: =?UTF-8?Q?Michal_Kube=C4=8Dek?= <mkubecek@suse.cz>
Cc: netfilter@vger.kernel.org

On Thursday 2011-10-13 09:10, Michal Kube=C4=8Dek wrote:

>On Thursday 13 of October 2011, abirvalg@lavabit.com wrote:
>> Hi, it seems to me that limit module has issues with timer precision=
=2E
>> The only iptables rules i have are:
>>=20
>> iptables  -I OUTPUT 1 -m state --state NEW -m limit --limit 2000/sec
>> --limit-burst 1  -j NFQUEUE --queue-num 11220 iptables -I OUTPUT 2
>> -m state --state NEW -j NFQUEUE --queue-num 11222
>>=20
>> iptables  -I INPUT 1 -m state --state NEW -m limit --limit 2000/sec
>> --limit-burst  1 -j NFQUEUE --queue-num 11221 iptables -I INPUT 2 -m
>> state --state NEW -j NFQUEUE --queue-num 11222
>>=20
>> (Both NFQUEUE 11220 and 11221 pass only NF_ACCEPT or NF_DROP
>> verdicts.)
>>=20
>> If I understand -m limit correctly, only if there is more than 2000
>> NEW connections going in or out, NFQUEUE 11222 will trigger.
>
>Not exactly. With "--limit-burst 1", no more than one packet per jiffy=
=20
>can pass the test. You may have only 30 NEW packets per second but it=20
>doesn't mean one packet every 1/30 s. And if there are two (or more) N=
EW=20
>packets within one jiffy, only the first passes the first rule.

One packet per time quantum (which is 1 second here, not 1 jiffy).
