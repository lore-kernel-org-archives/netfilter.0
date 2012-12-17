From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: UDP fragments , legitimate ?
Date: Mon, 17 Dec 2012 23:27:07 +0200
Message-ID: <50CF8E2B.9040909@ngtech.co.il>
References: <CAJygYd1+1W7HqokAwgD2hi+ixeor+Eesz6BetbB-cScgsmd7NQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJygYd1+1W7HqokAwgD2hi+ixeor+Eesz6BetbB-cScgsmd7NQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?5Y+26Zuo6aOe?= <sunyucong@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

The basic answer for that is your network usage\users.
A UDP application shouldn't care about MTU since the data Is suppose to=
=20
get from one end to the other.

Also notice that MTU size is not a must since there are also=20
Jumbo-frames which are big and many OS can fragment a packet from 1500=20
to 400 so this is not really something you can rely on.

If you have specific applications running in your environment you will=20
have no problem testing it.

Eliezer

On 12/14/2012 10:06 PM, =E5=8F=B6=E9=9B=A8=E9=A3=9E wrote:
> This is more like a general networking question
>
> Is there legitimate use of UDP fragments in the wild? have you seen
> commonly used application sending/receving UDP packets that is large
> than MTU ? Is it safe to assume such traffic is nothing but dumb
> attacks?
>
> Thanks.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

