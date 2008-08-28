From: "DI BACCO ANTONIO - technolabs" <Antonio.DiBacco@technolabs.it>
Subject: RE: Connecting an host with a subnet to a LAN with different subnet
Date: Thu, 28 Aug 2008 09:10:48 +0200
Message-ID: <F1F6EC0C8B75034F9E3A79FC85122E8E01000E1E@aquib01a>
References: <Pine.LNX.4.58.0808271159550.3508@bolt.sonic.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <Pine.LNX.4.58.0808271159550.3508@bolt.sonic.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: bsilva <bsilva@sonic.net>
Cc: netfilter@vger.kernel.org

This can be a good solution but my problem is that PLUTO cannot have th=
e 192.168.0.x address at all.

Thank you,
Antonio.=20

-----Original Message-----
=46rom: bsilva [mailto:bsilva@sonic.net]=20
Sent: mercoled=EC 27 agosto 2008 21.04
To: DI BACCO ANTONIO - technolabs
Cc: netfilter@vger.kernel.org
Subject: Re: Connecting an host with a subnet to a LAN with different s=
ubnet


There may be subtlties to your problem that this solution cannot addres=
s,
but a simpler solution and one that I've used many times is to give the
machine a secondary IP address on the same interface.

i.e.  "ifconfig eth0:1 192.168.0.x"

Then both addresses are present on the system.


Regards,
Brad


On Wed, 27 Aug 2008, DI BACCO ANTONIO - technolabs wrote:

>
>
> I have a LAN with a given subnet, let us say: 192.168.0.0/24  with a =
lot
> of hosts. Now I want to connect another host (PLUTO) with an interfac=
e
> that has  address 10.10.10.1 and netmask 255.255.255.0. I can't chang=
e
> this ip address but I want to insert some iptables rules on PLUTO to
> translate both source and dest ip address of the packets it receives =
to
> subnet 10.10.10.0/24 and viceversa. I think that target NETMAP can he=
lp
> me, but I'm getting confused.
>
> Bye,
> Antonio.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
