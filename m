From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: kernel helper modules parameters
Date: Wed, 8 Feb 2012 06:39:37 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1202080621310.25781@frira.zrqbmnf.qr>
References: <4F31B772.2040102@googlemail.com> <4F31E7D3.5060203@googlemail.com> <alpine.LNX.2.01.1202080454140.12624@frira.zrqbmnf.qr> <4F31F30A.3020902@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F31F30A.3020902@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2012-02-08 04:59, Mr Dash Four wrote:

>
>> tl;dr: What does ipset have to do with the tftp/sip/h323 conntrack modules?
>>  
> Are you really *that* thick?

Yes, apparently my other self was sleep-walking and missed the -j CT.

>-bash~# iptables -A OUTPUT -t raw -p udp -m set --match-set test
>dst,dst -j CT --helper ftp
>iptables: No chain/target/match by that name.
>                                                                                
>Anyone kind enough to enlighten me why do I have to specify a protocol          
>(which matches the ipset type exactly!) in order for iptables to accept and     
>create that rule? For the filter table there is no such constraint.             

ENOENT is traditionally returned by x_tables when a
chain/target/match could not be found and hence ENOENT has been
largely tied to the very translation ("No chain/target/match by that
name") that you see. Looking at xt_set.c reveals that xt_set, too,
can return -ENOENT from its checkentry function, which x_tables just
passed up to userspace. Hence there is no way to distinguish between
the two. However, xt_set also emits a message into dmesg via
pr_warning when it does return ENOENT.

The ip_set_nfnl_get_byindex function returning ENOENT would in turn
indicate that there was no set by the given index, which I gather
must have been translated from the set name in userspace already.
It is possible that this set is removed between the time the lookup was 
done and that the rule reached the kernel. And that is unlikely.

>-bash~# ipset n test hash:ip,port family inet timeout 0 hashsize 128
><Not run:: ipset a test 10.99.99.1,tcp:17021>
>-bash~# iptables -A OUTPUT -t raw -m set --match-set test dst,dst -j CT
>--helper ftp
>iptables: No chain/target/match by that name.

Given that

# ipset n test hash:ip,port family inet timeout 0 hashsize 128
# iptables -A OUTPUT -t raw -m set --match-set test dst,dst

succeeds, and adding -j CT does not (and I know I do have xt_CT),
dmesg is once again handy:

[29710.653372] xt_CT: You must specify a L4 protocol, and not use inversions on
it.

(And yes, xt_CT also returns ENOENT. Guess we need to change
the error message that the iptables frontend prints.)

hth.
