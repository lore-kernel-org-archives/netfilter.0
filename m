From: Glen Huang <heyhgl@gmail.com>
Subject: Re: How to trace IPSec packets?
Date: Mon, 29 Jan 2018 18:07:42 +0800
Message-ID: <CALNXhk0TefWZQ7_e+JOuDL7Qs7KFq2DwQ4h+CayKHd3uWd_y_Q@mail.gmail.com>
References: <2A246279-5BD5-4858-9E81-2132542CD4DA@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=MMLt9WhBw3DARAI0IjZTlj7wC8u+2NlbudkRIN/OSMw=;
        b=m5nhBD9ieLZK7Oedzxisvc3Pye9rfAhQAs86By3xrhF9F8XMbE01oKlqZfD/vSSPmx
         h2BhvC8Rzz+p+hsWwbW9GHY08+kjDi4GuAyJNlQkM3xvvTgWT3BnlyUOfp7/pEdA1erS
         b5VyUZagDa6bVzCrhfJGMbEXFgKHDKc/ijaZxwm+xQON7Pu3hFXOQpHZOtg8XU70/jcK
         P9ORUO7VYm7d6h8BSuCGyNzh6kSCVoeoHkWRHLTlz8zs95wmIzQYhsVh1w/ZOIUbpGeG
         x30hiEPnsO+4mUhBjLUIwBFC44qRHQlTB1MADZML/DgCmbJLdr3kHbJRXPSWDPLX5Lpr
         vWoA==
In-Reply-To: <2A246279-5BD5-4858-9E81-2132542CD4DA@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Glen Huang <heyhgl@gmail.com>
Cc: netfilter@vger.kernel.org

(Previous message seems to get smudged. This is a resent.)

Hi,

Hope the question isn=E2=80=99t too basic to be asked here.

I have an IPSec tunnel set up between my machine and a server. All
packets originate from my machine go through that tunnel and then get
forwarded by the server. I=E2=80=99m trying to redirect DNS request from my
machine to 8.8.8.8 to a dns forwarder running on the server.

I tried this on the server

iptables -t nat -I PREROUTING -s $IPSEC_VIRTUAL_IP -d 8.8.8.8 -p udp
--dport 53 -j DNAT --to-destination 127.0.0.1

But it didn't work. To make sure it wasn't because I hadn't allowed
martian packets or anything. I tried to trace the decrypted packets.

iptables -t raw -I PREROUTING -s $IPSEC_VIRTUAL_IP -d 8.8.8.8 -p udp
--dport 53 -j TRACE

But after dig @8.8.8.8 google.com on my machine, running grep 'TRACE:'
/var/log/kern.log on the server returned nothing.

According to this picture:
https://en.wikipedia.org/wiki/Iptables#/media/File:Netfilter-packet-flow.sv=
g
after decrypting the ipsec packets, netfilter will make the decrypted
packets go through the ip stack again, and the trace target should be
able to catch it.

I wonder if my mental model is incorrect or I missed something?

Regards,
Glen

On Mon, Jan 29, 2018 at 5:10 PM, Glen Huang <heyhgl@gmail.com> wrote:
> Hi,
>
> Hope the question isn=E2=80=99t too basic to be asked here.
>
> I have an IPSec tunnel set up between my machine and a server. All packet=
s originate from my machine go through that tunnel and then get forwarded b=
y the server. I=E2=80=99m trying to redirect DNS request from my machine to=
 8.8.8.8 to a dns forwarder running on the server.
>
> I tried this on the server
>
> iptables -t nat -I PREROUTING -s $IPSEC_VIRTUAL_IP -d 8.8.8.8 -p udp --dp=
ort 53 -j DNAT --to-destination 127.0.0.1
>
> But it didn't work. To make sure it wasn't because I hadn't allowed marti=
an packets or anything. I tried to trace the decrypted packets.
>
> iptables -t raw -I PREROUTING -s $IPSEC_VIRTUAL_IP -d 8.8.8.8 -p udp --dp=
ort 53 -j TRACE
>
> But after dig @8.8.8.8 google.com on my machine, running grep 'TRACE:' /v=
ar/log/kern.log on the server returned nothing.
>
> According to this picture: https://en.wikipedia.org/wiki/Iptables#/media/=
File:Netfilter-packet-flow.svg after decrypting the ipsec packets, netfilte=
r will make the decrypted packets go through the ip stack again, and the tr=
ace target should be able to catch it.
>
> I wonder if my mental model is incorrect or I missed something?
>
> Regards,
> Glen
