From: Alessandro Vesely <vesely@tana.it>
Subject: NFQUEUE looses packets between arrival and verdict
Date: Wed, 11 May 2011 19:27:49 +0200
Message-ID: <4DCAC715.3090206@tana.it>
References: <1304489658.32272.19.camel@compot-mob>	 <4DC19739.2040008@tana.it> <1304533951.25221.8.camel@hakkenden>	 <4DC26A0A.8050402@tana.it> <1304587479.6402.3.camel@compot-mob>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1305134869; bh=0LiW7Zvbx8ttJwMLC8Da9YHdwVNoiQP8xkqjprSEDak=;
	l=1529;
	h=Message-ID:Date:From:MIME-Version:To:CC:References:In-Reply-To:
	 Content-Transfer-Encoding;
	b=LZ/CsM0ntC1Uc/96cyGjSxlMYOXGYhAopJ83iwaFMvfaNqo4MSw/EYwHvbazgBka5
	 dkyQjzmldB9RwD6UTHQd4fBbW/bOJ7sfzSFoW6HblHSU47UM9RxccRNXkUWjL4iaV1
	 qjcwAg9HAQOpD+t8Y+u8IXD/6iZaNwwtFpP22AxQ=
In-Reply-To: <1304587479.6402.3.camel@compot-mob>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: nowhere <nowhere@hakkenden.ath.cx>
Cc: netfilter@vger.kernel.org

Finally I've found some time to try that.  Sorry for the delay.

On 05/May/11 11:24, nowhere wrote:
>>> Indeed. The first packet is never dropped, then comes a serie of drops
>>> (the number of dropped packets depends on the sending rate, i.e. testing
>>> with iperf on, say, 50 Mbit/s shows drops of ~800 packets) and after
>>> that no drops at all. Distribution and it's parameters do not matter
>>> except for zeroes: if there is no artificial delay, no packets are
>>> dropped.

It seems enough to avoid delaying the call to nfq_set_verdict for the
first packet of a burst.  For a shot in the dark, packets seem to get
lost if they arrive between the first one and the corresponding call
to nfq_set_verdict.  Indeed, setting a fixed real_delay of 0.2, with
ping -i 0.2 it looses no packets, with ping -i 0.19 it looses just the
second one, with ping -i 0.09 icmp_reqs #2 and #3.

No error is returned, whether NETLINK_NO_ENOBUFS is set or not.

>> Did you check return codes from nfq_set_verdict()?  If that is 0, it must be
>> a bug.                       I meant >= 0 here ----------------^
> 
> nfq_set_verdict() returns 32

AFAIK the library does not queue data, so I'd guess the bug is in the
kernel.  I hope someone else chimes in and explains some more of this.
(I change the subject trying to draw attention.)

> I'm using Gentoo x86_64 v2.6.38-gentoo-r4 (2.6.38.5 + minor patches).
> libnetfilter_queue is 0.0.17

Same on Debian x86_64 2.6.32-something, and libnetfilter_queue 0.0.17
