From: "Adam N." <adam.n@justnet.pl>
Subject: Re: Conntrackd and Stats
Date: Thu, 01 Aug 2013 11:23:09 +0200
Message-ID: <d22255983d977623c2cb29dedbd9e717@justnet.pl>
References: <ebed8973f57495e3091005d880fcb4ca@justnet.pl>
 <1375345894.11948.5.camel@ice-age.regit.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=justnet.pl; s=dkim;
	h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version; bh=3e2o108TF2D7WW4q7PtikYGrvRve/T1blqOgw+Ho+/4=;
	b=fZJxgVY8QPb3c89HB4lZnMfWESd92nffHSdGX6BYyyyWLtjetGkfhmOKoWBfNvWnmYLVaIjtOpwkXrv6plwt95EqaeKu5MCmeeC2CFaR9adCCF4Sgf239DSrFK8all2YAyxR6vQN+SXLSvN3CQRge9bcfFq1+TEJvYTA8W/yZMc=;
In-Reply-To: <1375345894.11948.5.camel@ice-age.regit.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Eric Leblond <eric@regit.org>
Cc: netfilter@vger.kernel.org

W dniu 01.08.2013 10:31, Eric Leblond napisa=C5=82(a):

> Hi,
>=20
> Le jeudi 01 ao=C3=BBt 2013 =C3=A0 09:46 +0200, Adam N. a =C3=A9crit :
>=20
>> Hello everyone, At the beginning I would like to thank everyone for=20
>> the work put into the project netfilter.
>=20
> Thanks Adam :)
>=20
>> We use conntrackd projekt to save NAT connections. Recently we notic=
ed=20
>> that with the change of the kernel version also changed format logs(=
=20
>> disappeared amount of transferred packets and bytes). My question is=
:=20
>> Is it possible to restore the record containing the number of packet=
s=20
>> and bytes transferred in connection?
>=20
> You can do
> echo "1" > /proc/sys/net/netfilter/nf_conntrack_acct
>=20
> If you want to have start time of the conntrack entries, you can also=
=20
> do
>=20
> echo "1" > /proc/sys/net/netfilter/nf_conntrack_timestamp

Thank you very much
you know in what version of the kernel was presented=20
nf_conntrack_timestamp?

In order not to ask unnecessary questions in the future, are somewhere=20
information about such changes, except for the kernel sources :)

Pozdrawiam,
Adam N.
