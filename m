From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: Ipset Error : ipset v6.25.1: Kernel error received: set type not
 supported (on Kernel 4.1.4)
Date: Wed, 12 Aug 2015 16:12:38 +0530
Message-ID: <CAA5aLPgtb7iKy3BgjAGzVUVW4m0uUGpvS3ffJM-KH7ikTgFQNA@mail.gmail.com>
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
	<CAA5aLPicyk_fi8O8XX3dtOwqTGiCBMWypbOJs9Bwff3yw2p-5w@mail.gmail.com>
	<alpine.DEB.2.10.1508121148020.15443@blackhole.kfki.hu>
	<CAA5aLPg2xNZMw2xRirj5pBnEort-K4sHesYfnVL+CD9D2V97jQ@mail.gmail.com>
	<alpine.DEB.2.10.1508121210280.15443@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=91uYyw1FpPVgJZEqwO62KX3OdO7K9ScS324zROn4X+A=;
        b=QcWYUvI7IoM4XQjXCauyB7QTp0Z+d8pQX5worRyRff4nCHx7oCV/5fFFj/m/5fbBCD
         5atsBo7RdR4IgqrP4vOl65hDG9oJqxjNGG0gMT9fuzVtNAIWZQvbAy4jgi2k8C/y0Dyy
         NjHBFo46ZcUZW1pj2KGpUsW76c4qM7Wuo/pNCT9oLXyAiUeIlsPlHZ+0r2m8yirJj3Uk
         NP7OZrioWA9XyU5bJbGGigQIa+lZDOVR2vPRQmgCErXVMYmBlv8MkVGZapga+16uAj4a
         2rgAm7q80qBXxROg0iaW0ONViMzE69D8NuaeqK+Qz2VGAn2GrT0f7VnEJ8yu943xH4SQ
         vkcA==
In-Reply-To: <alpine.DEB.2.10.1508121210280.15443@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Thanks a lot.

On Wed, Aug 12, 2015 at 3:42 PM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Wed, 12 Aug 2015, Akshat Kakkar wrote:
>
>> that I did change to 4,
>>
>> o/p is
>>
>> comment: Bitmap comment: List set: passed
>> comment: Bitmap comment: Check listing: passed
>> comment: Sleep 5s so that entries can time out: passed
>> comment: Bitmap comment: List set: passed
>> comment: Bitmap comment: Check listing: --- .foo        2015-08-12
>> 15:10:46.562822931 +0530
>> +++ comment.t.list12    2015-06-25 14:49:08.000000000 +0530
>> @@ -1,9 +1,9 @@
>>  Name: test
>>  Type: bitmap:ip
>>  Header: range 2.0.0.1-2.1.0.0 timeout x comment
>> -Size in memory: 1056896
>> +Size in memory: 1056928
>>  References: 0
>> -Number of entries: 255
>> +Number of entries: 510
>>  Members:
>>  2.0.1.1 timeout x comment "text message 1"
>>  2.0.1.2 timeout x comment "text message 2"
>> FAILED
>> Failed test: diff -u -I 'Size in memory.*' .foo comment.t.list12
>> make: *** [tests] Error 1
>
> That is quite strange: the bitmap:ip timeout tests ran successfully, here
> the comment extension is added to the elements besides the timeout.
>
> So this is with kernel 4.1.4 - I'm going to check it myself.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
