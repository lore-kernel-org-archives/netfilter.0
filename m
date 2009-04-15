From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: mask 10 -> 29
Date: Wed, 15 Apr 2009 18:37:51 +0200
Message-ID: <49E60D5F.9070806@freemail.hu>
References: <49E6044F.5070305@lab.vectoris.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49E6044F.5070305@lab.vectoris.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "Mihamina Rakotomandimby (R12y)" <mihamina@lab.vectoris.fr>
Cc: netfilter@vger.kernel.org

Hi,

Mihamina Rakotomandimby (R12y) =EDrta:
> Hi,
> I have this kind of shell script in order to set something on a bunch=
=20
> of IP addresses:
>
> for ACCEPTED_MACHINE in \
>     192.168.0.10 \
=2E..
>    192.168.0.29
> do
> $IPTABLES [...]
> done
>
>
> How could I use a mask such as 192.168.0.0/NN to exactly match the li=
st?
> Thank you.
>
Use ipcalc!

The closest subnet is:

ipcalc 192.168.0.10/27
Address:   192.168.0.10         11000000.10101000.00000000.000 01010
Netmask:   255.255.255.224 =3D 27 11111111.11111111.11111111.111 00000
Wildcard:  0.0.0.31             00000000.00000000.00000000.000 11111
=3D>
Network:   192.168.0.0/27       11000000.10101000.00000000.000 00000
HostMin:   192.168.0.1          11000000.10101000.00000000.000 00001
HostMax:   192.168.0.30         11000000.10101000.00000000.000 11110
Broadcast: 192.168.0.31         11000000.10101000.00000000.000 11111
Hosts/Net: 30                    Class C, Private Internet

Check HosMin and HostMax!

Swifty


