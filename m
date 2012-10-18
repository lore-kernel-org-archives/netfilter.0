From: Ricardo Klein <klein.rfk@gmail.com>
Subject: Re: Ipset kernel panic
Date: Thu, 18 Oct 2012 09:39:29 -0300
Message-ID: <CADuigkUPiUJMEooH7xbngxV_COWTDWpz+QnszPp_7AP4Pmopeg@mail.gmail.com>
References: <CADuigkXeFM+N89kwzr8pUPKN5A-qccK5-4juYmutYCcq8XHC4g@mail.gmail.com>
	<alpine.DEB.2.00.1210150927390.4945@blackhole.kfki.hu>
	<CADuigkW5n0vxVm3eKykw-pV7WH6xe7YP0cAEQcS5EF5BnNaTkw@mail.gmail.com>
	<CADuigkWtZzuWRavME_YOx5wfn+dtge=iuXF+HhO540J--D8a7A@mail.gmail.com>
	<alpine.DEB.2.00.1210180929340.2232@blackhole.kfki.hu>
	<CADuigkVCEYuLdMA=Qgtphr81YnPZROyx5p-fy8imoUnPCViU3g@mail.gmail.com>
	<alpine.DEB.2.00.1210181330540.2232@blackhole.kfki.hu>
	<CADuigkVxYZHd==J97_g1ABCE=ExVfKRNabAqzuZhNjV0XCcLnQ@mail.gmail.com>
	<CADuigkXm99qcdm-GcaLSQQt0vreK7WxTs4AXv6sZKH+jxe4hDQ@mail.gmail.com>
	<alpine.DEB.2.00.1210181425120.2232@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=RcOWWrPwHLrBpD6d7nK1P6rG/3eovlkMaTaDw27ni0o=;
        b=WjTexbpPpCRFZB6sqwVI7mcUVzwMGi81SPmUQUlU6IyePLk+Ld9PxRV3qayKWNt+oI
         /zBYn66IzwGaD1LyLvyFDCNtlceNfYBHER+e1A0LGEdFb2rNGjaVyBo/1m3Mp5i4/3Ef
         JT1SMSRHcvuyOJrzriNjlwOamxljCQsc2Itl/y++wgGJQRn0gp9cew17QGjJ/dT09SiI
         mMNhyTEAk2/NLHptgXRlfTo1eP8uRB5Dxj8Q8HmxKNgIJBGA44kfsOpom0c0nzSUU4pR
         k147X24CACGbhYzUROqYr6nM6K774+wgr/rUrGBqNwQW2bZu0vCThsIYIV6Y2c/SdjZQ
         N8UA==
In-Reply-To: <alpine.DEB.2.00.1210181425120.2232@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

yeah... it not shows "revision xx" so I should need to recompile all
entire kernel or can I just recompile this module?
--
Att...

Ricardo Felipe Klein
klein.rfk@gmail.com


On Thu, Oct 18, 2012 at 9:28 AM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Thu, 18 Oct 2012, Ricardo Klein wrote:
>
>> How can I check the kernel module version?
>> ipset -version  returns only binary ipset version right?
>
> Yes, exactly.
>
> What is the output of "modinfo ip_set_bitmap_ipmac"? Kernel modules before
> 6.14 do not print supported revisions, while from 6.14 the revision
> numbers are reported. If it contains
>
> ...
> description:    bitmap:ip,mac type of IP sets, revisions 0-0
> ...
>
> then you are running the modules from 6.14. Otherwise your modules are
> older and should be refreshed from 6.14.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
