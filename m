From: Shane Wang <xwang4396@gmail.com>
Subject: Re: How to configure "full cone" NAT using iptables
Date: Tue, 16 May 2023 19:07:39 +0800
Message-ID: <CAF_hPjOsjMJqvgPLSgfzLqaQ21GTvLUXGNmHCCkxHEbvNCo1ZQ@mail.gmail.com>
References: <CAF_hPjN0pV9w+RmO8rkSnNwd-2+ep6vmy-7JaREvUFSyNzuGhg@mail.gmail.com>
 <81765c91-cfc1-cf1a-8d34-c69dea29e2af@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684235270; x=1686827270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcyT25hAFGTN+aIuBYskzTkXOH0s1Zo6yAzUmyvpjak=;
        b=AhRAljdc2fs1EBqRP38S82s4ozbW6j0+sbtukqOMbYBE6Gk4xcpdXOxM8cY9B7l0UO
         3Ajb1kdTjRz5RWSdezzXqaE60kdqWy3X3DcGVkHAAP0CtqWZL9xqg2gDFdrgm8jvtAak
         EPI3lkJ3xAhmkzgtHwq9MbaNITTvN0eBxNu4VYjjZQT42Yy5sZ+cgcBhCn0n0cBmpE9V
         eOLz4i/411P3lIIif6Pd5kbVc1iglwi774ItKVv48o7b/DLvNq+2ABxPVMImJS91F7q+
         6OSwY2gAobdCztFhiotVgLC3weZ2rrAW2T6XrKq6jQ21rUx3swDYpIVfOFAhlaEMqXZF
         5g7A==
In-Reply-To: <81765c91-cfc1-cf1a-8d34-c69dea29e2af@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Reindl Harald <h.reindl@thelounge.net>
Cc: netfilter@vger.kernel.org

Thanks for your reply.

I think the "--to-destination 10.0.0.1" rule will be matched, and the
"--to-destination 10.0.0.2" rule will never be matched.
Does iptables unsupported "full cone" NAT for multiple internal IP addresse=
s?

Reindl Harald <h.reindl@thelounge.net> =E4=BA=8E2023=E5=B9=B45=E6=9C=8816=
=E6=97=A5=E5=91=A8=E4=BA=8C 18:15=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> Am 16.05.23 um 11:58 schrieb Shane Wang:
> > Hi folks,
> >
> > I have found a solution on
> > https://www.joewein.net/info/sw-iptables-full-cone-nat.htm, which
> > works fine for a single internal IP address. However, I am struggling
> > to configure "full cone" NAT for multiple internal IP addresses using
> > iptables.
> >
> > I have tried the following rules, but they do not seem to work:
> >
> > iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 192.168.2.17=
0
> > iptables -t nat -A PREROUTING -i eth0 -j DNAT --to-destination 10.0.0.1
> > iptables -t nat -A PREROUTING -i eth0 -j DNAT --to-destination 10.0.0.2
>
> how do you imagine two contradicting rules to work?
> roll a dice between 10.0.0.1 and 10.0.0.2?
