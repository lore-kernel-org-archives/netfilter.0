From: Oskar Berggren <oskar.berggren@gmail.com>
Subject: Re: Fwd: ipset 6.24 and iptables 1.4.14, errno 22 (EINVAL)
Date: Tue, 16 Dec 2014 16:36:21 +0100
Message-ID: <CAHOuc7NJtFbCZNtU9MJWSBvTipcFMt8Ms_yVCFetdJxrX+4bdQ@mail.gmail.com>
References: <CAHOuc7PVsLGVjOZSMNQfSmhfcd_tKfoD58mjbrQ89BtJN8M19g@mail.gmail.com>
 <CAHOuc7MEuNd85gv_L0LCdY7cKd=7Je6-a+rUh_dz7D2haEW9KA@mail.gmail.com> <alpine.DEB.2.10.1412161626180.7016@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=2l4f+mnfraK8Df75tkN5EN1GyXro3oBFXbQaxUNuPAU=;
        b=mvVYCHj5uzJhM8iPNy7RUoIcdiszpPC4Mw1AsNMCU5l95mZZqacya9f9EaWWj84qB7
         BlUMO2hGIi6rK8Cafgz+0x3Bemh+sLZQaDADhJdKqMyK5Q7PYGlsiKON1HpY1oa1Rwvf
         z4J6BQn98YNs1zg5h4kCRyYFqreX2OLqgXQZWFrA9Y3tfuRq8CsGPRIFK12j8gQUvfTp
         rWmZb4FDj9EFmh54UrHJeUHRXsLpwGSzbb0Llb1R/EKnKNR/eR09JkGYBoRjbtyXQzcb
         yVFR82G2lVTNNdoz4ddRWU8Fp2AIcCCBjbop+BJeg6skYQh6xHu1Dt5wVt7Ej0TgMEun
         hhnA==
In-Reply-To: <alpine.DEB.2.10.1412161626180.7016@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter <netfilter@vger.kernel.org>

It's Debian 7, but with kernel from backports. uname:
3.16.0-0.bpo.4-amd64   3.16.7-ckt2-1~bpo70+1

The iptables 1.4.14 is from Debian, but we've rebuild it to increase
the maximum set name length to 256. But we also build ipset kernel and
userspace tools with this change. These patches have worked with ipset
6.11, iptables 1.4.13 on Debian 6, but perhaps they might be the
problem if the versions themselves should be compatible.


/Oskar


2014-12-16 16:27 GMT+01:00 Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>:
> On Tue, 16 Dec 2014, Oskar Berggren wrote:
>
>> When using iptables and the set match we receive:
>>
>> iptables v1.4.14: Problem when communicating with ipset, errno=22.
>>
>> We are, quite accidentally, using ipset 6.24 (kernel and userspace),
>> with iptables (including its libxt_set userspace module) 1.4.14. Might
>> the problem be incompatibilities between these versions, since they
>> are quite far apart?
>>
>> The ipset command itself works, and we can define the sets in the kernel.
>
> This is quite strange, because that error message is generated when the
> most basic communication fails between the iptables extension and the
> ipset kernel module.
>
> What is your kernel version and architecture?
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
