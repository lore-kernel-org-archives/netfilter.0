From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: GRE protocol .
Date: Sat, 1 May 2010 10:24:47 +0530
Message-ID: <AANLkTimBkNBrvVM7H5_W3fFy4X48sUK6aDQzY_0JyX0X@mail.gmail.com>
References: <1291704212-1272660052-cardhu_decombobulator_blackberry.rim.net-422468553-@bda240.bisx.produk.on.blackberry>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=vmjmUeOtZuhS2v1m1L8OQwQDjFQHhFmjvBNhwNUOb5I=;
        b=Sz5W201Lpi+MaxwzGuXvlC7ozg1bBwzQGtbZc9Rj+xKjLxxKrQ9t4yU22R47hlKOww
         Kyp/j9iXI/VF61b/ApI8XYCUkqtdDJ0TmWx5ORGj9zStE2fPiPq1MQ7GForilAlZxxOM
         xvK25uOvo+2lMhoFc3wPaESLjau/4D3fNeeCE=
In-Reply-To: <1291704212-1272660052-cardhu_decombobulator_blackberry.rim.net-422468553-@bda240.bisx.produk.on.blackberry>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: valerio.balbi@gmail.com
Cc: netfilter@vger.kernel.org

On Sat, May 1, 2010 at 2:11 AM,  <valerio.balbi@gmail.com> wrote:
> It's not clea r (sorry).

iptable rules configured in my gateway machine ( which act as a router
)  has no rule to allow GRE packet coming from wan side to pass thru .
There is no ALGs loaded . Still i am able to establish a pptp
connection . I can see GRE packet reached client machine using a
wireshark .

Thanks,
Ratheesh

On Sat, May 1, 2010 at 2:11 AM,  <valerio.balbi@gmail.com> wrote:
> It's not clear (sorry). Anyway you can log or reject the gre protocol=
 without any protocol inner inspection module.
> Gre protocol is paritetical to tcp. I'm not in my deskbox, but I reme=
mber that gre protocol has protocol number 49 perhaps. So you can trace=
 gre connection tracing searching packet with protocol number equal to =
49.
>
> My 2 cents.
> ------Messaggio originale------
> Da: ratheesh k
> Mittente:netfilter-owner@vger.kernel.org
> A:netfilter@vger.kernel.org
> Oggetto: GRE protocol .
> Inviato: 30 Apr 2010 09:19
>
> Router wan interface is eth1 and lan interface is eth0 .
>
> iptables =A0-A INPUT =A0-m state --state ESTABLISHED , RELATED =A0-j =
ACCEPT .
> iptables =A0-A INPUT =A0-i eth1 -j DROP .
> iptables =A0-A INPUT =A0-i eth0 -j ACCEPT
>
> iptables =A0-A FORWAR -m state =A0--state ESTABLISHED , RELATED =A0-j=
 ACCEPT
> iptables =A0-A FORWARD -i eth0 -o eth1 -j ACCEPT
> iptables =A0-A FORWARD -i eth1 -o eth0 -j DROP .
>
> I dont have pptp connection =A0tracking module installed . =A0But i c=
an
> see GRE protocol packet comed from wan gets routed and reaches my
> client machine =A0 connected =A0to eth0 ?.
>
> I can see message id is 0 in GRE packet .
> I have only pptp connection .
>
> Any hint is really appreciated ?
>
> Thanks,
> Ratheesh
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
>
> Le mail ti raggiungono ovunque con BlackBerry=AE from Vodafone!
