From: DOHC F22 <dohcf22@gmail.com>
Subject: Re: Need module help
Date: Wed, 18 Jan 2017 17:20:45 -0600
Message-ID: <CAH-pVi8wzt7WW5P0s=tNxDk7kFYqqKkmseZ1Lae31oOO6YARww@mail.gmail.com>
References: <CAH-pVi-McTaVYJjvsBLbnSVk+wW2biD+0U8byK3exrFHfig1Hg@mail.gmail.com>
 <72f2e366-c823-40a6-17d6-330e803bc52e@plouf.fr.eu.org> <CAH-pVi-94=nY8zZJDQE_Kfq=01t9snXnBk-Rw3C8sbhsAM6i-w@mail.gmail.com>
 <20170108035307.GH8339@harrier.slackbuilds.org> <3d6b0822-d484-e41e-8141-94dc128b94ba@plouf.fr.eu.org>
 <CAH-pVi810QXjG5p_nhdpdGNcM2RWO7w9AZrE==t0-tzsyLEpLw@mail.gmail.com>
 <20170112181524.GJ8339@harrier.slackbuilds.org> <CAH-pVi838ZUeqSKZu7JiLDYjX9R2upmfKP8xH8esD9YAhVJ95g@mail.gmail.com>
 <fc5afaf8-5303-ac48-7683-64f474c57316@plouf.fr.eu.org> <CAH-pVi_jaonY80gYv3WsgTdX321syqCiH7XuFT4rqThvq7Q6EA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sKJSh9aGg1oqeLie+N0RxeZogYq4TOpJ+iyLqP3/GnI=;
        b=d76xnHiV5hDCeSS4nI6Ipo4c9eBcGP4jZOtjpZkerMhvd5+0+tUAl1LDmSHMDJpo2C
         K129izFjs053xBqkPFVgJJFaK6lGg4DVr2TAbPnvwfQI9yPmd+A3uGujQTyWbxrAzstm
         sYPmlZQxEQYzfjZ5HiiVvoFa6UXwkFWpncasQmz5/bKk69qRLwgR/QZ5KN0RG2ryNQqH
         QsZzOHeYIl+AUh+zG1D15XjwCJe8vPHqSxV9OWmJhliaEwzhnukcFb0aYOxLLDEm/6zu
         ZbMaf70WdeEwhbyi5m4CczePpPNknOhmBSzHLlLL9n4a58aB4BJVTSg/w6mdX/RL/JDE
         zyIg==
In-Reply-To: <CAH-pVi_jaonY80gYv3WsgTdX321syqCiH7XuFT4rqThvq7Q6EA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Is this list moderated where someone has to approve messages?  There
have been a couple of times when my posts are not showing up in the
list.

On Sat, Jan 14, 2017 at 10:38 AM, DOHC F22 <dohcf22@gmail.com> wrote:
> On Sat, Jan 14, 2017 at 2:56 AM, Pascal Hambourg <pascal@plouf.fr.eu.org>=
 wrote:
>> Le 14/01/2017 =C3=A0 01:27, DOHC F22 a =C3=A9crit :
>>>
>>>
>>> Ok, what I'm trying to do is mark certain packets on my Fire TV (it's
>>> running android) so when they get to my router I can filter them
>>> accordingly.  I was told that MARK wouldn't travel with the packet but
>>> ToS would.
>>
>>
>> Indeed MARK is internal to the kernel.
>>
>> So you need the TOS/DSCP target kernel module and iptables extension on =
the
>> Fire TV Android, and the tos/dscp match kernel module and iptables exten=
sion
>> on the router (what OS ?). Which ones are missing, on which side ?
>>
> I am running Tomato firmware on my router.  It has kernel version
> '2.6.36.4brcmarm' and iptables version '1.4.14'.  I think they are
> missing from both.  However, I do see a 'ipt_TOS.ko' and 'ipt_tos.ko
> modules on the router.  They may not be the correct ones, but they
> looked promising. :)
