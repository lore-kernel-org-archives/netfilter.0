From: Julien Vehent <julien@linuxwall.info>
Subject: Re: iptables traffic shaping question
Date: Wed, 02 Sep 2009 15:12:06 +0200
Message-ID: <666660245e57b9ee21d773e20fb95411@localhost>
References: <4A9E6804.3060300@infoservices.in> <9151ac2a0909020608g3139b1detc505b80e5d609ced@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9151ac2a0909020608g3139b1detc505b80e5d609ced@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Filip Sneppe <filip.sneppe@gmail.com>
Cc: "J. Bakshi" <joydeep@infoservices.in>, netfilter@vger.kernel.org

On Wed, 2 Sep 2009 15:08:39 +0200, Filip Sneppe <filip.sneppe@gmail.com=
>
wrote:
> Hi,
>=20
> On Wed, Sep 2, 2009 at 2:41 PM, J. Bakshi<joydeep@infoservices.in>
wrote:
>> Dear list,
>>
>>
>> I like to get a good response ( min wait ) from my ssh and =C2=A0sta=
ble (
max
>> throughput ) connection from the apache running at a remote server. =
Is
>> there any setting =C2=A0in iptables which allow me to set in my serv=
er
>> accordingly ?
>>
> iptables isn't really the tool for this. look into the "tc" command o=
f
the
> iproute package.
>=20
> I used to go to this site:
>=20
> http://lartc.org/
>=20
> It's still, up although it looks unmaintained.

LARTC is unmaintained, but, AFAIK, none of the components regarding
traffic control described there have changed.
Maybe somebody more aware of the recent developments could confirm...


Julien

>=20
> Best regards,
> Filip


