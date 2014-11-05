From: Ricardo Klein <klein.rfk@gmail.com>
Subject: Re: Linux Firewall Active/Active
Date: Wed, 5 Nov 2014 17:50:05 -0200
Message-ID: <CADuigkUu8wRJa-CqRNczJ009PPeDbnsu4jAarx2GuvwJygenPQ@mail.gmail.com>
References: <CADuigkVbB2nt5P6y-JCaW_bh6v_GhjL9BRBiHRyvA_yH81v4RA@mail.gmail.com>
	<4128127.KGiVEnbFtn@nb003>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=5dWUjBWRTJ6T2MoYoG7/lYDfzo5Rzc2yJjCGnigUO64=;
        b=WgfJpe0wDAlrsuOBTgXgxsl4gYDoGSkJEU/bXrBhYqJ821izYZP0vlrrYTFc6fGq77
         6Nrs0nq+Zm2iJrb8H7qB+JdljNO+Aiz7H9DFufTJ1gK4/rFDOYecQP/INrRE1lK8zuR4
         T5BrtWPrgLtFy0O8/SA6Ad+cieUqXI8EiIS9q76UvXTG2J0+eeVlsP5oQg8mT8DglsvK
         S3u6hoi+jiUG16ALNRJ/MHDm76cNYKSYn13PoasD//D/JIGjNCbHIvYDqGLfPGvfWZVY
         wNAnUkxq0ddxND0yVCc+fY9QfeFRqYi/Qs1R2AwhqHJgBGBOXy0dOX9bdSK6cfCpMW8I
         C2vw==
In-Reply-To: <4128127.KGiVEnbFtn@nb003>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: ms@sys4.de
Cc: netfilter <netfilter@vger.kernel.org>

Michael,

thanks for your repply, I forgot to mention that each one are in
different places, so I wanted to set each local network to use the
nearest firewall. And yes, I will have a hardware that can handle the
whole network.

But, why not active/active?  (sorry for the silly question, if you can
just point me to any good source I can read about, its ok, no need to
waste your time with this)


--
Att...

Ricardo Felipe Klein
klein.rfk@gmail.com


On Wed, Nov 5, 2014 at 5:40 PM, Michael Schwartzkopff <ms@sys4.de> wrot=
e:
> Am Mittwoch, 5. November 2014, 17:15:23 schrieben Sie:
>> Hi there,
>>
>> I need to build a scenario with 2 linux servers (probably CentOS7)
>> acting as active/active firewall servers. What tools should I use?
>> I saw some articles with:
>>  - conntrackd + keepalived
>>  - conntrackd + corosync + pacemaker
>
> Why? There is not reasonable cause to build an active/active firewall=
 from two
> nodes.
>
> Any single hardware is fast enough to filter the speed of a WAN conne=
ction you
> can afford. No need for load balanceing.
>
> If one server breaks, the other has to bear the whole load. So you ha=
ve to
> design your hardware for the whole load.
>
> So please build an active/passive system.
>
> keealive makes the things very simple. If you have just the firewall,=
 go for
> it. If you waht a little bit more, i.e. conntrackd and a squid with
> dependencies amongst all resources, go for pacemaker.
>
>> But, what is the most used/stable?
>>
>>
>> AND, if there is a chance, I have 4 lan networks (each one in a
>> different VLAN) and it should be good if I can set something like
>> "preffered master" to each one for load distribution, because I will
>> run SQUID in those servers too.
>>
>> I just need to know which way to go, so, I can learn the tools and
>> configure it all here.
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
