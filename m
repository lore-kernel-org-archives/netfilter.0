From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Why are two hash tuples stored for each connection in the
 connection tracking system?
Date: Tue, 3 Oct 2017 16:25:21 +0200
Message-ID: <5e618aa9-262a-b3b1-43e6-28fdcdfd1731@plouf.fr.eu.org>
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
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKMCqEJ4urXwNcwcQQ6y6_ogyhU7GDX_pQM=tusZOpHNvHoETQ@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Will Sewell <me@willsewell.com>
Cc: netfilter@vger.kernel.org

Le 03/10/2017 à 15:23, Will Sewell a écrit :
> 
> Ah, so are you saying conntrack can simply switch the source
> information with the destination information of a original direction
> packet leaving netfilter to get the source/destination information of
> a packet that is entering netfilter from the reply direction?

Roughly, yes.
There are variations for handling of "special" protocols such as ICMP 
which use header fields other than source/destination ports to identify 
connections.
