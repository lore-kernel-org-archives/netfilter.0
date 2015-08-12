From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: unknown option "--map-set"
Date: Wed, 12 Aug 2015 15:15:41 +0530
Message-ID: <CAA5aLPiTGP+3-q-Hanb6RKSFfw==g55DcjFtTCLUT4ee4tTA8g@mail.gmail.com>
References: <CAA5aLPg=UhPp0wODZc8qtx3FwnReM+3Qs4zFm9_8Fgap8LMvtg@mail.gmail.com>
	<CAA5aLPiHDNwK_mxiaTVYYCmZpkr1wyyjbMCa4CmQDhPrVVv3Yg@mail.gmail.com>
	<alpine.DEB.2.10.1508121126170.15443@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=h45igLd35vWtx5CrFQ+9AFziXQDKE5j1GdXxvuZU5gU=;
        b=lIfjstgnVkX6vI5tPJUcR88ns+yHm20fU7cKU9bzh82XnzArCSoeCmpx/9SbCoXslZ
         fxeqi/8u3bnE85uve+rTvMgQb14zQNaOfA0vz4R7rYcQIE9S7O1oaekMAQXMZcGdMdwC
         uUJVgcA4EHpEkGfkjfeuZtoLOtymlkwyNXvh1T+yj8PmHJdyxPkteJDJZjRSRFhD+SdF
         iaqKSB6k2Pxl8vQAxFFm7sYrAqEQs/dnZ65wUD+aOlPROYZADhAjjmLzVN3mdeEjGgyu
         R+Gt0QxkLFEXY6K9dylnZXY7kmKj8NX6dUKSWnS6JEdVIMBx5kzssSa+IB8U6MvjCWQL
         CxzA==
In-Reply-To: <alpine.DEB.2.10.1508121126170.15443@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

fine.

Thanks for the reply.

On Wed, Aug 12, 2015 at 2:59 PM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Wed, 12 Aug 2015, Akshat Kakkar wrote:
>
>> Well, it looks that the Sep 16 Snapshot didnt have the code for
>> map-set option. But thats strange as the code was committed on Sep 14,
>> so it should have been there.
>>
>> Am I missing some very basic thing over here?
>
> The date of the commit is when it was committed in my iptables tree. Then
> it was pulled to Pablo's tree and then the iptables snapshot created. So
> the snapshot at Sep 16 was released earlier than Pablo pulled the changes
> from my tree (which was committed there at Sep 14).
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
