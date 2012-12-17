From: Michal Kubecek <mkubecek@suse.cz>
Subject: Re: UDP fragments , legitimate ?
Date: Mon, 17 Dec 2012 11:04:16 +0100
Message-ID: <20121217100416.GA4858@lion>
References: <CAJygYd1+1W7HqokAwgD2hi+ixeor+Eesz6BetbB-cScgsmd7NQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJygYd1+1W7HqokAwgD2hi+ixeor+Eesz6BetbB-cScgsmd7NQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?5Y+26Zuo6aOe?= <sunyucong@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Fri, Dec 14, 2012 at 12:06:12PM -0800, =E5=8F=B6=E9=9B=A8=E9=A3=9E w=
rote:
>=20
> Is there legitimate use of UDP fragments in the wild? have you seen
> commonly used application sending/receving UDP packets that is large
> than MTU ? Is it safe to assume such traffic is nothing but dumb
> attacks?

About one year ago I've seen (fragmented) aproximately 3KB packets of
JXTA protocol. But I have no idea how JXTA works so I don't know whethe=
r
this size is normal or just a result of their configuration.

                                                          Michal Kubece=
k

