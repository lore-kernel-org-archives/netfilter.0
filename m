From: Klaubert Herr da Silveira <klaubert@gmail.com>
Subject: Re: Are limit and hashlimit "limited"?
Date: Tue, 15 May 2012 15:20:30 -0300
Message-ID: <CAFoCuZpVitm3jThLzi_EtoseF=jPJBJWD7Ntv6_j=FPpFZKfMA@mail.gmail.com>
References: <CAFoCuZqY+-i89kDSoOM08WdsnGzX86huHauNrOTjCPsEgXeNGg@mail.gmail.com>
 <FAE1FE7B-97F2-44A8-8033-05F7B39E72DF@gmail.com> <alpine.LNX.2.01.1205150333380.25932@frira.vanv.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=EdbFMSjCWyiYD7snLSj7VNhk8Y8K5KQqmRNI59dJSuE=;
        b=L/pnfM4wuH/xJwsFmw5NjRARplchdHua9AqRASE3rZmh8O17tVlQ+Zil9VDuJubJ3G
         Meil2N98LPvJgge4+525ujPNyNqLMj18ihm1S9xzhuvOKyWQZxZEEvl57R7iCtHdU+Dg
         5eAPVE4yrkgqDX4u1qqo1s1c4jq0BncO517wPA+x6Qy9WN8vVeksBwUmv1CUcA+m1Jco
         CdMxLNN+kQgGc/2/+FGGfoLcWnczBMGV1Yj2MDbC8BBS1IpnT9fuEKR4kzQYtf6GpRaN
         lBG39Chv3RfdEQvI2FhGhKPVya5aLSgqKJ4bOmayvNhVOMADrMXzWfcjcO2MnBxnhNOv
         BW2Q==
In-Reply-To: <alpine.LNX.2.01.1205150333380.25932@frira.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@inai.de>
Cc: Payam Chychi <pchychi@gmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

So,

I have learned alot in this topic, thank to all that answered. And if
I understand correctly, beside the error in overflow handling
mentioned in the Nicolas's paper, we only get a high accuracy with
limit or hashlimit if HZ be very high, to avoid the colision on
concurrent packets arriving in the same slice of 10ms, 4ms or 1ms, but
changing the HZ can be some side effects.

So, can be useful to submit the Nicolas's patch again :)

In this meantime, I'll try rateest and find out how it can fit my needs.

Thanks,

Klaubert

On Mon, May 14, 2012 at 10:34 PM, Jan Engelhardt <jengelh@inai.de> wrote:
> On Tuesday 2012-05-15 00:45, Payam Chychi wrote:
>
>>> I'm playing with match modules limit and hashlimit, and they appear to
>>> be limited to match a maximun 100/sec. If I use hashlimit with no
>>> "--hashlimit-mode" I get the same, a max of 100/sec, even if I set for
>>> exemple to 250/sec. My command setting the 250/sec is accepted, with
>>> no error, but test show only 100 match/sec.
>>>
>>> Is this a hard limit of this modules, or I can go above this in some way?
>>
>>limit and hashlimit have never worked properly
>
> Best is to collect packets using -j RATEEST and then matching
> against it with -m rateest.
