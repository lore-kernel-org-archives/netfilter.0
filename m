From: Michal Soltys <soltys@ziu.info>
Subject: Re: tc doesn't shape correctly -->> iproute2-latest + iptables 	1.4.3.2
 +linux-kernel 2.6.29.4 + imq support
Date: Tue, 13 Oct 2009 06:56:29 +0200
Message-ID: <4AD4087D.5060208@ziu.info>
References: <2f88d4dd0910080649p21768c82k5a81292bb6013c88@mail.gmail.com> <5b19ed110910080847q3bed17d3u9ae6dd42061917c8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5b19ed110910080847q3bed17d3u9ae6dd42061917c8@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Karel Rericha <karel@maxtel.cz>
Cc: netfilter@vger.kernel.org

> 
> I can confirm that similar setup (no imq) on Gentoo quadcore AMD64
> 2.6.29 HFSC root class overflows where HTB is ok. This situation
> persist for about year and few last kernels and I havent found a
> solution except some notices about HFSC in current linux incarnation
> being buggy.
> 

Mind giving a pointer to such notices ?

> Our solution was return back to HTB :-)
> 
> If anyone knows why HFSC overflows, please post.
> 
> Karel
> 
> P.S.: Half year back we tested simple HFSC setup on bench with 3
> classes (5, 10 and 15Mbits with root class 20Mbits) and when we
> saturated all classes, total flow was 20Mbit for few seconds (5-30)
> and then it overflowed to about 25Mbit, and sometimes returned back to
> 20Mbit after few minutes. VERY strange.

What exactly was your setup and how did you test it ?
