From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Mapping multiple interfaces to a single IP address
Date: Thu, 01 Oct 2009 18:06:08 +0200
Message-ID: <4AC4D370.6090503@freemail.hu>
References: <145d4e1a0910010330r216e68cch763b6c7a4b954992@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <145d4e1a0910010330r216e68cch763b6c7a4b954992@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Javier_G=E1lvez_Guerrero?= <javier.galvez.guerrero@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

Javier G=E1lvez Guerrero =EDrta:
> Hi there,
>
> I would like to know if it is possible to map multiple network
> interfaces into a single IP address in order to perform load balancin=
g
> and network channels virtualization/abstraction tasks. If so, could
> you please point me to the proper iptables modules that are needed in
> client and routing elements?
>  =20
You may have the same ip address on multiple interfaces.
I have a following setup:

br1       Link encap:Ethernet
          inet addr:172.16.1.254  Bcast:172.16.1.255  Mask:255.255.254.=
0
=2E..

lan1      Link encap:Ethernet
          inet addr:172.16.1.254  Bcast:172.16.1.255  Mask:255.255.254.=
0

=2E..

vpn-bia   Link encap:UNSPEC
          inet addr:172.16.1.254  P-t-P:192.168.10.254  Mask:255.255.25=
5.255
=2E..

In this scenario I have three physical NICs: lan1, wan1, mfl1.
I have also some vlans.

lan1 connected to the local subnet.
br1 consist of vlan100 and vpn1. These are virtual interfaces.
The endpoint of vpn1 is on wan1. vlan100 is on lan1.
vpn-bia is a tunnel over the mfl1 connection.

So it is all working. But you have to have some routing rules.
These are mine:


