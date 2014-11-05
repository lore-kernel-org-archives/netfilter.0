From: Ricardo Klein <klein.rfk@gmail.com>
Subject: Re: Linux Firewall Active/Active
Date: Wed, 5 Nov 2014 18:06:49 -0200
Message-ID: <CADuigkX6Z6p60T7+=A7BwvadnqQpOZF_qvTQr-89jVEp3D-2nw@mail.gmail.com>
References: <CADuigkVbB2nt5P6y-JCaW_bh6v_GhjL9BRBiHRyvA_yH81v4RA@mail.gmail.com>
	<4128127.KGiVEnbFtn@nb003>
	<CADuigkUu8wRJa-CqRNczJ009PPeDbnsu4jAarx2GuvwJygenPQ@mail.gmail.com>
	<3816734.MmmqxbeP6W@nb003>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=bsG24wW3F49Ac/cil4TeZn/2DfLMA3M8zkb5Ims4Zws=;
        b=AJ8r8jPwjUiPl+OOWbif1dibzSX0DKn6T9UzoozGnY85qQsjSWbcvt/buFVRioZBBa
         uo1w4Liq37T1SY0Bip0YTJBt1wTEHN/cjXe69Bf3GZD0HLYmvfrORHFmO9o/KHb8TXtw
         UT25F3xt7J+EYO0dCCH/sgDXbHhKe2ebB0QPGsxf1wVN5V/6RM4hemc4am2r18lRS7e1
         UBWJYubYr4T1HSJ2uzyFCW0I/zaBnbMobdi2V/hssBSkQnoA62to+YI8diOnZdYe1Tb2
         +dDQ83crwruKWu0qeKFoBmBC5CAmD/Hef0/ogf8wxTF8WkzXgjI+sx6KMBztb4KP5/wY
         mEag==
In-Reply-To: <3816734.MmmqxbeP6W@nb003>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: ms@sys4.de
Cc: netfilter <netfilter@vger.kernel.org>

Michael,

yes, I have layer2 between locations...
And, yes, I want to keep it simple, but, need to prove that
active/active is not a good way to go to my manager

--
Att...

Ricardo Felipe Klein
klein.rfk@gmail.com


On Wed, Nov 5, 2014 at 5:57 PM, Michael Schwartzkopff <ms@sys4.de> wrot=
e:
> Am Mittwoch, 5. November 2014, 17:50:05 schrieb Ricardo Klein:
>> Michael,
>>
>> thanks for your repply, I forgot to mention that each one are in
>> different places, so I wanted to set each local network to use the
>> nearest firewall. And yes, I will have a hardware that can handle th=
e
>> whole network.
>
> Do you have a layer 2 connection between both locations? Or do you do=
 some
> dynamic routing changes in the case of a failover?
>
>> But, why not active/active?  (sorry for the silly question, if you c=
an
>> just point me to any good source I can read about, its ok, no need t=
o
>> waste your time with this)
>
> Source: Common sense.
>
> A load-balancing firewall makes things complicated. Keep it simple, s=
o it will
> work reliable.
>
>
> Mit freundlichen Gr=C3=BC=C3=9Fen,
>
> Michael Schwartzkopff
>
> --
> [*] sys4 AG
>
> http://sys4.de, +49 (89) 30 90 46 64, +49 (162) 165 0044
> Franziskanerstra=C3=9Fe 15, 81669 M=C3=BCnchen
>
> Sitz der Gesellschaft: M=C3=BCnchen, Amtsgericht M=C3=BCnchen: HRB 19=
9263
> Vorstand: Patrick Ben Koetter, Marc Schiffbauer
> Aufsichtsratsvorsitzender: Florian Kirstein
