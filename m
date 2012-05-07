From: eric <eric@regit.org>
Subject: Re: Issuing verdicts out of order
Date: Mon, 07 May 2012 10:40:42 +0200
Message-ID: <0404f91c5cd129b1f103d8d42a71496a@regit.org>
References: <CAPy6qbd=sMMEGqNfsYiAdfKMfKBN=0W1m1FyF2eu9DzhxF05Kg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAPy6qbd=sMMEGqNfsYiAdfKMfKBN=0W1m1FyF2eu9DzhxF05Kg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Waqar Hameed <waqar.hameed08@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

On Sun, 6 May 2012 19:08:24 +0500, Waqar Hameed <waqar.hameed08@gmail.com>
wrote:
> Hi,
> 
> I wanted to ask that can verdicts be issued to packets out of order?
> 
> I am building an application that delays the delivery of packets
> depending upon some factors. So it may be the case that the first
> packet has to be delayed whereas the second packet in queue must be
> *accepted* immediately. So can we store delaying packets in some queue
> and releasing them as required?

There is strictly no problem with that. The only thing to do is to have
a queue length which is big enough to avoid packet dropping.

BR,

> 
> If someone has other ideas of how to implement it using
> libnetfilter_queue, please guide me.
> 
> Best,
> 
> Waqar
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
