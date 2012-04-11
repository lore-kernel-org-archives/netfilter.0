From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Confusion about filtering traffic in a bridge scenario
Date: Wed, 11 Apr 2012 17:13:52 +0200
Message-ID: <4F859FB0.9070107@freemail.hu>
References: <4F859C03.1080803@lebertbro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F859C03.1080803@lebertbro.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Marc <ccc@lebertbro.com>
Cc: netfilter@vger.kernel.org

Hi Marc,

2012-04-11 16:58 keltez=E9ssel, Marc =EDrta:
> Hello,
>
> I was/am trying to setup packet filtering on a virtualisation host an=
d
> couldnt get it to work and was hoping for some pointers.
>
> Heres the setup:
>
> Said host has:
> eth0 - the physical interface, no address assigned
> br0 - the bridge interface, has IP 10.0.0.1 and gateway and default
> route assigned to it
> veth0 - the virtual interface for one of the VMs, has IP 192.168.0.1
>
> both eth0 and veth0 are added to the bridge, the networking setup is
> functional, however I seem to be unable to filter traffic to the VM w=
ith
> iptables. Heres what Ive tried:
If I were you, I would set up my network as follows:

Real network
- eth0: IP: 10.0.0.1 Gateway: w.x.y.z

Virtual network
- br0:  IP:192.168.0.254 (this is the "internal" "network" of VMs)
- veth0: IP: 192.168.0.1 Gateway: 192.168.0.254 (a virtual interface of=
=20
a VM)

The VMs would see your host as a gateway... With this setup you can=20
simply use the FORWARD chain for NAT/filter/etc....

Swifty
