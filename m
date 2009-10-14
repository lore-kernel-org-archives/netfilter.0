From: Karel Rericha <karel@maxtel.cz>
Subject: Re: tc doesn't shape correctly -->> iproute2-latest + iptables 
	1.4.3.2 +linux-kernel 2.6.29.4 + imq support
Date: Wed, 14 Oct 2009 11:02:18 +0200
Message-ID: <5b19ed110910140202t23a3fd11kcc754220de041ccd@mail.gmail.com>
References: <2f88d4dd0910080649p21768c82k5a81292bb6013c88@mail.gmail.com>
	 <5b19ed110910080847q3bed17d3u9ae6dd42061917c8@mail.gmail.com>
	 <4AD4087D.5060208@ziu.info>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AD4087D.5060208@ziu.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Soltys <soltys@ziu.info>
Cc: netfilter@vger.kernel.org

2009/10/13 Michal Soltys <soltys@ziu.info>:
>>
>> I can confirm that similar setup (no imq) on Gentoo quadcore AMD64
>> 2.6.29 HFSC root class overflows where HTB is ok. This situation
>> persist for about year and few last kernels and I havent found a
>> solution except some notices about HFSC in current linux incarnation
>> being buggy.
>>
>
> Mind giving a pointer to such notices ?

Sorry, I dont have links to such notices I read when I did tests, but
quick Google search for "hfsc overflows" is giving results like this:
http://patchwork.ozlabs.org/patch/27303/

>> P.S.: Half year back we tested simple HFSC setup on bench with 3
>> classes (5, 10 and 15Mbits with root class 20Mbits) and when we
>> saturated all classes, total flow was 20Mbit for few seconds (5-30)
>> and then it overflowed to about 25Mbit, and sometimes returned back to
>> 20Mbit after few minutes. VERY strange.
>
> What exactly was your setup and how did you test it ?
>

Not sure (long time ago), but I think gentoo-sources 2.6.27 AMD64 on
dual dualcore Opteron 2214, 2x Intel 82571EB, 2x Broadcom BCM5754,
tested without bonding (but in production setup bonding is used),
without packet offloading, no imq nor ifb used. HFSC overflowed but
HTB was ok.

Karel
