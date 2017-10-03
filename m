From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Why are two hash tuples stored for each connection in the
 connection tracking system?
Date: Tue, 3 Oct 2017 16:36:24 +0200
Message-ID: <e3eb0594-c4c9-f1c1-0668-b8137f96ef8a@plouf.fr.eu.org>
References: <CAKMCqEL=UCUUn2=Ke7-4uJo-fij80k7u13zEOsHNh_AP_p2EKQ@mail.gmail.com>
 <0cc1bff1-b709-06ff-1dfa-5d4214397277@plouf.fr.eu.org>
 <6f1b85b3-4982-d14c-a7d0-9abca40489aa@plouf.fr.eu.org>
 <CAKMCqELnZLifhdEmbYEnPOX7SWAS4Y1L5KGBJ4YS_qT3QwkK=A@mail.gmail.com>
 <abe1f557-b3f7-1c41-ed15-5db7c7f5b1d0@plouf.fr.eu.org>
 <CAKMCqEJyaqmH5rnQGcmVYwxw=JxZYJd8gOHq-Wwuc375K+BuPw@mail.gmail.com>
 <62f03124-a3ed-1f17-3477-288c1f48c969@plouf.fr.eu.org>
 <CAKMCqEJLrtUEXo6xGHs2JMM3Z5dSg2wRfpi4bZNCf7yMtaOn5g@mail.gmail.com>
 <64d6734e-ca72-3788-42d4-afe495b3f372@plouf.fr.eu.org>
 <CAKMCqEJ4urXwNcwcQQ6y6_ogyhU7GDX_pQM=tusZOpHNvHoETQ@mail.gmail.com>
 <CAJMkcM0QRJWFrR5nNFfoCZraKJ8-C1MQ-hxeXsW9256JBhHtYw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJMkcM0QRJWFrR5nNFfoCZraKJ8-C1MQ-hxeXsW9256JBhHtYw@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Payam Chychi <pchychi@gmail.com>, Will Sewell <me@willsewell.com>
Cc: netfilter@vger.kernel.org

Le 03/10/2017 à 16:03, Payam Chychi a écrit :
>
> The concept of an original packet that is then tracked in table would be a
> tcp syn flag. syn bit is set to instruct that this is the 1st packet and
> its intention is to creat a connection/open socket.
> 
> reply traffic relys on the 3way handshake for TCP (other methods used for
> UDP) which includes seq/ack values to track the progress as well as other
> attributes

These are transport protocol-specific details. Netfilter connection 
tracking is more generic than this. TCP connection tracking does not 
even require by default that the first packet has the SYN flag.
