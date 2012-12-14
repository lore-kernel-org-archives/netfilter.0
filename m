From: Brad Silva <bsilva@sonic.net>
Subject: Re: UDP fragments , legitimate ?
Date: Fri, 14 Dec 2012 13:00:55 -0800
Message-ID: <CAMfETGDNi9RP3tkDCkK7csup94BKeRLZDRotN9OHG_rq5M3_ZA@mail.gmail.com>
References: <CAJygYd1+1W7HqokAwgD2hi+ixeor+Eesz6BetbB-cScgsmd7NQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJygYd1+1W7HqokAwgD2hi+ixeor+Eesz6BetbB-cScgsmd7NQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?5Y+26Zuo6aOe?= <sunyucong@gmail.com>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

I know that NFS over UDP commonly sends packets that are much larger
than the MTU (as much as 32KB per).

However, it's very unlikely that you would see NFS outside your
firewall.  Also, most NFS these days is over TCP.

Brad

On Fri, Dec 14, 2012 at 12:06 PM, =E5=8F=B6=E9=9B=A8=E9=A3=9E <sunyucon=
g@gmail.com> wrote:
>
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
