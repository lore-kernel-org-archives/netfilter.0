From: =?ISO-8859-2?B?VG9t4bkgVmzoZWs=?= <tomasvlcek@gmail.com>
Subject: Re: Advanced Logging
Date: Sun, 30 May 2010 20:19:40 +0200
Message-ID: <AANLkTilirP3XipLJewk9fbW_ePm2kZb9QzxdvReyUrDv@mail.gmail.com>
References: <AANLkTimgYvZZ80VgAU4kpLyqKwOMo6u81QCDhX_lD72p@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=burgMfe03c1MT1Hwnon46P4cXL+Veb7ftk6oBpvAExA=;
        b=cJ7AXM3ZxqYMApv3iVC84BETCviX8KbWIW6qba+KPskts6e5qiVd/aKod4J7IgtTkb
         5uzhr5juagmYYmmnelgmntCsn1LjGRoxyrcbTdfhmZ6sH3CVdssg276XpBoIOUJ1HeOz
         9aOHl87lPWDZxqAKbmKg0mAuJkb5luk1yb9C8=
In-Reply-To: <AANLkTimgYvZZ80VgAU4kpLyqKwOMo6u81QCDhX_lD72p@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Maybe psad (Port Scan Attack Detector) is that what are you looking
for. Check http://cipherdyne.org/psad/index.html.

There is also a great book about this program (and 3 additional
programs as well) written by the author of these programs. This book
covers psad (analyser of iptables logs), fwsnort (translator of Snort
rules into iptables rules), fwknop (single packet authorization) and
ways how to visualize iptables logs. Details can be found at
http://www.nostarch.com/firewalls_mr.htm.

I hope this helps...

Tom=C3=A1=C5=A1 Vl=C4=8Dek

On Sun, May 30, 2010 at 4:28 PM, ratheesh k <ratheesh.ksz@gmail.com> wr=
ote:
>
> Hi ,
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I have implemented =C2=A0firewall =
=C2=A0in my linux machine using
> iptables . It is able to prevent attacks and LOG just before dropping
> packets . Since i know a little about iptables , i could go thru
> /var/log/messages and find out information about attacks . Is there
> any application which will analyze logs and =C2=A0give a brief inform=
ation
> to user about the attacks =C2=A0?
>
> For example , suppose there was a syn flood attack ,the application
> should analyse the /var/log/messages or by some means should know
> about the attack and let the user know about that .If there is no
> application , =C2=A0could you give some hints on how to develop an
> application .Any comment is =C2=A0appreciated .
>
> Thanks,
> Ratheesh
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
