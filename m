From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Why are two hash tuples stored for each connection in the
 connection tracking system?
Date: Tue, 3 Oct 2017 15:19:19 +0200
Message-ID: <64d6734e-ca72-3788-42d4-afe495b3f372@plouf.fr.eu.org>
References: <CAKMCqEL=UCUUn2=Ke7-4uJo-fij80k7u13zEOsHNh_AP_p2EKQ@mail.gmail.com>
 <0cc1bff1-b709-06ff-1dfa-5d4214397277@plouf.fr.eu.org>
 <6f1b85b3-4982-d14c-a7d0-9abca40489aa@plouf.fr.eu.org>
 <CAKMCqELnZLifhdEmbYEnPOX7SWAS4Y1L5KGBJ4YS_qT3QwkK=A@mail.gmail.com>
 <abe1f557-b3f7-1c41-ed15-5db7c7f5b1d0@plouf.fr.eu.org>
 <CAKMCqEJyaqmH5rnQGcmVYwxw=JxZYJd8gOHq-Wwuc375K+BuPw@mail.gmail.com>
 <62f03124-a3ed-1f17-3477-288c1f48c969@plouf.fr.eu.org>
 <CAKMCqEJLrtUEXo6xGHs2JMM3Z5dSg2wRfpi4bZNCf7yMtaOn5g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKMCqEJLrtUEXo6xGHs2JMM3Z5dSg2wRfpi4bZNCf7yMtaOn5g@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Will Sewell <me@willsewell.com>
Cc: netfilter@vger.kernel.org

Le 03/10/2017 à 14:32, Will Sewell a écrit :
> 
> This makes me still unclear on how conntrack figures out that the
> original and reply packets are related. e.g. from the information in
> the packet entering netfilter in the reply direction, how can it
> determine that it is part of the same connection as the packet
> entering netfilter in the original direction. I'll try and figure this
> out and reply to this thread if I do.

Quite simple. After conntrack has seen the first original packet leave, 
it knows what a reply packet should look like when it enters.
Roughly, a packet entering netfilter in the reply direction is the 
reverse of a packet leaving netfilter in the original direction.
