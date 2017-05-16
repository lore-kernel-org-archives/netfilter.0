From: =?UTF-8?Q?Thomas_B=c3=a4tzler?= <t.baetzler@bringe.com>
Subject: Re: nf_conntrack_max values
Date: Tue, 16 May 2017 14:49:27 +0200
Message-ID: <7f166ee9-2868-bfec-8be1-8b2211698d23@bringe.com>
References: <OFDC21F1C1.C9EDFB23-ON44258122.003D4D7A-44258122.0040745E@volga.ttk.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bringe.com; h=
        content-transfer-encoding:content-type:content-type:in-reply-to
        :mime-version:user-agent:date:date:message-id:organization:from
        :from:references:to:subject:subject; s=dkim; t=1494938967; x=
        1495802968; bh=lYce4pQd51zfVcVv0OnYxuxFOrvSCnt7k+pNBWOOL7E=; b=K
        wUfMiMAvvyehWtPIdOYeIBR3TJK0KV+0qWs9u3dExKUPH143p1HysjQDKn5Zuyzo
        3hElc3VaWr7I7xGdgmGPiBX7x0HOmTca9HpvGjhnrpT6s2bmiG4AFz+9cut4sv/v
        NNhdI5K7xCPTahZjhX5+goUvKwjxz7mng/XaxrJ1Qo=
In-Reply-To: <OFDC21F1C1.C9EDFB23-ON44258122.003D4D7A-44258122.0040745E@volga.ttk.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: i.chudov@volga.ttk.ru, netfilter@vger.kernel.org

Hello Igor,


Am 16.05.2017 um 13:44 schrieb i.chudov@volga.ttk.ru:
> Hello all!
>
> I'm working for a small ISP and we have a questionable situation here.=20
> Hope anybody will be able to help us.
>
> We have a machine (one white IPv4) which does IPv4 masquerading for=20
> clients in 192.168.0.0/16 subnetworks. Recently we noticed a growth of=20
> /proc/net/nf_conntrack NAT translations table from about 5k lines to 40k =

> lines (30k translations to 1e100.net, port 5228). Okay, let the Google sp=
y=20
> users, fine but the situation has raised the following questions:
>
> # grep ESTABLISHED /proc/net/nf_conntrack | wc -l
> 29560
> # sysctl net.ipv4.ip_local_port_range
> net.ipv4.ip_local_port_range =3D 32768 61000=20
> # bc
> 61000-32768
> 28232
> # sysctl net.netfilter.nf_conntrack_max
> net.netfilter.nf_conntrack_max =3D 65536
>
> 1) How is that possible that number of ESTABLISHED connections is greater=
=20
> than ephemeral post range?

You're probably connectiong to more than one host and one service on the
internet? ;-)

See
http://stackoverflow.com/questions/2332741/what-is-the-theoretical-maximum-=
number-of-open-tcp-connections-that-a-modern-lin

> 2) Is net.ipv4.ip_local_port_range used for NAT translations?

Yes, and you can extend it.

Some other thoughts on your situation: if you raise nf_conntrack_max,
you should probably also tweak the hashsize module parameter for
nf_conntrack so that your conntrack hashtable is big enough. Otherwise
you end up with lots of collisions in the conntrack hashtable.

You should also investigate whether those connections listed as
"ESTABLISHED" have been created by misconfigured firewalls. They'll show
up as "ESTABLISHED/UNREPLIED" in "conntrack -L".

HTH,
Thomas

MfG,
i.A. Thomas B=E4tzler
--=20
BRINGE Informationstechnik GmbH
Zur Seeplatte 12
D-76228 Karlsruhe
Germany

Fon: +49 721 94246-0
Fon: +49 171 5438457
Fax: +49 721 94246-66
Web: http://www.bringe.de/

Gesch=E4ftsf=FChrer: Dipl.-Ing. (FH) Martin Bringe
Ust.Id: DE812936645, HRB 108943 Mannheim

