From: Pandu Poluan <pandu@poluan.info>
Subject: How to insert a firewall with "gateway spoofing"?
Date: Tue, 22 Nov 2011 12:43:31 +0700
Message-ID: <CAA2qdGVFdUfO6GhAHX0Qf6L45_8sG6ZY1m=GquimuatetFWm=w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello, I need some suggestions.

(If the ASCII diagrams get messed up, I've uploaded them to
http://pastebin.com/SbbWKds0

I have a network that looks like this:

    ISP
     |
     |
     | wan1 =3D unknown
+----o----+
|  Router |
+----o----+
     | lan1 =3D 192.168.0.1/24 + DHCP
     |
     |
     |
 /\/\/\/\/\
<   LAN    >   192.168.0.0/24
 \/\/\/\/\/

The Router is off-limits to me (it's the ISP's, and I am not given any
access to the router).

I need to "insert" a firewall like this:

    ISP
     |
     |
     | wan1 =3D unknown
+----o----+
|  Router |
+----o----+
     | lan1 =3D 192.168.0.1/24 + DHCP
     |
     | eth1 =3D 192.168.0.2
+----o----+
|  Linux  |
+----o----+
     | eth0 =3D 192.168.0.1/24 + DHCP
     | ( dest=3D=3D192.168.0.3 =3D=3DDNAT=3D=3D> 192.168.0.1 via eth1 )
     |
     |
 /\/\/\/\/\
<   LAN    >   192.168.0.0/24
 \/\/\/\/\/

=46or some complicated reasons, I can't change the subnet address of th=
e
LAN, nor can I change the default gateway for the systems in the LAN.
And since I can't reconf the Router, I have to "spoof" the router.

Is it doable just with iptables and iproute2? Or do I have to also go
down the route of ebtables?

And if it is doable, what caveats must I be aware of?

Thanks in advance.

Rgds,
--=20
=46dS Pandu E Poluan
~ IT Optimizer ~

=C2=A0=E2=80=A2 LOPSA Member #15248
=C2=A0=E2=80=A2 Blog : http://pepoluan.tumblr.com
=C2=A0=E2=80=A2 Linked-In : http://id.linkedin.com/in/pepoluan
