From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Match packet address against addresses on interface
Date: Sun, 12 Feb 2017 09:59:14 +0100
Message-ID: <568f0d90-e6e6-f1ac-4d9b-27b3b21438da@plouf.fr.eu.org>
References: <20170211171321.GC31183@weiser.dinsnail.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20170211171321.GC31183@weiser.dinsnail.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Michael Weiser <michael@weiser.dinsnail.net>
Cc: netfilter@vger.kernel.org

Le 11/02/2017 =E0 18:13, Michael Weiser a =E9crit :
>
> is there an elegant way in either ip{,6}tables or nftables to match
> addresses in packets against all the addresses set on a specific local
> interface?

For the interface the packet is coming in or going out, maybe with the=20
iptables 'addrtype' match.

