From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: NAT-PMP connections not tracked with nf_conntrack
Date: Mon, 15 Nov 2010 22:59:54 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1011152256390.30823@obet.zrqbmnf.qr>
References: <4CB5C1C1.8060809@googlemail.com> <alpine.LNX.2.01.1010161750050.13972@obet.zrqbmnf.qr> <4CB9D437.2030902@googlemail.com> <alpine.LNX.2.01.1010161948580.29809@obet.zrqbmnf.qr> <4CB9E918.2040707@googlemail.com> <4CDFBCDA.8050006@googlemail.com>
 <alpine.LNX.2.01.1011151458001.6022@obet.zrqbmnf.qr> <4CE1AB3F.2000606@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CE1AB3F.2000606@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org


On Monday 2010-11-15 22:50, Mr Dash Four wrote:
>
>>> Any ideas? The connection is definitely not tracked and could be seen with
>>> netstat from local to the remote point on the VPN.
>>>    
>>
>> No idea. If I were to look at the system directly maybe.
>>  
> If I can help you with providing some more info I would - just let me know, but
> the connection is definitely there and is definitely not tracked. When I
> execute 'netstat --inet -an' I get it listed, like:
> udp        0      0 10.1.1.2:51602              10.1.1.1:5351
> ESTABLISHED
>
> This is not showing with "cat /proc/net/nf_conntrack | grep 5351" or "cat
> /proc/net/nf_conntrack | grep 51602"

Well yes you said that already. BTW, netstat is obsolete, use ss.
The cat is also not necessary (Useless use of cat), just use grep,
but alas, the conntrack the utility is a better solution.


The first thing I'd probably do is add a -p udp --dport 5351 -j LOGMARK
(xtables-addons) target rule in the mangle table to check for the ct
status. After that, it's pretty much kernel code debugging in
nf_conntrack_proto_udp.c, doing a spatial bisect for where the ct
gets (not) created.
