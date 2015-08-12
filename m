From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: Ipset Error : ipset v6.25.1: Kernel error received: set type not
 supported (on Kernel 4.1.4)
Date: Wed, 12 Aug 2015 15:13:05 +0530
Message-ID: <CAA5aLPicyk_fi8O8XX3dtOwqTGiCBMWypbOJs9Bwff3yw2p-5w@mail.gmail.com>
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
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=PmfTmBzlhGsg2JCWoUx+TxlNuDwCNigZTkP9U8VpphE=;
        b=H+tKYs3Y72Pbl7jpJlKDm/MjKVVo2W9SJspQMi/fZj98lbhovs23N1pC21B7sZd7t/
         HMtf78qQGg98WtbZOK/t3d6cRUg+oMW4gYTMykzitEuA+SKffjSSnNBR0Ghf62tRf2UL
         N+P6Zy/is/92F7b/xIzkKYYyKsvHxk6iJgmD/V2VZo9IgH2kk9Nu0c2aNn17Dszlw1Zj
         rjOzHsioYVjyhgdiI25jroO551goHBLCKToGMmvDFV+BxIiAsqK3htV95mrww/R8RJcw
         f5+Wed6zF7CYlDunE8AQxgRZk9CzuFgAr2juOi9WQbcGHM3NSVprIH17z9cTHHf9dekk
         Mf9A==
In-Reply-To: <alpine.DEB.2.10.1508121118040.15443@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

There is no timeout on line 42 ....

     40 0 ipset create test bitmap:ip range 2.0.0.1-2.1.0.0 comment timeout 5
     41 # Bitmap comment: Add multiple elements with default timeout
     42 0 for x in `seq 1 255`; do echo "add test 2.0.0.$x comment
\\\"text message $x\\\""; done | ipset restore
     43 # Bitmap comment: Add multiple elements with zero timeout
     44 0 for x in `seq 1 255`; do echo "add test 2.0.1.$x timeout 0
comment \\\"text message $x\\\""; done | ipset restore

On Wed, Aug 12, 2015 at 2:56 PM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Wed, 12 Aug 2015, Akshat Kakkar wrote:
>
>> Well ... quite a number of tests passed succesfully... but then some
>> test have failed.
>> partial o/p of 'make tests' is
>>
>> comment: Bitmap comment: create set with timeout: passed
>> comment: Bitmap comment: Add multiple elements with default timeout: passed
>> comment: Bitmap comment: Add multiple elements with zero timeout: passed
>> comment: Bitmap comment: List set: passed
>> comment: Bitmap comment: Check listing: passed
>> comment: Sleep 5s so that entries can time out: passed
>> comment: Bitmap comment: List set: passed
>> comment: Bitmap comment: Check listing: --- .foo  2015-08-12
>> 12:14:03.475222428 +0530
>> +++ comment.t.list12 2015-06-25 14:49:08.000000000 +0530
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
> According to the diff, none of the entries with 5s timeout value timed
> out. Than may mean simply that the sleep/listing was faster than
> anticipated.
>
> Please change the timeout value to 4 (s) in line 42 in comment.t and
> re-run the test. Does it run successfully?
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
