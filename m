From: Ricardo Klein <klein.rfk@gmail.com>
Subject: Re: Ipset kernel panic
Date: Thu, 18 Oct 2012 08:42:29 -0300
Message-ID: <CADuigkXm99qcdm-GcaLSQQt0vreK7WxTs4AXv6sZKH+jxe4hDQ@mail.gmail.com>
References: <CADuigkXeFM+N89kwzr8pUPKN5A-qccK5-4juYmutYCcq8XHC4g@mail.gmail.com>
	<alpine.DEB.2.00.1210150927390.4945@blackhole.kfki.hu>
	<CADuigkW5n0vxVm3eKykw-pV7WH6xe7YP0cAEQcS5EF5BnNaTkw@mail.gmail.com>
	<CADuigkWtZzuWRavME_YOx5wfn+dtge=iuXF+HhO540J--D8a7A@mail.gmail.com>
	<alpine.DEB.2.00.1210180929340.2232@blackhole.kfki.hu>
	<CADuigkVCEYuLdMA=Qgtphr81YnPZROyx5p-fy8imoUnPCViU3g@mail.gmail.com>
	<alpine.DEB.2.00.1210181330540.2232@blackhole.kfki.hu>
	<CADuigkVxYZHd==J97_g1ABCE=ExVfKRNabAqzuZhNjV0XCcLnQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=woxOBq/hlFWKS9Du3Jc/ML7V2QTmp9DildluNGbZDfU=;
        b=JhEQaUXqQm3l+E9jTCtxC59wr4lJTwGy743uSm/jttfKY12Kf41heGgYJG3W7yAQRR
         id2sDjzIXjv6OgW41+2Cckdn1H7yTb6rqkQ+4T9J6IrX7X366smB75Na61ocVp7WdjHK
         eQCmqezC5wZN4RGP/8VUxs7fj1ESCqJ8TRkKOa50bFoOzttRIYwglHoIEeTycZjCqXH/
         lTTk8LaZTVY+d9kBTiCF3oa8oL00Uj/ZwheGOAxY+gyHcnU3A2eAixMH5AxJwjqtUx7W
         dHa0pmQbgYzhrYE8sNouwPrNiybZV0/Jdw8xBncThJ9CV7MjVNe2kH5HsCZEzeScc014
         /ZYQ==
In-Reply-To: <CADuigkVxYZHd==J97_g1ABCE=ExVfKRNabAqzuZhNjV0XCcLnQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

How can I check the kernel module version?
ipset -version  returns only binary ipset version right?

--
Att...

Ricardo Felipe Klein
klein.rfk@gmail.com


On Thu, Oct 18, 2012 at 8:38 AM, Ricardo Klein <klein.rfk@gmail.com> wrote:
> hummm.. maybe only the binary not the kernel module itself, that
> should be compiled with the kernel right?
>
> --
> Att...
>
> Ricardo Felipe Klein
> klein.rfk@gmail.com
>
>
> On Thu, Oct 18, 2012 at 8:31 AM, Jozsef Kadlecsik
> <kadlec@blackhole.kfki.hu> wrote:
>> On Thu, 18 Oct 2012, Ricardo Klein wrote:
>>
>>> no, I have "rpm -e ipset" and then compiled the new one...
>>
>> Does it remove the kernel modules as well, or just the ipset binary?
>>
>>> But I will try to see if the old one still there...
>>
>> Best regards,
>> Jozsef
>> -
>> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
>> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
>> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>>           H-1525 Budapest 114, POB. 49, Hungary
