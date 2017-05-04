From: Darshan Ghumare <darshan.ghumare@gmail.com>
Subject: Re: ulogd start script
Date: Thu, 4 May 2017 14:05:16 +0530
Message-ID: <CAOr=3U_v0wKgJN7ABFyO3cUonPDvavSqDj4Ea6xc7Zchpb+4-w@mail.gmail.com>
References: <CAOr=3U_-b4Az0MpU3RTt3_R6MMhCFbNUDTZMFQg0kVQxaBSdxA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=7qQlCEcxDhQggCglj81lxy9M0AjD8J8GlgVX3zhRZaI=;
        b=XsZxlbAhECT4aVFNae2xKVeD0CBtcClvJwyX4WvBTGYLRx+zO0PLmVJ/6k5optw6WJ
         ktvJZzQJCDzfQDKhjpBj3atNM6dOaiJnKUK44b0ZzMW7T+nAV1MCbRoXoDDY04i20m85
         skZ+8wc1DZyg8L7xh66R/YiBF06R1mwNjUX1fsBYTl/e7OuFWpYXIR164WR7VUt6weR+
         MM8grxbV2TPXvmIonCOtQ8sbSLsAxZZD83UrhxkSgE5Xr9IV16Za3tTPvIVFgZ6DGpSm
         jSzyP+7r6V8YoUJjzbxTH/Ix8DcLDp0EZ6vWx0FjMZCq39Cg0ZhS65cONCELGejpFzPm
         cAMA==
In-Reply-To: <CAOr=3U_-b4Az0MpU3RTt3_R6MMhCFbNUDTZMFQg0kVQxaBSdxA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>

When I ran `#service ulogd start` this failed because `nfnlh->fd =3D
socket(AF_NETLINK, SOCK_RAW, NETLINK_NETFILTER);` from libnfnetlink
failed with -EACCES. But `#ulogd -d` succeeded.

Please help.

Darshan Ghumare

On Mon, May 1, 2017 at 11:28 AM, Darshan Ghumare
<darshan.ghumare@gmail.com> wrote:
> Hi,
>
> When I trying to run ulogd using  init script I am getting error but
> run without it (ulogd -d) there wasn't any problem. Please help me to
> understand,
>
> service ulogd start; tailf /var/log/ulogd/ulogd.log
>
> Starting ulogd:  [  OK  ]
>
> Sun Apr 30 22:49:51 2017 <5> ulogd.c:940 building new pluginstance
> stack: 'ct2:NFCT,ip2str1:IP2STR,json1:JSON'
>
> Sun Apr 30 22:49:51 2017 <8> ulogd_inpflow_NFCT.c:1293 error opening ctne=
tlink
>
> Sun Apr 30 22:49:51 2017 <7> ulogd.c:910 error starting `ct2'
>
> Sun Apr 30 22:49:51 2017 <8> ulogd.c:1543 not even a single working plugi=
n stack
>
> ^C
>
> [root@darshan-2 ulogd]# ulogd -d
>
> [root@darshan-2 ulogd]# tailf /var/log/ulogd/ulogd.log
>
> Sun Apr 30 22:48:16 2017 <5> ulogd.c:940 building new pluginstance
> stack: 'ct2:NFCT,ip2str1:IP2STR,json1:JSON'
>
> Sun Apr 30 22:48:16 2017 <8> ulogd_inpflow_NFCT.c:1293 error opening ctne=
tlink
>
> Sun Apr 30 22:48:16 2017 <7> ulogd.c:910 error starting `ct2'
>
> Sun Apr 30 22:48:16 2017 <8> ulogd.c:1543 not even a single working plugi=
n stack
>
> Sun Apr 30 22:49:51 2017 <5> ulogd.c:940 building new pluginstance
> stack: 'ct2:NFCT,ip2str1:IP2STR,json1:JSON'
>
> Sun Apr 30 22:49:51 2017 <8> ulogd_inpflow_NFCT.c:1293 error opening ctne=
tlink
>
> Sun Apr 30 22:49:51 2017 <7> ulogd.c:910 error starting `ct2'
>
> Sun Apr 30 22:49:51 2017 <8> ulogd.c:1543 not even a single working plugi=
n stack
>
> Sun Apr 30 22:51:40 2017 <5> ulogd.c:940 building new pluginstance
> stack: 'ct2:NFCT,ip2str1:IP2STR,json1:JSON'
>
> Sun Apr 30 22:51:40 2017 <5> ulogd_inpflow_NFCT.c:1399 NFCT plugin
> working in event mode
>
>
> Thanks,
> Darshan Ghumare



--=20
Darshan=C2=AE
