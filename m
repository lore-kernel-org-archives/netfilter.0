From: Elison.Niven@matrixtelesol.com
Subject: iptables resources consumed
Date: Wed, 2 Jul 2008 09:59:53 +0530
Message-ID: <VPOP31.4.0e.20080702095953.250.a.1.00149acd@matrixindia>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: netfilter@vger.kernel.org

Hi List,

I am looking to run iptables on an embedded powerpc system.
It=92s the first time I=92ll be using it. I need to have a few confusio=
ns cleared out.

There are three ethernet interfaces on the system: eth0, eth1 and eth2.
___________________________________
|                                  |
|         ___________              |
|        |           |             |
|        |  Powerpc  |             |
|        |           eth2          |
|        |           |             |
|        |_eth0_eth1_|             |
|                                  |
|       _______        ________    |
|_______|      |_______|       |___|
         eth0           eth1

eth0 and eth1 are external interfaces to the system. eth2 is internal.
eth2 is connected to another L2 switch on the same board behind which a=
re 8 DSPs.

=46or now do not consider eth1. There are only 2 interfaces eth0 and et=
h2.

I need to forward UDP packets received on eth0 to eth2 and send them to=
 a particular DSP, and also forward packets received on eth2 to eth0.

General rule: All outgoing packets from eth0 should have src ip =3D eth=
0 ip.

Example rules:

Rule 1: a)Packets received on eth0 with src IP address =3D X, dest port=
 =3D 8000 should be sent to DSP1, port =3D 8000.
b)Packets received on eth2 (i.e from the L2switch) with src IP =3D DSP1=
 IP OR dest IP =3D X, dest port =3D 10000 should be sent on eth0 to IP =
address X, port =3D 10000.

Rule 2: a)Packets received on eth0 with src IP address =3D Y, dest port=
 =3D 9000 should be sent to DSP2, port =3D 9000.
b)Packets received on eth2 (i.e from the L2switch) with src ip =3D DSP2=
 IP OR dest IP =3D Y, dest port =3D 11000 should be sent on eth0 to IP =
address Y, port =3D 11000.

I will have a maximum of 256 such rules i.e effectively 256*2 =3D 512 r=
ules. (256 for packets received on eth0, 256 for packets received on et=
h2)

I am assuming that a packet is received every 20 ms on eth0 and eth2 fo=
r a single rule.
So for a total of 256, 256 packets are received every 20 ms on eth0 and=
 256 packets are received every 20 ms on eth2.

Or I can make eth2 IP address as the default gateway of all the DSPs. T=
he DSPs will send packets with dest IP address =3D X, Y etc. These pack=
ets should be sent out through eth0 and should have source IP =3D eth0.=
 This will eliminate rules 1b and 2b above. Thus, packet filtering to r=
ead src IP and dest port will only be on eth0. Now total rules will be =
256.

The processor will be running at 400 MHz, 256 MB DDR2 RAM using Linux k=
ernel 2.6.10.

Will it be able to do this task and also run the main application? How =
much resources will iptables require?

Regards,
Elison



