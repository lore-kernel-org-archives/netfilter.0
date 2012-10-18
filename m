From: Ricardo Klein <klein.rfk@gmail.com>
Subject: Re: Ipset kernel panic
Date: Thu, 18 Oct 2012 08:38:47 -0300
Message-ID: <CADuigkVxYZHd==J97_g1ABCE=ExVfKRNabAqzuZhNjV0XCcLnQ@mail.gmail.com>
References: <CADuigkXeFM+N89kwzr8pUPKN5A-qccK5-4juYmutYCcq8XHC4g@mail.gmail.com>
	<alpine.DEB.2.00.1210150927390.4945@blackhole.kfki.hu>
	<CADuigkW5n0vxVm3eKykw-pV7WH6xe7YP0cAEQcS5EF5BnNaTkw@mail.gmail.com>
	<CADuigkWtZzuWRavME_YOx5wfn+dtge=iuXF+HhO540J--D8a7A@mail.gmail.com>
	<alpine.DEB.2.00.1210180929340.2232@blackhole.kfki.hu>
	<CADuigkVCEYuLdMA=Qgtphr81YnPZROyx5p-fy8imoUnPCViU3g@mail.gmail.com>
	<alpine.DEB.2.00.1210181330540.2232@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=6dTmk+ZUOuqr1OmmU1ExQJZ7LSc/k/421os3EZfJlH0=;
        b=MWUztEbquhpaNgXZJb8Numnd/H2gIwG1cmB9SmNazXTuXd9ovYZBfAiA8WgshK7kz4
         p77c1d4M081YJyS2L9f18yGKBKa1pRS3qT9zCVRcHb3smkRTejSncGTAY6L3Vah8STtG
         TMqpNs/+n8O59foceSM+QPudRYYHN1spcrdcuNf0D+Eaf60ezA9MuQ5stX6WAScG3ltt
         neTnF/GK1Kvvu1kmhYY2hFZYl7spaHTBkvhI5W2FbKqRW9RSXRGj6Qzhao7Ld3gRsq4K
         Eq6FkJpgXk99+RPup4DhN9ZUb+auhSWsdYga7Ol9YngXMTAebvrD7irV1w+Cu9iRTRNE
         1waQ==
In-Reply-To: <alpine.DEB.2.00.1210181330540.2232@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

hummm.. maybe only the binary not the kernel module itself, that
should be compiled with the kernel right?

--
Att...

Ricardo Felipe Klein
klein.rfk@gmail.com


On Thu, Oct 18, 2012 at 8:31 AM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Thu, 18 Oct 2012, Ricardo Klein wrote:
>
>> no, I have "rpm -e ipset" and then compiled the new one...
>
> Does it remove the kernel modules as well, or just the ipset binary?
>
>> But I will try to see if the old one still there...
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
