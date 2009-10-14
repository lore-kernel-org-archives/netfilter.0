From: Michal Soltys <soltys@ziu.info>
Subject: Re: tc doesn't shape correctly -->> iproute2-latest + iptables 	1.4.3.2
 +linux-kernel 2.6.29.4 + imq support
Date: Wed, 14 Oct 2009 11:56:41 +0200
Message-ID: <4AD5A059.6080303@ziu.info>
References: <2f88d4dd0910080649p21768c82k5a81292bb6013c88@mail.gmail.com>	 <5b19ed110910080847q3bed17d3u9ae6dd42061917c8@mail.gmail.com>	 <4AD4087D.5060208@ziu.info> <5b19ed110910140202t23a3fd11kcc754220de041ccd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5b19ed110910140202t23a3fd11kcc754220de041ccd@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Karel Rericha <karel@maxtel.cz>
Cc: netfilter@vger.kernel.org

Karel Rericha wrote:
> 
>>> P.S.: Half year back we tested simple HFSC setup on bench with 3
>>> classes (5, 10 and 15Mbits with root class 20Mbits) and when we
>>> saturated all classes, total flow was 20Mbit for few seconds (5-30)
>>> and then it overflowed to about 25Mbit, and sometimes returned back to
>>> 20Mbit after few minutes. VERY strange.
>> What exactly was your setup and how did you test it ?
>>
> 
> Not sure (long time ago), but I think gentoo-sources 2.6.27 AMD64 on
> dual dualcore Opteron 2214, 2x Intel 82571EB, 2x Broadcom BCM5754,
> tested without bonding (but in production setup bonding is used),
> without packet offloading, no imq nor ifb used. HFSC overflowed but
> HTB was ok.
> 
> Karel
> 

I meant more about your hfsc rules in that simple setup, not the hardware.
