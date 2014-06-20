From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: nftables&iptables coexistence
Date: Fri, 20 Jun 2014 08:43:33 +0200
Message-ID: <CAOkSjBgKhF4r2ex6mmcCSfJh_401ei+=bCb1ZQnqp3g2kK6c1A@mail.gmail.com>
References: <CALU-w99A94oGuedx=tr_5vASnYLHFLx1CF3_288dwMvcYi-M9w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=UWWcPxMegsrThWR2DjR4DObqL6TiEhcYmgPp1w6ChDI=;
        b=k4ZnCzivoIHyyQi+8R2QvuWyWRWvqstlvYwtgPJGpd2urb0LuwMiG+deeHP+5tp4cU
         PcbOYmwcu4PGDD+mms4zr8ti22DQuLGMl9j1CjQaufIP0nwXeUqnZaBQ7/EIzj/yh+98
         IzxWFdepX22CPbpSjbwD0SgXyH+8SzYVweGDo9G6TCcR9/UOPXOosTtYgjXQxXCOFASQ
         UMOBqOHU3Dn3O1rsUqOsNltRLWspMc+6LjbYBCMTp/TUbfxzrvWk42o4UYX5AgLrYPS6
         Cb9oO7q6wh4HD6W5zXXdNeQtS/UHb8sZ5kPE8hocJvlsi5MYCcL5Kif1BK2IyaA/o64p
         GkkA==
In-Reply-To: <CALU-w99A94oGuedx=tr_5vASnYLHFLx1CF3_288dwMvcYi-M9w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?Fejes_J=C3=B3zsef?= <jozsef.fejes@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 18 June 2014 21:49, Fejes J=C3=B3zsef <jozsef.fejes@gmail.com> wrote=
:
> Hi,
>
> I would like to start using nftables, but I'm playing with a headless
> box and it would be too inconvenient if I locked myself out, so let m=
e
> ask this one safety question before I start experimenting. I have lot=
s
> of iptables rules. If I compile nftables into my kernel, and also
> leave iptables there, and reboot, what will happen? Will packets go
> through both iptables and nftables? In what order? Without any
> configuration from user space, does nftables pass along each packet
> without intervention?
>

I would not recommend mixing two different rulesets from two different
frameworks.
Is an experimental situation, and your server networking can be hurt.

While the next version of iptables (userspace) is expected to natively
use the nf_tables kernel subsystem, the latest iptables (1.4.21) still
uses his own subsystem.

That being said, test it and get back to the list with the results :-)

regards.
--=20
Arturo Borrero Gonz=C3=A1lez
