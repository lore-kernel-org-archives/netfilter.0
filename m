From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Loopback security...
Date: Wed, 23 Apr 2008 11:07:13 +0200
Message-ID: <480EFC41.2030209@plouf.fr.eu.org>
References: <480D47F6.9080808@riverviewtech.net> <480DC570.80303@solutti.com.br> <480DF156.5060801@riverviewtech.net> <480E1752.2040308@solutti.com.br> <480E4596.9030000@riverviewtech.net> <480E49CF.1040405@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480E49CF.1040405@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Leonardo Rodrigues Magalh=E3es a =E9crit :
>=20
> have you tried getting a new bridge device and bridging eth0 and lo0 =
???

It won't work. You cannot brigde the loopback interface because its lin=
k=20
type is not ethernet.
