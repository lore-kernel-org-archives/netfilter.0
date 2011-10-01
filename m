From: Brian Schang <netfilter@lists.schang.net>
Subject: Re: iptables problem: conntrack rev 2 does not support port ranges
Date: Fri, 30 Sep 2011 21:12:45 -0400
Message-ID: <4E86690D.1060400@lists.schang.net>
References: <4E772599.80602@lists.schang.net> <alpine.LNX.2.01.1109191343280.12698@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1109191343280.12698@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello:

On 9/19/2011 7:44 AM, Jan Engelhardt wrote:
> On Monday 2011-09-19 13:20, Brian Schang wrote:
>
>> I dug into this a little bit and discovered:
>> # iptables -A test -m conntrack -p tcp --ctorigdstport 22 -j ACCEPT
>> iptables v1.4.12.1: conntrack rev 2 does not support port ranges
>> Try `iptables -h' or 'iptables --help' for more information.
>>
>> With some Googling, I discovered that Tom Eastep had encountered the same
>> issue. He submitted a patch for iptables and Jan Engelhardt ultimately released
>> 'iptables 1.4.12.1'.
>
> (It was not me who released 1.4.12.1.)
>
> Tom Eastep's fix was only merged after that release.

My apologies -- thanks for clarifying. I misinterpreted the git history.
