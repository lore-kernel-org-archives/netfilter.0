From: Michal =?utf-8?B?S3ViZcSNZWs=?= <mkubecek@suse.cz>
Subject: Re: -f option used with iptables
Date: Tue, 07 Aug 2012 08:15:54 +0200
Message-ID: <1723425.lveZBpEbj8@alaris>
References: <CAE1WnGfTxjoEov7QCU0W32Z=Uy9y+rSEmCzZ94KiB0__AjSvmQ@mail.gmail.com>
Reply-To: Michal =?utf-8?B?S3ViZcSNZWs=?= <mkubecek@suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAE1WnGfTxjoEov7QCU0W32Z=Uy9y+rSEmCzZ94KiB0__AjSvmQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter <netfilter@vger.kernel.org>
Cc: rahul shrivastava <shrivastavaone@gmail.com>

On Monday 06 of August 2012 20:00EN, rahul shrivastava wrote:
>=20
> my objective is to drop all fragmented packets on my system
> following rules are used

Not a good idea, IMHO.

> iptables -A INPUT -f -j DROP
> iptables -A OUTPUT -f -j DROP
> iptables -A FORWARD -f -j DROP

This doesn't drop every fragmented packet, only second and further=20
fragments. Thus the first fragment passes through, waits in a queue=20
until it times out (30 seconds on my system) and then causes a=20
"fragmentation timeout exceeded" ICMP message.

> i am using ping -s 32768 10.2.2.2 for generating fragments

You should at least tell where are the rules from above set. On the=20
system sending the packets, on the system receiving the packets or=20
somewhere between them? Also don't forget to mention the kernel version=
=2E

                                                      Michal Kube=E8ek

