From: Ricardo Klein <klein.rfk@gmail.com>
Subject: Re: Ipset kernel panic
Date: Thu, 18 Oct 2012 08:05:20 -0300
Message-ID: <CADuigkVCEYuLdMA=Qgtphr81YnPZROyx5p-fy8imoUnPCViU3g@mail.gmail.com>
References: <CADuigkXeFM+N89kwzr8pUPKN5A-qccK5-4juYmutYCcq8XHC4g@mail.gmail.com>
	<alpine.DEB.2.00.1210150927390.4945@blackhole.kfki.hu>
	<CADuigkW5n0vxVm3eKykw-pV7WH6xe7YP0cAEQcS5EF5BnNaTkw@mail.gmail.com>
	<CADuigkWtZzuWRavME_YOx5wfn+dtge=iuXF+HhO540J--D8a7A@mail.gmail.com>
	<alpine.DEB.2.00.1210180929340.2232@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=CrvuURByLanjFI/WKxk864CkFBvOLsM4zDNxopuVl8A=;
        b=DDPQ8p0LZoWc8XkQ2QzKlkmtcCObFRgQ4JqDYWdYcW9YKZcgmgug7dvZ+lF8NBRcmW
         EySgLyAfDKN3/pAqig0ncQaWPcMktrcldV7G+CGXBsO6s5zG86/AiwSX5WbT9EsDfWRE
         1p7BxwJ3+91C6Iytc+3GdfCCmfpdik/pBhJlLIYDLRP66byxmxWbJIOsD6N5qn7FcPpS
         G0Fv3qMgkDKVAWjFM27Vx0Y09xKMzw2K8JDOnZBxLxW7KgR5S+tNcJMgjvUdvGYY7K4f
         6h6sbanqq+i5QLhv4aMJSv5kvgOT1L5DrBDEbUokgnkB3KCJkN0OwhQKnw0ztiR7/oY/
         xYzA==
In-Reply-To: <alpine.DEB.2.00.1210180929340.2232@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

no, I have "rpm -e ipset" and then compiled the new one...
But I will try to see if the old one still there...

--
Att...

Ricardo Felipe Klein
klein.rfk@gmail.com


On Thu, Oct 18, 2012 at 4:34 AM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Wed, 17 Oct 2012, Ricardo Klein wrote:
>
>> it still explode with kernel panic when I try:
>> [root@fwbalance bin]# ipset create allowed_macs bitmap:ip,mac range
>> 0.0.0.0/0
>>
>> CentOS 6.3 64bits
>> ipset 6.14 (compiled right now only with --prefix=/usr --libdir=/usr/lib64)
>
> You did not install the kernel modules from the ipset-6.14 package and
> still run the ones from your system.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
