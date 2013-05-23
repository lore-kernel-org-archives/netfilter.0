From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: --arpop question
Date: Thu, 23 May 2013 11:52:45 +0200
Message-ID: <CAOkSjBg1zQvYuckOKZ5iUYmkDc0YH4q6ELhAiFGN5R+B+uZJ9g@mail.gmail.com>
References: <519DD861.5090800@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=pkkjv281V1jiVkWDigWVxzC1LsioJCZL2pGBvB7GNhQ=;
        b=qsq55DkIgyvUOE11Px2Ayvy0l6izhsKC09uT38Y2vC3vIASSWOGOkkecyLHoWpKTch
         elNvl36qmqT7S73CMH4QlGsWr1QWVH21gpn1+Kyvjq5f5VNU3tYcQXR4Ivg8pfwByoY+
         52IEt/3gNyiJfGVGKZtD+FeHhGZk7IDQWQv75IxndkJI1dKDBdrDazGmTds7BYOTDSNt
         tIdzX0TL4B/F7a2p2gm5GbwUTTvfL8ldLd6RZbWUswIUDejnrM8p6eotaW3GH32U/72z
         aS2q/L4h5VKmghw+U/OCqMAA6eNLC6asiub/uR5cf8el2NJS9OkcNdaS9u1Dx3xVIvyO
         tScA==
In-Reply-To: <519DD861.5090800@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Karolis B." <kbart.misc@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

2013/5/23 Karolis B. <kbart.misc@gmail.com>:
> Hello,
> I want to disable ARP requests on usb0 interface. Reading man page se=
ems
> like "--arpop Request" would do what I want, but an error occurs usin=
g it:
>
> $sudo arptables -A OUTPUT -o usb0 --arpop Request -j DROP
> Bad argument `Request'
>

Hi,

in my system:

# arptables -A OUTPUT -o usb0 --arpop Request -j DROP
Bad argument `Request'
[...]
# arptables -A OUTPUT -o usb0 --opcode 1 -j DROP

i'm using Debian Wheezy with arptables 0.0.3.4-1

Best regards.

--
Arturo Borrero Gonz=E1lez
