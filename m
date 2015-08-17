From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Ipset Error : ipset v6.25.1: Kernel error received: set type
 not supported (on Kernel 4.1.4)
Date: Mon, 17 Aug 2015 22:08:14 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1508172127280.16813@blackhole.kfki.hu>
References: <CAA5aLPh-_ySu=PFqkyyG+AzTWQo_cUc35ZcnH3W5ojQPeJeG4g@mail.gmail.com> <alpine.DEB.2.10.1508111211280.9289@blackhole.kfki.hu> <CAA5aLPj7LA3bN4NBCTvQ=FjDMy-8GZqh9nWk3groyMYOj5nQUQ@mail.gmail.com> <alpine.DEB.2.10.1508111320400.9289@blackhole.kfki.hu>
 <CAA5aLPhO7643BnLNNe4Kp+h6Nivvn_jtgVdRXBfWGPPPLf_kXA@mail.gmail.com> <alpine.DEB.2.10.1508111416010.9289@blackhole.kfki.hu> <CAA5aLPiNcE51=3UYfuRa8U_ueq6U7cJJPR0Tyd2cqH143vd9wg@mail.gmail.com> <CAA5aLPjaE_LbNwhVFjnHYUN2EsQKJKZRuXBmOxhx=6gqT+oWuw@mail.gmail.com>
 <CAA5aLPgeDDPzMD=4aoLY=2asWg1JN8nhWLV1qbY0XbhwwTP6wQ@mail.gmail.com> <alpine.DEB.2.10.1508121118040.15443@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.10.1508121118040.15443@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Akshat Kakkar <akshat.1984@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, 12 Aug 2015, Jozsef Kadlecsik wrote:

> On Wed, 12 Aug 2015, Akshat Kakkar wrote:
> 
> > Well ... quite a number of tests passed succesfully... but then some
> > test have failed.
> > partial o/p of 'make tests' is
> > 
> > comment: Bitmap comment: create set with timeout: passed
> > comment: Bitmap comment: Add multiple elements with default timeout: passed
> > comment: Bitmap comment: Add multiple elements with zero timeout: passed
> > comment: Bitmap comment: List set: passed
> > comment: Bitmap comment: Check listing: passed
> > comment: Sleep 5s so that entries can time out: passed
> > comment: Bitmap comment: List set: passed
> > comment: Bitmap comment: Check listing: --- .foo  2015-08-12
> > 12:14:03.475222428 +0530
> > +++ comment.t.list12 2015-06-25 14:49:08.000000000 +0530
> > @@ -1,9 +1,9 @@
> >  Name: test
> >  Type: bitmap:ip
> >  Header: range 2.0.0.1-2.1.0.0 timeout x comment
> > -Size in memory: 1056896
> > +Size in memory: 1056928
> >  References: 0
> > -Number of entries: 255
> > +Number of entries: 510
> >  Members:
> >  2.0.1.1 timeout x comment "text message 1"
> >  2.0.1.2 timeout x comment "text message 2"
> > FAILED
> > Failed test: diff -u -I 'Size in memory.*' .foo comment.t.list12
> > make: *** [tests] Error 1
> 
> According to the diff, none of the entries with 5s timeout value timed 
> out. Than may mean simply that the sleep/listing was faster than 
> anticipated.

Using the same system you described I could not reproduce any failure in 
the testsuite:

# uname -a
Linux teg 4.1.4 #1 SMP Sat Aug 15 17:09:32 CEST 2015 x86_64 GNU/Linux
# ../src/ipset -v
ipset v6.25.1, protocol version: 6
# ./runtests.sh
...
All tests are passed

I ran the testsuite multiple times.

What is the version of the gcc you used for compiling?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
