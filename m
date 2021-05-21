From: =?UTF-8?Q?Laura_Garc=C3=ADa_Li=C3=A9bana?= <nevola@gmail.com>
Subject: Re: Possible to load balance (nftlb) mostly NFS traffic with
 important connections?
Date: Fri, 21 May 2021 12:47:51 +0200
Message-ID: <CAF90-WiLP5pT9ecWdZB27pN_JmDfqz_i2KZySq6TKGAEBptdrg@mail.gmail.com>
References: <9cbbeb2e-f09c-5eca-f86c-6f3b25cd9ea3@aei.mpg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1x5+2i2Ird5kTRoCTVJqhKi3ms+efIIi3ToNMv+Lm+Q=;
        b=nNA2Nps1QtXVeSynrn2paq6V80D/knnnFsNxPO8g8OJwIKmOsy+m9f1loaYuQB1UBn
         BVAPdPd7ICmqthIhuOEBPdyXw+1riBdyuYizIaIQt6+/KeOeN6MXZC5xAHyxRp5J0rLB
         TFe1modyTmq0TnkrlUvuMQwt/CDL4j08/SLxqSat2pZhs5UG5S7rGHC79jmJKI+wPOW0
         GSO6pLB7EcH7zRj/kd4xHHNqdKQ8ABTkbyNBy1IqX2ZrWHWXA/gO0qIRnXui1FZIfJ4k
         bnrCqj2Dy+/Xm3tZ6TS3VC+BZRFRbm5XazahmZYBJQ3Vhj5KRFenHEkMrkF9CC8vMESa
         iIMw==
In-Reply-To: <9cbbeb2e-f09c-5eca-f86c-6f3b25cd9ea3@aei.mpg.de>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1254"
To: Carsten Aulbert <carsten.aulbert@aei.mpg.de>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi Casten,

On Sat, May 15, 2021 at 1:11 PM Carsten Aulbert
<carsten.aulbert@aei.mpg.de> wrote:
>
> Dear experts,
>
> we are operating a compute cluster with a number of storage systems
> serving data via NFS via LACP-bonded 10 Gbit/s links (usually 2 or 4).
>
>  From time to time, users may overload a server and use up all available
> bandwidth for hours and sometimes days at a time and I am currently
> exploring if we could use tools like nftlb[1] to achieve the following:
>
> (a) For (NFS|any) traffic have at least two tiers (farms?), one are
> standard compute nodes and one are interactive log-in nodes/web servers.
> The former should have a much lower bandwidth priority as the latter.
> These targets can easily be distinguished by IP ranges/netmasks.
>
> (b) Sometimes we need to perform bandwidth intensive/sensitive
> operations, e.g. just today I would like to move a user's file system
> from one too busy box to another but sending the ZFS snapshot over via
> mbuffer takes really long and I would like to prioritize this connection
> as well, i.e. I know the source and destination IP as well as target TCP
> port.
>

nftlb doesn't support bandwidth management per farm or pool, only
connection limits can be configured.

Uplinks load balancing is in my TODO list and probably it would be
useful for your case.

Kind Regards.


> I am still learning to migrate from iptables to nft while I stumbled
> over nftlb which looks to support what I want, but I am not sure yet -
> and I have not found many documents describing potential set-ups and
> thus I wanted to ask the experts here first.
>
> Base of all our systems is currently Debian 10 (buster) and thus kernel
> 4.19.
>
> Cheers and thanks a lot in advance for any insights/pointers/...!
>
> Carsten
>
> [1] https://github.com/zevenet/nftlb
> --
> Dr. Carsten Aulbert, Max Planck Institute for Gravitational Physics,
> Callinstra=C3=9Fe 38, 30167 Hannover, Germany, Phone +49 511 762 17185
>
>
