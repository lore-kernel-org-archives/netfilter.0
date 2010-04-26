From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Problem with rdate and iptables
Date: Mon, 26 Apr 2010 13:28:32 +0200
Message-ID: <4BD578E0.4040606@plouf.fr.eu.org>
References: <hqstu1$7hm$1@dough.gmane.org> <4BD42D81.1000501@plouf.fr.eu.org> <4BD562D8.9080408@livejournal.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BD562D8.9080408@livejournal.dk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Bauman <baumane@livejournal.dk>
Cc: netfilter@vger.kernel.org

Eric Bauman a =E9crit :
>=20
> This is an rdate client accessing a timeserver.
>=20
> The only only other rules I have are default policies (DROP for INPUT=
=20
> and FORWARD, and ACCEPT for OUTPUT), ACCEPT for all loopback traffic,=
=20
> and ACCEPT for various incoming ports (eg. HTTP etc.).
>=20
> It works fine with all rules removed, and it works fine over TCP with=
=20
> all rules enabled.

Could you capture the time query and reply packets (port 37) with a
packet sniffer such as tcpdump or wireshark ?
