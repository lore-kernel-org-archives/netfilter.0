From: Thomas Witt <lists@thwitt.de>
Subject: Re: nftables: no table for ipv6
Date: Mon, 28 Jul 2014 18:28:40 +0200
Message-ID: <53D67A38.1090405@thwitt.de>
References: <53D67106.2070600@thwitt.de> <53D6757C.7090801@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <53D6757C.7090801@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

On 28/07/14 18:08, =C3=81lvaro Neira Ayuso wrote:
> If you write nft list tables, you will see only the tables of ipv4. T=
ry
> with nft list tables ip6 for ipv6 or nft list tables inet for inet.
>=20
> Try with that and tell me the result.
>=20
> I hope that I have helped you.


That indeed helped me, thank you.
