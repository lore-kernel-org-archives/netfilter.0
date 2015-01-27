From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: modules required for ftp helper
Date: Tue, 27 Jan 2015 10:01:00 +0100
Message-ID: <54C753CC.9050605@plouf.fr.eu.org>
References: <20150127034744.GA5927@home.jasonmmiller.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20150127034744.GA5927@home.jasonmmiller.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jason Miller <jason@milr.com>
Cc: netfilter@vger.kernel.org

Jason Miller a =E9crit :
>=20
>   # /sbin/iptables -t filter -A OUTPUT -m helper --helper ftp -j ACCE=
PT
>   iptables: No chain/target/match by that name.
>=20
> Which modules are needed for this to work?

xt_helper
