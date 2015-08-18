From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: Ipset Error : ipset v6.25.1: Kernel error received: set type not
 supported (on Kernel 4.1.4)
Date: Tue, 18 Aug 2015 12:46:42 +0530
Message-ID: <CAA5aLPiH3oAoe5++bc11fgM0C01O3z2hNNv4AeG24Jo-godWGQ@mail.gmail.com>
References: <CAA5aLPh-_ySu=PFqkyyG+AzTWQo_cUc35ZcnH3W5ojQPeJeG4g@mail.gmail.com>
	<alpine.DEB.2.10.1508111211280.9289@blackhole.kfki.hu>
	<CAA5aLPj7LA3bN4NBCTvQ=FjDMy-8GZqh9nWk3groyMYOj5nQUQ@mail.gmail.com>
	<alpine.DEB.2.10.1508111320400.9289@blackhole.kfki.hu>
	<CAA5aLPhO7643BnLNNe4Kp+h6Nivvn_jtgVdRXBfWGPPPLf_kXA@mail.gmail.com>
	<alpine.DEB.2.10.1508111416010.9289@blackhole.kfki.hu>
	<CAA5aLPiNcE51=3UYfuRa8U_ueq6U7cJJPR0Tyd2cqH143vd9wg@mail.gmail.com>
	<CAA5aLPjaE_LbNwhVFjnHYUN2EsQKJKZRuXBmOxhx=6gqT+oWuw@mail.gmail.com>
	<CAA5aLPgeDDPzMD=4aoLY=2asWg1JN8nhWLV1qbY0XbhwwTP6wQ@mail.gmail.com>
	<alpine.DEB.2.10.1508121118040.15443@blackhole.kfki.hu>
	<alpine.DEB.2.10.1508172127280.16813@blackhole.kfki.hu>
	<alpine.DEB.2.10.1508180025410.17803@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=XNXMHlUufwiK9Z8Si9vaE5rMeERv5AlZo7BkJLkqiMs=;
        b=L0mwBHtebOt9yyDZ+7uDmCZWk07sA8fijpKgjMU0EYdT6FjKQDZeDdPHv10n3hduk5
         Y76bNEsjiPaIdMwI2g4+x+OAoJNT0Yqmkdg8VXfak+CtMkaHLOXuFfYzAUFAclxSRWrt
         Vyg2pD/1w9hsY+GWqGliZq0U4+U5LEsziic1q8IKPy7h/tBJBC3MVoVQcOz1O2nWM0Js
         wxivpnKiqMVWEIi21OR3aGmbnFH5S3tyoRLl9fsEI+Qv1WwKHEuU0o9UsiP5iZSmf4N6
         Vll61VB5/qfQx++8HRYUQBd0vGFErEKme6PtJJnasXpPbjzogtXFkMg6ozV65tvAuZRe
         hJGQ==
In-Reply-To: <alpine.DEB.2.10.1508180025410.17803@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I did fresh installation and its working fine!!!

and ya, I did rmmod for the original ip_set
and version of GCC is 4.4.6


Thanks for the help.

On Tue, Aug 18, 2015 at 3:57 AM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Mon, 17 Aug 2015, Jozsef Kadlecsik wrote:
>
>> On Wed, 12 Aug 2015, Jozsef Kadlecsik wrote:
>>
>> > On Wed, 12 Aug 2015, Akshat Kakkar wrote:
>> >
>> > > Well ... quite a number of tests passed succesfully... but then some
>> > > test have failed.
>> > > partial o/p of 'make tests' is
>> > >
>> > > comment: Bitmap comment: create set with timeout: passed
>> > > comment: Bitmap comment: Add multiple elements with default timeout: passed
>> > > comment: Bitmap comment: Add multiple elements with zero timeout: passed
>> > > comment: Bitmap comment: List set: passed
>> > > comment: Bitmap comment: Check listing: passed
>> > > comment: Sleep 5s so that entries can time out: passed
>> > > comment: Bitmap comment: List set: passed
>> > > comment: Bitmap comment: Check listing: --- .foo  2015-08-12
>> > > 12:14:03.475222428 +0530
>> > > +++ comment.t.list12 2015-06-25 14:49:08.000000000 +0530
>> > > @@ -1,9 +1,9 @@
>> > >  Name: test
>> > >  Type: bitmap:ip
>> > >  Header: range 2.0.0.1-2.1.0.0 timeout x comment
>> > > -Size in memory: 1056896
>> > > +Size in memory: 1056928
>> > >  References: 0
>> > > -Number of entries: 255
>> > > +Number of entries: 510
>> > >  Members:
>> > >  2.0.1.1 timeout x comment "text message 1"
>> > >  2.0.1.2 timeout x comment "text message 2"
>> > > FAILED
>> > > Failed test: diff -u -I 'Size in memory.*' .foo comment.t.list12
>> > > make: *** [tests] Error 1
>> >
>> > According to the diff, none of the entries with 5s timeout value timed
>> > out. Than may mean simply that the sleep/listing was faster than
>> > anticipated.
>>
>> Using the same system you described I could not reproduce any failure in
>> the testsuite:
>>
>> # uname -a
>> Linux teg 4.1.4 #1 SMP Sat Aug 15 17:09:32 CEST 2015 x86_64 GNU/Linux
>> # ../src/ipset -v
>> ipset v6.25.1, protocol version: 6
>> # ./runtests.sh
>> ...
>> All tests are passed
>>
>> I ran the testsuite multiple times.
>>
>> What is the version of the gcc you used for compiling?
>
> You did rmmod the original "ip_set" kernel module too, didn't you? If not,
> that may explain the failure.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
