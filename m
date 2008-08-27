From: bsilva <bsilva@sonic.net>
Subject: Re: Connecting an host with a subnet to a LAN with different subnet
Date: Wed, 27 Aug 2008 12:04:07 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0808271159550.3508@bolt.sonic.net>
References: <F1F6EC0C8B75034F9E3A79FC85122E8E01000E0D@aquib01a>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <F1F6EC0C8B75034F9E3A79FC85122E8E01000E0D@aquib01a>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: DI BACCO ANTONIO - technolabs <Antonio.DiBacco@technolabs.it>
Cc: netfilter@vger.kernel.org


There may be subtlties to your problem that this solution cannot address,
but a simpler solution and one that I've used many times is to give the
machine a secondary IP address on the same interface.

i.e.  "ifconfig eth0:1 192.168.0.x"

Then both addresses are present on the system.


Regards,
Brad


On Wed, 27 Aug 2008, DI BACCO ANTONIO - technolabs wrote:

>
>
> I have a LAN with a given subnet, let us say: 192.168.0.0/24  with a lot
> of hosts. Now I want to connect another host (PLUTO) with an interface
> that has  address 10.10.10.1 and netmask 255.255.255.0. I can't change
> this ip address but I want to insert some iptables rules on PLUTO to
> translate both source and dest ip address of the packets it receives to
> subnet 10.10.10.0/24 and viceversa. I think that target NETMAP can help
> me, but I'm getting confused.
>
> Bye,
> Antonio.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
