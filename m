From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Update delay when using nat table?
Date: Sat, 13 Mar 2010 09:38:13 +0100
Message-ID: <4B9B4EF5.5010700@chello.at>
References: <09084388150B46A2B74F745A8E1272DA@main> <2122a8b921764fb70003e1215e6e38e0@thom.fr.eu.org> <383286BAD7464B6296AB3157C21B3C99@main> <967e5777d730e5c39389a4e554144099@thom.fr.eu.org> <67C8429999B648F983EB141D7A928400@main> <fb38a2c6c48a619cad79a09967062ef1@thom.fr.eu.org> <12BF43FAE6E84B42B79EC7FF3075058A@main>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <12BF43FAE6E84B42B79EC7FF3075058A@main>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

On 12.03.2010 15:14, netfilter-owner@vger.kernel.org wrote:
>> If you have the kernel build tree, you could simply download ipset f=
rom
>> their site ipset.netfilter.org and run make. It works seemlessly.
>> Otherwise, there is the netfilter-extension-source debian package bu=
t I
>> don't know the requirements for this.
>>
>> Fran=C3=A7ois
>=20
> ----- Original Message ----- From: "Fran=C3=A7ois Legal" <devel@thom.=
fr.eu.org>
> To: "Sheepa" <sheepa@sheepa.org>
> Sent: Friday, March 12, 2010 9:04 AM
> Subject: Re: Update delay when using nat table?
>=20
> This doesn't seem too simple, maybe im getting myself into too deep
> waters..
>=20
> I somewhat followed this guide:
> http://fxp0.org.ua/2007/jul/29/building-kernel-ipset-support-debian-w=
ay/
> but I couldn't get it to work.
>=20
> Also, why would there be an ipset package if you still need to downlo=
ad
> the source? Can't I just use that one somehow?
>=20
> Thanks,
> Sheepa --


if I remember correctly, you need the module-assistant package.
then install the modules with:

module-assistant prepare
module-assistant auto-install netfilter-extension-modules

I think that's how I did it on debian lenny.

Best regards

Mart
