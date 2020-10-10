From: <paul.guijt@gmail.com>
Subject: RE: Newbie: IPv6 equivalent of 192.168.178.0/24
Date: Sat, 10 Oct 2020 14:52:33 +0200
Message-ID: <03fa01d69f04$390c20b0$ab246210$@gmail.com>
References: <021101d69e3a$b2ce88e0$186b9aa0$@gmail.com> <3febcbd8-5a08-5b1d-724b-30f995d6eeca@spreadshirt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:references:in-reply-to:subject:date:message-id:mime-version
         :content-transfer-encoding:thread-index:content-language;
        bh=tuTng668vrEDsLgAXthiiJxVYViPxeaGpsG9uwrw4Yk=;
        b=KYjSN67cHhww7mWtB3lDdW6C+TOxI9u3VM+5xLWy5i2/L5oOYra1kS8LnO8C26YEwi
         rj3UQsPpKKjz/jl1IoFbm1p+WdzQH66PFe/h7G12SeR0rQME92OY3UZBdXF8AFntAeSV
         rXu2q4E1XAM3jPB5HzTbX0LeFXYiOSL8/AhtyhmK2yFjsnApI/ETqMumnUoAqd4jhGix
         gj2rU8J/Wmi1/u+xVL96p/FeWHfv9Pi/5TpOMNlIjraexQPsBbK9qdnbBuW8HkLJybIe
         rHADHjJYZZapp+c+ppHSWXyOdyWtv1Ilw0kQ1lGjX0jQPNW/NyYNqD7xdSbEkoiBAzJc
         3cEg==
In-Reply-To: <3febcbd8-5a08-5b1d-724b-30f995d6eeca@spreadshirt.net>
Content-Language: nl
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Thanks for the link!=20

In this I'm a newbie, though.=20

I have a network at home behind a DSL router, and want to jump to =
LocalIN with any packet that comes from my home network. I know the =
first line does that with IPv4 packets, but I want to do it with IPv6 =
packets too.=20

I realized my problem with your answer was my not understanding the =
terms ' Unique-Local' and ' Link-Local Unicast'. With the help of =
https://en.wikipedia.org/wiki/Unique_local_address I now understand that =
I should use fc00::/7 instead of fe::/10 (what faulty for fe00::/10), =
and similarly re the Link-Local Unicast.=20

I have now=20

                ip saddr 192.168.178.0/24 jump LocalIN
                ip6 saddr { fc00::/7, fe80::/10} jump LocalIN

And trust that this set of rules does the trick. Thanks, Florian and =
Bernd!

Regards,
Paul=20

-----Original Message-----
From: Bernd Naumann <bena@spreadshirt.net>=20
Sent: Friday, October 9, 2020 3:17 PM
To: netfilter@vger.kernel.org
Subject: Re: Newbie: IPv6 equivalent of 192.168.178.0/24

On 09.10.20 14:49, paul.guijt@gmail.com wrote:
> I had
> 	add rule  inet filter input ip   saddr 192.168.178.0/24         jump =
LocalIN
> 	add rule  inet filter input ip6 saddr fe::/10                         =
    jump LocalIN
> to divert all packets coming from my private network to rules in the =
LocalIN chain.
>=20
> Nftables converts the second line into =E2=80=9Cip6 saddr c0::/10 jump =
LocalIN=E2=80=9D. FE into C0.
> Will that do what I intended? If not, what rule do you prefer?
>=20
> Regards,
> Paul Guijt
>=20
>=20

Hi Paul,

 From
https://www.iana.org/assignments/iana-ipv6-special-registry/iana-ipv6-spe=
cial-registry.xhtml

 > fc00::/7 	Unique-Local
 > fe80::/10 	Link-Local Unicast

I assume you want both in your case. ULA (unique local addr) and =
link-local.
Or, if you do not want to allow the whole ULA space, maybe just i.e. a =
`/48`, like i.e. openwrt generates for you automatically.
A use case to not accept the whole fc00::/10 would be if you are =
connected to i.e. dn42, or another community VPNs, which makes use of =
ULA.

Best,
Bernd

