From: Rafael Ganascim <rganascim@gmail.com>
Subject: Re: First packet NAT flow
Date: Mon, 21 Dec 2020 08:52:37 -0300
Message-ID: <CAD4ZOMwVc8JtC5aXTMqhgso5CPq=bzkfO7jHyjODwhUiG7O9TQ@mail.gmail.com>
References: <CAD4ZOMyRWi-wahS4bw11h=hQpzgjaCjHiomcsKK5fjqawe92MQ@mail.gmail.com>
 <20201221011520.GA9639@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=g52Duka47OLp9mtal0MAdun2dYPo7IXABQ0YIRBJB5k=;
        b=pqt01mfKL0zdqVgatYIzXEx8ARTKTVh52phavvXlf8j54hri5YcKAJe4t31cGqI8oU
         gyEh+/BSFsidqH0LFLzfD8kIQ/ECqR0hw7U7VG1Fnx+b/8ZLqB59O2/Nu+dobFMzx4Ec
         PtSZ4oWQiBfNd9+Cj/etkZOb03kXd2pxswoTPu4x0zYJxV/McTHv6sYtsq2eUUbYUFNk
         Urh8JLvAkz/R3WVnrxjVPxaUT5QMOCP039f37FwGmHZaUVuVzLeiw0/zXmjDy0QOsurj
         L1OJm3yhkvPP1Rle6DVQCYB3XTeooNDLaxyv9PR4udnyz/GpliT4t5+67vCRtDhGkTSA
         FSTw==
In-Reply-To: <20201221011520.GA9639@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

Em dom., 20 de dez. de 2020 =C3=A0s 22:15, Florian Westphal <fw@strlen.de> =
escreveu:
>
> Rafael Ganascim <rganascim@gmail.com> wrote:
> > As I understand it, when a connection is already established at
> > conntrack, the packets use these entries to flow, do the translation,
> > and don't go through the entire ruleset. Is this reading correct?
>
> They skip the NAT table/nat chains, but not the rest of the ruleset.
>
> > But what about the first connection packet that needs to be NATed?
> > Suppose we have 1000 rules of SRC-NAT, are the first packets covered
> > all of them until a match occurs?
>
> Yes.
>
> > Or is there a structure already
> > "configured" where the IP can get its NAT IP quickly?
>
> No.
>
> > And for example, for 1:1 NAT, despite the number of rules, what's the
> > difference between 256 rules of src-nat or just one using NETMAP
>
> None.

Thanks Florian,

And when we have more rules...? For example I have a LSNAT (CGNAT) box
with ~12k rules in the NAT table (with jumps trying to limit the
search range etc - it's working well). Using the NETMAP module I can
translate those rules to a small set of them.
Do we have performance improvements doing it?
