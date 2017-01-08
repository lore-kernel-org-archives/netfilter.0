From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Need module help
Date: Sun, 8 Jan 2017 12:29:44 +0100
Message-ID: <3d6b0822-d484-e41e-8141-94dc128b94ba@plouf.fr.eu.org>
References: <CAH-pVi-McTaVYJjvsBLbnSVk+wW2biD+0U8byK3exrFHfig1Hg@mail.gmail.com>
 <72f2e366-c823-40a6-17d6-330e803bc52e@plouf.fr.eu.org>
 <CAH-pVi-94=nY8zZJDQE_Kfq=01t9snXnBk-Rw3C8sbhsAM6i-w@mail.gmail.com>
 <20170108035307.GH8339@harrier.slackbuilds.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20170108035307.GH8339@harrier.slackbuilds.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Le 08/01/2017 =E0 04:53, /dev/rob0 a =E9crit :
> [ top-posting fixed ]

Thanks for this.

>> On Sat, Jan 7, 2017 at 3:33 PM, Pascal Hambourg
>> <pascal@plouf.fr.eu.org> wrote:
>>> Le 07/01/2017 =E0 18:54, DOHC F22 a =E9crit :
>>>>
>>>> Does someone know where I can find a ToS module that works
>>>> with kernel 3.10.61+ and iptables 1.4.20?
>>>
>>> xt_dscp
>>> xt_DSCP
>
> On Sat, Jan 07, 2017 at 09:39:33PM -0600, DOHC F22 wrote:
>> Are those two different modules?
>
> Yes.  Names in lowercase are match extensions, in this case, see:
>     iptables -m dscp -h
>
> UPPERCASE names indicate target extensions, so see this:
>     iptables -j DSCP -h

Note that these modules also support the older tos match and TOS target=20
extensions respectively.
