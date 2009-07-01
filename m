From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: arptables ruleset not working when compiling on  fedora6,7,8/centos
 5/redhat 5
Date: Wed, 1 Jul 2009 13:09:59 +0200 (CEST)
Message-ID: <alpine.LSU.2.00.0907011302390.3504@fbirervta.pbzchgretzou.qr>
References: <b2d58cb80906290712k33c1ebbvfc8e661cb34c502c@mail.gmail.com>  <56378e320906290721i63f969edm90aed19619decf71@mail.gmail.com>  <b2d58cb80906290751j7fb3976bx9d04fed852c8b451@mail.gmail.com>  <4A48D6AD.4010005@trash.net> 
 <b2d58cb80906290818t66616f70k2fe7596b906a8a4e@mail.gmail.com>  <4A48E14A.3060708@trash.net>  <b2d58cb80906290918q2da5af1ap87772755b3363032@mail.gmail.com> <b2d58cb80906300108q2ee5a060gf8013a88560d8820@mail.gmail.com> <4A4B32C4.8050800@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <4A4B32C4.8050800@trash.net>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Patrick McHardy <kaber@trash.net>
Cc: Nishit Shah <nsshah.82@gmail.com>, Richard Horton <arimus.uk@googlemail.com>, Netfilter Developer Mailing List <netfilter-devel@vger.kernel.org>, netfilter@vger.kernel.org, Bart De Schuymer <bdschuym@pandora.be>, Jay Fenlason <fenlason@redhat.com>, mt@suse.de, jskala@redhat.com


On Wednesday 2009-07-01 11:56, Patrick McHardy wrote:
> Nishit Shah wrote:
>> On Mon, Jun 29, 2009 at 9:48 PM, Nishit Shah<nsshah.82@gmail.com> wr=
ote:
>>>
>>> -/usr/include/linux/netfilter.h:#define NF_MAX_VERDICT NF_REPEAT
>>> +/usr/include/linux/netfilter.h:#define NF_MAX_VERDICT NF_STOP
>>>
>>
>> I am adding the patch for the same.
>
> Please send this to Bart (CCed), who is maintaining arptables.

There is also a rogue arptables_jf clone by some RedHat person=C2=A0=E2=
=80=94
no homepage, no point of download except distro .src.rpms=C2=A0=E2=80=94
and used by Fedora and openSUSE.

Ccing the relevant persons responsible for that clone, which I am also=20
hereby accusing of failing to submit their stuff upstream causing=20
unnecessary extra hurdles for users.
--
To unsubscribe from this list: send the line "unsubscribe netfilter-dev=
el" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
