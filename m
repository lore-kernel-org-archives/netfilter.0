From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: limit bandwidth equally
Date: Tue, 09 Nov 2010 11:47:34 +0100
Message-ID: <4CD926C6.8070604@unipex.it>
References: <4CD7D742.2040702@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CD7D742.2040702@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: J Webster <jw.jwebster@googlemail.com>
Cc: netfilter@vger.kernel.org

J Webster ha scritto:
> I have a 100Mbps data centre connection. I would like to limit users
> bandwidth to my server but only when it becomes clogged.

There is no problem for this

> It seems users report problems when the bandwidth gets above
> 7000kbits per sec I think this is caused by useres downloading many
> files rather than streaming video. I think 2000kbits per sec should
> be enough for streaming video so is there a way to throttle this and
> share it equally between users anytime the overall connection gets
> above 70000?

First of all, I see some problems on you numbers. Are you talking about
7Mbps or 70000 (without units)

And after, what mean "users report problems"? This isn't a technical
explain of the problem...

For achieve what you are looking for, you need a big dive into tc
(lartc.org) and as my personal advice, htb (google for tc htb).

After studied all the guides passed, if you have further problems, we
are here.

Michele
