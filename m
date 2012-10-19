From: Ricardo Klein <klein.rfk@gmail.com>
Subject: Re: Ipset kernel panic
Date: Fri, 19 Oct 2012 08:20:29 -0300
Message-ID: <CADuigkWVW3Lyij-goXypXAD4SrXEi3-YdKrjAL1kXxnz=1qJwA@mail.gmail.com>
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
	<CADuigkUPiUJMEooH7xbngxV_COWTDWpz+QnszPp_7AP4Pmopeg@mail.gmail.com>
	<alpine.DEB.2.00.1210181439560.2232@blackhole.kfki.hu>
	<CADuigkXgXLkoivronrBwuYSQo+faQG9Xx=F8=G33hss7s5Tfgg@mail.gmail.com>
	<CADuigkU+S9-9SjT6=VFYr93NAdk42Yrw7PyfgSkhgg_hZKakBQ@mail.gmail.com>
	<alpine.DEB.2.00.1210191028520.5049@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=SKrfjQgFYBlf9elT1QMQekmSauguI03cmFbizok7qE4=;
        b=b91132RO2fF8ZAqtZ41fn3gZzC9KRquN8vg79xs/M81GKoWvDqz0kObQQ42aWwkhhQ
         YZDHXA5/fDEwufCMU5E869JWMMU3/kEQ3b9RWdS/i5d0wqK8yUlIDrrMI/NLKCv00HZz
         MMl/072e1wAt+UXVDQb8YOJ9wwlE5OrPQEkedBJQxUvYLNmgLtYp6mmwZFrQ5MATpZXo
         cinjSN3boJ/A7AjgbjMPmKTr3BTWP7w0ooJqfuH8TGefmaHjh8ja6mhR/S9S32sExY4s
         Gb4KPvtH6HK+WNuJi5zB3kdLli196RCF4M9jDQsVKPsAerZJ9Bnlk5G1Jsmg0+h/+RJR
         t6+g==
In-Reply-To: <alpine.DEB.2.00.1210191028520.5049@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

so are you a ipsec developer?
If you need help to test something, I can help you.

--
Att...

Ricardo Felipe Klein
klein.rfk@gmail.com


On Fri, Oct 19, 2012 at 5:33 AM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Fri, 19 Oct 2012, Ricardo Klein wrote:
>
>> I am sorry, dont know what I am doing wrong, follow the steps on README but,
>> still get compile errors...
>> Se attached log file.
>>
>> And, I think the problem is this old kernel
>> version(2.6.32-279.11.1.el6.x86_64), as the README says, I think I really
>> will need to recompile the kernel if want this working:
>> 0. You need the source tree of your kernel (version >= 2.6.34)
>>    and it have to be configured with ip6tables support enabled,
>>    modules compiled. For kernel versions < 2.6.39 please apply
>>    the netlink.patch against your kernel tree, which adds the
>>    new subsystem identifier for ipset.
>>
>> right? Or can I apply in some way apply the patch only to the kernel
>> source files to compile ipset? (have no experience in kernel modules
>> compilation)
>
> Sigh, "struct xt_action_param" was introduced in 2.6.35... I have to
> re-check what'd be needed to support kernels versions between 2.6.39 and
> 2.6.34.
>
>> I'm starting to think that ipset is a great tool, but, not for rhel/CentOS
>> yet (well, my loved Slackware should work like a charm, but, client whants
>> CentOS/RHEL)
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
