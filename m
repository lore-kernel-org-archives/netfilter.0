From: Laszlo Attila Toth <panther@balabit.hu>
Subject: Re: ftp_conntrack and encrypted FTP
Date: Fri, 09 Nov 2007 13:04:47 +0100
Message-ID: <47344CDF.7080008@balabit.hu>
References: <47344111.2020005@solutti.com.br>
Reply-To: panther@balabit.hu
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47344111.2020005@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Cc: netfilter ML <netfilter@vger.kernel.org>

Leonardo Rodrigues Magalh=E3es wrote:
>=20
>    Hello Guys,
>=20
>    I'm having some troubles with encrypted FTP connections. As i coul=
d=20
> imagine, conntrack_ftp and nat_ftp are not being able of recognizing =
the=20
> correct ports to open because the connection is encrypted and the PAS=
V=20
> information is not seen by the modules.
>=20
>    I dont think so ..... but is there any way of working around this =
??
>=20

Use unencrypted ftp (which is insecure and not recommended) or forget=20
conntrack for this because encrypted channels cannot be on the fly=20
decrypted without the keys used for encryption.

--=20
Attila
