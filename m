From: Pieter Smit <mlist2010@vigor.co.za>
Subject: Re: Playing nice with incoming traceroutes
Date: Sat, 15 May 2010 18:51:55 +0200
Message-ID: <AANLkTilTF_pcF5W67BEAhKmNIzpffHhFByKLS2LX7bqy@mail.gmail.com>
References: <AANLkTimnTBPl5oayp3tprDmROD4bNpIXyAodkZuF_JlS@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:sender:received
         :in-reply-to:references:from:date:x-google-sender-auth:message-id
         :subject:to:cc:content-type:content-transfer-encoding;
        bh=wcFomaIDYWH7gukSwQGBudIN6R5Uu3itRmDOj+eGrWE=;
        b=olc7ZAnqlQRejMqAkpNXjQOqcxf1vSAFJusXYebgnMe3YJl4USjka910JNXuOg0qds
         eqzbaxx+FGaKsS/Hl0l5EhXYq92NktSaEaIbgE8wpjBsoWjb55gCONYMJmAut8bfNW3t
         eN/IUVUz48mkNRm7oR18Tr0AankfD3u2OullQ=
In-Reply-To: <AANLkTimnTBPl5oayp3tprDmROD4bNpIXyAodkZuF_JlS@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Curby <curby@cur.by>
Cc: netfilter@vger.kernel.org

You would send an ICMP time exceeded (type 11) packet if you receive a
packet with a ttl=3D1 you will decrement it one realize it is 0 and sen=
d
the ICMP time exceeded.

Traceroute could also use ping ICMP echo request (type 8).

Pieter


On Fri, May 14, 2010 at 11:17 PM, Curby <curby@cur.by> wrote:
> Hello, I'm considering allowing inbound traceroutes to find me, in th=
e
> interest of being a good Internet citizen. =A0I could simply open the
> right udp ports, but i'd rather more tightly control what's allowed
> than simply opening them up entirely. =A0Thus I'm considering somethi=
ng
> like the following. =A0Should it meet my expectations of responding
> appropriately to traceroutes but otherwise not letting traffic
> through?
>
> -A INPUT -p udp --dport 33434:33534 -m ttl --ttl-eq 1 -j REJECT
> --reject-with icmp-port-unreachable
>
> I'm using ttl-eq 1 because that's the lowest TTL that showed up in my
> netfilter logs when I tried to traceroute my machine earlier. =A0In
> other words, I don't think I should use 0, but am willing to be
> convinced otherwise.
>
> Also, I'm a little unsure if I should be using another ICMP code when
> I send the REJECT packet. =A0But port unreachable seemed reasonable. =
=3D)
>
> Thanks!
>
> --Mike
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
