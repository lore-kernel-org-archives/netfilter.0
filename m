From: Roberto Nibali <ratz@tac.ch>
Subject: Re: Strange netfilter/iproute behav.
Date: Mon, 09 Dec 2002 11:49:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF47524.2010204@tac.ch>
References: <11126858610.20021207230114@teamix.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Richard Mueller <mueller@teamix.net>
Cc: netfilter@lists.netfilter.org

Hello,

> Some strange things are happening, when I try to use routing decisions
> based on fwmark.

Ok.

> host:~# ip rule add fwmark 19 lookup inet
> host:~# iptables -t mangle -F
> host:~# iptables -t mangle -A OUTPUT -j MARK --set-mark 19

[vs.]

> host:~# ip rule add fwmark 1 lookup inet
> host:~# iptables -t mangle -A OUTPUT -j MARK --set-mark 1

A lot of people fall into this trap.

> I have no idea what I have done wrong and  the  workaround  (by  using
> "1") isn't really a good idea because is need plenty ( > 10) of fwmark
> targets.

:) The problem is that the fwmark from iproute2 takes its argument as a hex 
value. So when you write the following line:

ip rule add fwmark 19 lookup inet

You actually have 0x19 which is 25. So you need to to set the following 
according iptables mangle rule with MARK=19:

iptables -t mangle -A OUTPUT -j MARK --set-mark $((0x${MARK}))

> If this is a beginner's problem please say something like
> # man iptables

It's probably a beginner's problem but there is not really a man page for this, 
so I say RTSL :)

Cheers and HTH,
Roberto Nibali, ratz
-- 
echo '[q]sa[ln0=aln256%Pln256/snlbx]sb3135071790101768542287578439snlbxq' | dc


