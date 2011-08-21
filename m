From: Vinicius Massuchetto <viniciusmassuchetto@gmail.com>
Subject: Re: Can't share ppp internet connection
Date: Sun, 21 Aug 2011 06:28:21 -0300
Message-ID: <CAJ1a922US5tADLjK=v3_fPVQcKCrKO5hk+L5_z0ZHuaC0_hkww@mail.gmail.com>
References: <CAJ1a921b0HqJmUxTfqmsO+RG56w+DS6tBoWWhPBFQb8t2cHQCQ@mail.gmail.com>
 <CAJ1a920zedy041MoUtYfbDCjMtzcg86Xd-i7ugP2zwDmGg7gXQ@mail.gmail.com> <alpine.LNX.2.01.1108211107520.15071@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=224770pmAjXXcRZ+f6bdJdPSdXF57Hqp3U4VdNpta6Y=;
        b=jHYBVI5AYj11zTek6mC1hP3pRgkJGLZAIiPBzyE1BwusBO1ii3AVS6vJeNONneytoQ
         fzmWqAS02syRc4iuhEpXHanmNLqZxn1i609VgqN0/bmQhIwswDIN/x87eS1eWuVdhkIV
         0xTUboygV+aSo6dU5coiSTnNS3yRJJDgSQvLg=
In-Reply-To: <alpine.LNX.2.01.1108211107520.15071@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Netfilter <netfilter@vger.kernel.org>

2011/8/21 Jan Engelhardt <jengelh@medozas.de>:
>
> On Sunday 2011-08-21 10:51, Vinicius Massuchetto wrote:
>>2011/8/20 Vinicius Massuchetto <viniciusmassuchetto@gmail.com>:
>>> I had this configuration before, and it used to work well, but now =
I
>>> got a new server and I can't setup it to share the internet connect=
ion
>>> from ppp0.
>>>
>>> The client connects directly on eth0 through a dhcp server, and it =
can
>>> get an IP just fine. The problem seems only to appear when I set th=
is
>>> rule:
>>> `iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE`
>>>
>>> Just after that, the client won't be able to receive an IP from the
>>> server anymore. Here's the configuration files:
>>
>>Aug 21 04:52:13 onix dhcpd: DHCPREQUEST for 192.168.0.2 from
>>00:16:36:96:2b:15 (amendoa) via eth0
>>Aug 21 04:52:13 onix dhcpd: DHCPACK on 192.168.0.2 to
>>00:16:36:96:2b:15 (amendoa) via eth0
>
> Random thoughts
> - rp_filter interfering

Running `sysctl -w net.ipv4.conf.eth0.rp_filter=3D0` seems not to chang=
e anything.

> - having 192.168.0.0/24 on ppp0, colliding with eth0

Not sure if this is enough, but the ppp0 is not on the 192.168.*.* rang=
e.
$ ifconfig ppp0
          Link encap:Protocolo Ponto-a-Ponto
          inet end.: 187.53.115.31  P-a-P:10.64.64.64  Masc:255.255.255=
=2E255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  M=C3=A9tric=
a:1
          RX packets:62495 errors:0 dropped:0 overruns:0 frame:0
          TX packets:39460 errors:0 dropped:0 overruns:0 carrier:0
          colis=C3=B5es:0 txqueuelen:3
          RX bytes:86031897 (82.0 MiB)  TX bytes:3378602 (3.2 MiB)

Thanks for helping.
--=20
Vinicius Massuchetto
