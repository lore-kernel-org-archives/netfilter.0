From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: kernel helper modules parameters
Date: Wed, 8 Feb 2012 15:37:15 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1202081521290.1820@frira.zrqbmnf.qr>
References: <4F31B772.2040102@googlemail.com> <4F31E7D3.5060203@googlemail.com> <alpine.LNX.2.01.1202080454140.12624@frira.zrqbmnf.qr> <4F31F30A.3020902@googlemail.com> <alpine.LNX.2.01.1202080621310.25781@frira.zrqbmnf.qr>
 <4F32846D.2060408@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F32846D.2060408@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2012-02-08 15:19, Mr Dash Four wrote:
>> ENOENT is traditionally returned by x_tables [...]
>> The ip_set_nfnl_get_byindex function returning ENOENT[...]
>>  
> You need to bear in mind that my understanding of the internal netfilter
> intricacies is still a bit limited, so you have to translate the above for the
> "regular" folk like myself.

"ENOENT has many meanings, and iptables prints just one of them,
which is potentially misleading."

>> [29710.653372] xt_CT: You must specify a L4 protocol, and not use inversions
>> on it.
>
>why do I have to specify a protocol when ipset can match on IP address &
>port/protocol at the same time (that is the sole purpose of hash:ip,port
>isn't it?)? The "L4 protocol" is already specified when the set members
>are registered in that set.

The message is output by CT, not ipset. Extensions are independent
and isolated, and have no knowledge of one another's existence or
inner workings.

The reason you have to specify -p tcp is so that CT can take a
reference to the particular helper instance (which is identified
by name, L3 family, _and_ L4 family) and/or load a module that
does provide such instances, respectively.

For example, attempting to do -p sctp -j CT --helper ftp should fail,
because there is no helper instace (nor a module in the default
kernel to provide such). - In other words, nf_conntrack_ftp only
knows to deal with TCP.

While we do know whata L4 protocol a packet is once it is received
from the network, there is no chance to load the required module
on the fly due to interrupt context constraint, so hypothetically
allowing "(-p all) -j CT" would be unreliable, packets would not
"get helped".

As such, specify the L4 beforehand is a requirement.

> One other thing, which may cause further complications - the ftp helper is
> supposed to work on tcp protocol only, so in theory, I should not be allowed to
> register anything other than that protocol. I suspect if I try to register udp
> (or any other protocol which differs from tcp) I will succeed. So, I think,
> this may need to be corrected as well.

Precisely. "-p all" just is not the same as "-p tcp". I guess
one /could/ add a PF_UNSPEC instance to nf_conntrack_ftp.c,
thereby allowing to use -j CT without any -p (or nonsensical values
for -p) and ignore all packets that are not TCP.

But that would cause some practical overhead as a packet's verdict
would not be known until the helper code is executed. (Currently
the check can be done outside the helper because the L4 is
known in advance.)

