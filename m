From: Dash Four <mr.dash.four@googlemail.com>
Subject: Re: Dabase BAcked IPTables
Date: Sun, 30 Jun 2013 13:13:57 +0100
Message-ID: <51D02105.4070201@googlemail.com>
References: <CAGWRaZYZnq3bneKNdisrRAfk=9PvKD=cXVWN_b0ySVRMaPw9Dw@mail.gmail.com>	<1372536635.3924.89.camel@andrew-desktop>	<CAGWRaZbQXv=J8YfofS4HEUYovcLTdoW5yvLpKdfP83rOkyRyng@mail.gmail.com>	<201306291700.53177.neal.p.murphy@alum.wpi.edu> <CAGWRaZaWGwQ1KcdXXLN-fVCOVJzMa83s7_1h9eBcBnzQZK1bcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:cc:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=0fkvetOJ4/zTEGAJuNglkeb+C0MiKOBxBaMoYR9dmUw=;
        b=y06ai6oNHpfnqvieqcCHvFRg9FMGcqkUfFqPCUT3XGwYR6g0vWyFBUJ1eavNnbJb6Z
         Fls7iUVyssdxaBqPs/XTPyz5b8W2N5bStuncZaTCCij03udfiUcRgS897ZOFvx7uA7c3
         viPe5cXmg/ANDSmWbEI8tzkqHM2QbWkArjEoNiQFwheqGiTZXvpj31Ub8H0YaKzVVgM5
         cvkDCYwb7S4Wht9SOwsiqlpP/w9vqGDSK1WBmCuB+/PWcLWvN0m2gKkwvR4LC8QiYPDp
         1iUGZpN5FqxUVtoh/s2Wzrtgsyyz7ytKP6TzstnZcnsDn5t/BufMRuBK4EV0+pjlWKgB
         GfMw==
In-Reply-To: <CAGWRaZaWGwQ1KcdXXLN-fVCOVJzMa83s7_1h9eBcBnzQZK1bcQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org


Nick Khamis wrote:
>>> The MAC address is only used on local links. The MAC address of a packet
>>> arriving at your firewall or perimeter router is that of the router at the
>>> other (ISP) end of your link.
>>>       
>
> Our client application adds a P-Assertion to the SIP message
> indicating the mac of
> the requesting client. Now, I am not sure how we can tie that into
> "--src" of IPTables.
>   
If you need to capture embedded MAC addresses in that header you would 
need to analyse the SIP packet - not a trivial thing to do by any means. 
Even then, what's stopping, say, an adversary from crafting a packet 
with a "legitimate" MAC address embedded in that header.

Even if you match IP and MAC addresses together, that won't be 100% 
secure as these could be easily forged.

Since your clients are using an application you provide, why don't you 
secure the signalling using PKI - that way you could distribute a 
certificate with the client. The server on your side of the connection 
won't accept it unless a secure handshake has been established - job done.

OK, that won't prevent you from somebody ddos-ing you, but you could 
easily protect yourself from this using standard iptables tools.
