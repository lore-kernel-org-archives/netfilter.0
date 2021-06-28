From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Reload IPtables
Date: Mon, 28 Jun 2021 18:10:45 +0100
Message-ID: <20210628181045.42dc38746b9e4274a0714372@plushkava.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
        <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
        <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
        <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
        <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
        <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
        <f5314629-8a08-3b5f-cfad-53bf13483ec3@hajes.org>
        <adc28927-724f-2cdb-ca6a-ff39be8de3ba@thelounge.net>
        <96559e16-e3a6-cefd-6183-1b47f31b9345@hajes.org>
        <16b55f10-5171-590f-f9d2-209cfaa7555d@thelounge.net>
        <54e70d0a-0398-16e4-a79e-ec96a8203b22@tana.it>
        <f0daea91-4d12-1605-e6df-e7f95ba18cac@thelounge.net>
        <8395d083-022b-f6f7-b2d3-e2a83b48c48a@tana.it>
        <83719383-c18d-dcb6-07f6-f123872fa68b@thelounge.net>
        <fc8a9cbf-7424-1d14-e927-bbf454733434@tana.it>
        <ef5d64c7-2297-1e97-c6f9-29adbc915f60@thelounge.net>
        <20210628144655.4246a21cb17663ed51981625@plushkava.net>
        <031d674a-ba50-6925-5a7a-36db1f2e0fbe@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=date:from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        yRalfk5IQy/7wTEgLwiOr7pC2L7WvD8e8aBS8Ilbcvc=; b=pTE4g+hKmZ2jx4qw
        yQC1eYgJ6OnPP0ng9A6qmwHGcfrhSei6Jo6p4962UVtAxv10gpfWxFdRxYDi/uLY
        7IEEEvWyqsQS8n19u+ASzBcmxBa9pndAUBZ26/2HyxCZZ+gDBiWbI9BgIQ9JhKpp
        DLjGTj0/QjWuJv9Ay7cRWcO58WYw9pUtZ+DJXy7vcr1RY0/L9uAThOUd56kjBDLz
        ibhARiIrC3h7UA4Q9NiqFfNx+hubQFKBBGRRy1DFeNbfG/nZKq2UnyeDrDPaB0wp
        m4w7p08pd+6v6kbqJjS9Wn7NBsvqiUZ26DfC4q9RLzRmgHjUXeMBQZuVdlM4r6z/
        LjH3NQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=yRalfk5IQy/7wTEgLwiOr7pC2L7WvD8e8aBS8Ilbc
        vc=; b=GgHhCKFobEgkrEzCPis37WQ2N0zhkf+tY5hYfIPFkSdjgnIwI71OomLYI
        L84xHbHXQ27nFyIA4FHRQWglAN44cJxXBpY5DiEjJYczpzsqB+hiL51/fkoCuEuZ
        1qvFYsha1OXrlxLhGTOdzLtKYWbUr4YHziwjHGLt+G/OOjdITUNtIFO/K88U8APG
        /vnO7QGGlyD7umjOXP5nrx4wRUh3YswYVc8NS1WE7WqLD5aOMqSjvnhAwwtsD6jq
        NRv7UsGZvlWYjuPAXAn1uyKoa1glpv1VFMsY2SDN28y+46NzjRK5GZkAS/TDpV5n
        cnXYNEuI2D3XzF4XQ6IaOvqGNXCZQ==
In-Reply-To: <031d674a-ba50-6925-5a7a-36db1f2e0fbe@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Reindl Harald <h.reindl@thelounge.net>
Cc: Alessandro Vesely <vesely@tana.it>, netfilter@vger.kernel.org

On Mon, 28 Jun 2021 18:35:59 +0200
Reindl Harald <h.reindl@thelounge.net> wrote:

>=20
>=20
> Am 28.06.21 um 15:46 schrieb Kerin Millar:
> > On Mon, 28 Jun 2021 14:03:30 +0200
> > Reindl Harald <h.reindl@thelounge.net> wrote:
> >=20
> >>>> do what you want but stop talking nonsense when it comes to best pra=
ctice
> >>>
> >>> One "best practice" that I'd object to is blindly restoring whatever =
was
> >>> saved on shutdown.=A0 How can one control that?=A0 Booting with some =
clean,
> >>> well-defined data looks safer
> >>
> >> WTF: there is nothing magically or blindly saved and changed at
> >> shutdown, it's the whole state as it was, the outcome from your script
> >=20
> > Not that I can speak on Allesandro's behalf but I'm presuming it's a re=
ference to the save-upon-stop behaviour that may occur as a consequence of =
the integration performed by certain distro vendors. For example, Gentoo ha=
s a SAVE_ON_STOP option that its iptables runscript honours. I'm not sure t=
hat I've ever seen it be referred to as a good pratice, per se, but some pe=
ople appreciate having such options at their disposal
>=20
> and how do you think should there be something different as you are using?

I can't parse that.

>=20
> don't you simply not understand what save/restore does?
> your active ruleset don't fall from heaven

I'm not sure who you are addressing at this point but you can be assured th=
at I am aware of what saving and restoring entails.

>=20
> it's not magically changed unless you change something with iptables or=20
> your script
>=20
> and hell that's why when you changed something and want to reload the=20
> last boot state you restore and you are done - that's the topic here

Granted, the thread does seem to have meandered out into the weeds at this =
point. With that, I'm out.

--=20
Kerin Millar
