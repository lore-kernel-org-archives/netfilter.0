From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Reload IPtables
Date: Mon, 28 Jun 2021 14:46:55 +0100
Message-ID: <20210628144655.4246a21cb17663ed51981625@plushkava.net>
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=date:from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        ABXQ+Ping8Z0WDwQnhSpDqOzRShoDtW3jC8cjHH+pgc=; b=Gn7Si8lc6b4D96Mg
        ifdE/dJz1BIEiluuedP4HwEvrSrex1yrupoI52hWlyRhg08urSWPCaBuxn4WIdKt
        MqZGSv44jUqem1kIS5IMURAmuen+bg953CL9maNZOxhxhE7kYKVE0/sB30wcmA6r
        2kMyIXplD+8nRirZqkDuYqVMYEWvqnFaQSJDNTWaivtI869JAsC5zcrdeRIsGq9H
        qpXeI6j3/RALoDcJ1yjPOUycgnqd2G+bkKSsa/dpTpq5DXTU5zyaOzmg0QkheR8c
        0nwX91rnVDnn2kKsa9SYIP2saCtBgor7ggq2sn/zK+mqqyW8T86F++NNKmWlE/Yp
        SDX6zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=ABXQ+Ping8Z0WDwQnhSpDqOzRShoDtW3jC8cjHH+p
        gc=; b=RxKGSAhY5V72ASK8O0CsQveTF7dCL6Nsud+QAghC+FsLfJM1DHBVM0n7B
        u4x+27jpBhrtUPccgcuHqRw9d237e2FARN58ahXErSmxx7/0iDuW9fH/tmG44dqY
        wkO205Ajp9gWUWSR3VY8Csk8V4SGKhJS2ptWCtBzAzaWz1s4ljtaeMBrJhBOXd78
        wtSReD/T57zMUcU1cyySNbPXUWzEL7q/uopt+tiPk/4SjCSpzNFwhhPc1rMQacxR
        amDH+UsNQ5Lp5qBGgc3chnxKGBvgGRw+yRgPMkcNTGtQ46Si9uDur2EWcmyjZohh
        M0Gewds/AiKYm0giaBWRpw8CZ8xmw==
In-Reply-To: <ef5d64c7-2297-1e97-c6f9-29adbc915f60@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Reindl Harald <h.reindl@thelounge.net>
Cc: Alessandro Vesely <vesely@tana.it>, netfilter@vger.kernel.org

On Mon, 28 Jun 2021 14:03:30 +0200
Reindl Harald <h.reindl@thelounge.net> wrote:

> >> do what you want but stop talking nonsense when it comes to best pract=
ice=20
> >=20
> > One "best practice" that I'd object to is blindly restoring whatever wa=
s=20
> > saved on shutdown.=A0 How can one control that?=A0 Booting with some cl=
ean,=20
> > well-defined data looks safer
>=20
> WTF: there is nothing magically or blindly saved and changed at=20
> shutdown, it's the whole state as it was, the outcome from your script

Not that I can speak on Allesandro's behalf but I'm presuming it's a refere=
nce to the save-upon-stop behaviour that may occur as a consequence of the =
integration performed by certain distro vendors. For example, Gentoo has a =
SAVE_ON_STOP option that its iptables runscript honours. I'm not sure that =
I've ever seen it be referred to as a good pratice, per se, but some people=
 appreciate having such options at their disposal.

--=20
Kerin Millar
