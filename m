From: Cong Wang <xiyou.wangcong@gmail.com>
Subject: Re: [Patch net-next] netfilter: remove xt_NOTRACK
Date: Mon, 3 Sep 2012 15:57:53 +0800
Message-ID: <CAM_iQpU2GPgHP1BVfL_JL6dadjHeiU08en+UpAicjmH3H0QX5Q@mail.gmail.com>
References: <1345962219-2999-1-git-send-email-amwang@redhat.com>
	<CAHo-Ooz0SDBZTvBKRR-bZs0wHk25bSLaYgUYF0njUgxY8iGWpA@mail.gmail.com>
	<alpine.LNX.2.01.1208262201520.32152@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=os6a4DgwgFV5dsPID8X7i/8RvnpgdmCrKFAz2gx0CnE=;
        b=EFTYFwFqALbtr2rRqqFp8gPJqzyq9iWZw9m/yAim207+MccLLmdmv/X+MeizqrVIl9
         cNtFb2Cna0NdoMXDL9Ue87lOr4o4u+1jyzMBsh5iIrJD38nVZJ4aL3hUjaXaZBI3ZgmM
         GS7IfXccU4u/6KtLsn90h3s8r5kpKuNcx6PBFObFOc9K2CvidM0H7R1Zls4WVmqnIgEH
         x98hX+LT14GaU1ZVVNrpfoOpUNmCzkFKOgZmjI70QG/m2ipt+lLdj5v1ws+lLiLUqvcD
         E6BU/kQqsfT+NlqRFyKm79O6pw1gq11ZUhOpkNXnCKMR6S8s2Qlp10fVTaeknwR5ZaAK
         dewg==
In-Reply-To: <alpine.LNX.2.01.1208262201520.32152@frira.zrqbmnf.qr>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@inai.de>
Cc: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>, Cong Wang <amwang@redhat.com>, netfilter-devel@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>, Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, netfilter@vger.kernel.org

On Mon, Aug 27, 2012 at 4:04 AM, Jan Engelhardt <jengelh@inai.de> wrote=
:
> On Sunday 2012-08-26 12:42, Maciej =C5=BBenczykowski wrote:
>
>>Sounds like the old -t raw ... -j NOTRACK is replaced by -t raw ... -=
j
>>CT --notrack.
>>Will -j NOTRACK continue to work?  Could it be added as an alias to C=
T?
>
> No, and, dunno. There are currently no provisions for aliasing in the
> userspace side.

So no objections from you, right? :)
--
To unsubscribe from this list: send the line "unsubscribe netfilter-dev=
el" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
