From: Vigil <nvnwdfuq02@sneakemail.com>
Subject: Re: iprange
Date: Wed, 12 Nov 2003 00:11:43 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0311120005560.7355@fhynpb.envafyvqr.arg>
References: <Pine.LNX.4.33.0311120009030.26051-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0311120009030.26051-100000@blackhole.kfki.hu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

>What is 'ngh'? Negative?

It is the sound a mong makes when he realises he made a stupid mistake.

>Where did you read it's built into the iptables *binary*? Which binary? Why are
>you sure it's truly built into the binary on your machine?

All I did to resolve my problem was run the iprange patch from patch-o-matic to
put it into my kernel, recompile the kernel and reboot. Patch-o-matic didn't
touch iptables 1.2.9 that I already had installed.

IIRC (and I probably don't), I had to compile patch-o-matic's netfilter with the
iprange patch and use that instead of the 'normal' iptables 1.2.8 source. I just
forgot that there were two parts to getting iprange working: 1. iptables has to
recognise it, 2. the kernel also must be compiled with it. With the 1.2.9
changelog saying iprange was built into it, in my excitement I forgot about part
two.

-- 

.

