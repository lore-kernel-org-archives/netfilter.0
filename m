From: Alessandro Fachin <alessandro.fachin@gmail.com>
Subject: Re: iptables vlan and 802.1p marking is possible?
Date: Thu, 8 Apr 2010 14:24:25 +0200
Message-ID: <o2s624cd18a1004080524o3dcb5032ga15ed1c6afbbfe0@mail.gmail.com>
References: <j2j624cd18a1004080256ic9aca654k14babd170dcfce40@mail.gmail.com>
	 <v2y624cd18a1004080330z1d60613dv7050c31ab573b42e@mail.gmail.com>
	 <1270727889.29223.5.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=2c8VUeOzB71T33h7GqjOnaW94bD1EIKQY9Vu7J26U0M=;
        b=m/lfeZIfmMHPtrEWK/BNvQtsTu8GgmPoJlJdOSuudm9HsNMYF7x1kHKroMHbYI5QJJ
         DgH+3zXyyqI5lDzAroPhXJvWO1AnUb/ljF6bqdgn6GJy/obXXlkRoYqY/OglxQ7ovshI
         EJ8jcg5aEBaGjX5nZdISUW/+fGPSFegamjxLw=
In-Reply-To: <1270727889.29223.5.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?0J/QvtC60L7RgtC40LvQtdC90LrQviDQmtC+0YHRgtC40Lo=?= <casper@meteor.dp.ua>
Cc: netfilter@vger.kernel.org

Thanks for reply!

2010/4/8 =D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=
=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D0=BA <casper@meteor.dp.ua>:
> =D0=92 =D0=A7=D1=82=D0=B2, 08/04/2010 =D0=B2 12:30 +0200, Alessandro =
=46achin =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Hi,
>> is it possibile marking =C2=A0with iptables the traffic coming from =
tagged
>> port (802.1Q vlan)
>> that is using PCP, the 3-bit field which refers to the IEEE 802.1p p=
riority?
>
> It seems you can mark vlan packet with ebtables using protocol 802_1Q
> and --vlan-id, --vlan-prio matches, see man ebtables.
>

I exactly found what I'm looking for "--vlan-prio". Thanks.

> Then you might want to use those marks from iptables or directly from
> tc.
>
>> I'm trying to do this for keep the correct priority until traffic ar=
riveto tc.
>> Thanks for reply.
>> Regards.
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.h=
tml
> --
> =D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=
=9A=D0=BE=D1=81=D1=82=D0=B8=D0=BA <casper@meteor.dp.ua>
>
>
