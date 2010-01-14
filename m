From: =?UTF-8?Q?Henno_T=C3=A4ht?= <henno.taht@diara.ee>
Subject: Double NAT port forward
Date: Thu, 14 Jan 2010 22:33:02 +0200
Message-ID: <6bc5618e1001141233k5cd1513fnbd5a41902aff12c6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello!

Is it possible to make double nat port forward? Topology:

SOME INTERNET MACHINE
1.1.1.1 (real public IP)

       V

OUTER_GW
eth0: 2.2.2.228/27 (real public IP)
eth1: 192.168.1.1/24

        V

INNER_GW
eth0: 192.168.1.2/24
eth1: 2.2.2.225/27 (fake public IP)

        V

HOST
eth0: 2.2.2.249/27 (fake public IP)

I'm trying to set up simulated "real" environment for testing my
webserver. I plan to remote desktop into that subnet through double
port forwards and see how the server behaves.

While OUTER_GW forwards port 222 to INNER_GW just fine, INNER_GW sees
the SYN packet the OUTER_GW has passed it but doesn't forward it to
HOST:

root@pm-inner-gw:~# tshark -Nm -i eth0 host ! 192.168.1.1
Running as user "root" and group "root". This could be dangerous.
Capturing on eth0
  0.000000 1.1.1.1 -> 192.168.1.2  TCP 1271 > 222 [SYN] Seq=3D0
Win=3D65535 Len=3D0 MSS=3D1460
  0.439790  192.168.1.2 -> 1.1.1.1 ICMP Destination unreachable (Host
unreachable)
  0.440287  192.168.1.2 -> 1.1.1.1 ICMP Destination unreachable (Host
unreachable)
  2.964403 1.1.1.1 -> 192.168.1.2  TCP 1271 > 222 [SYN] Seq=3D0
Win=3D65535 Len=3D0 MSS=3D1460
  5.969749  192.168.1.2 -> 1.1.1.1 ICMP Destination unreachable (Host
unreachable)

Is there some sort of "security feature" in the kernel that doesn't
allow packets to be forwarded from IANA's "private IP" to a "public
IP"?

TIA,
Henno T=C3=A4ht
