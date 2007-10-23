From: Patrick McHardy <kaber@trash.net>
Subject: Re: iptables logging to syslog: performance problem
Date: Tue, 23 Oct 2007 18:45:02 +0200
Message-ID: <471E250E.3010105@trash.net>
References: <471E0F68.4010700@oxalide.com> <471E181E.3050505@trash.net> <471E1A16.5060404@oxalide.com> <471E1ECF.3030300@trash.net> <471E244C.8000009@oxalide.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <471E244C.8000009@oxalide.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Guillaume Leccese <guillaume.leccese@oxalide.com>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

Guillaume Leccese wrote:
> Patrick McHardy a =E9crit :
>>
>> In case you're not using the serial console for logging, can you
>> reproduce it without Julian's patches?
>
> I can't use actually working environment without Julian's patches.
>
> Tomorrow, I will try to reproduce on a test environment without the=20
> patch, but I not sure I can achieve that because we can't reach the=20
> same network load.
>

So you're using IPVS? I'm not familiar with that, but please post your
configuration (both IPVS and netfilter) anyway, maybe someone else has
a hint.
-
To unsubscribe from this list: send the line "unsubscribe netfilter-dev=
el" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
