From: "Marcelo Mercio Dandrea" <marcdan@terra.com.br>
Subject: H323 conntrack problem
Date: Mon, 15 Mar 2004 18:13:16 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <028801c40ad2$55d15a90$010a0a0a@SHINOBU>
References: <20040315182648.GA21132@legolas.on.net.mk> <20040315200404.GL10272@home.manuelm.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org


    Hello all,

    Im having some problems using FXS devices with the H323 conntrack
patch...
    So far, I tried two main (simulated at home) setups:

    1) First setup, works fine

   A------------B=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3DC

10.10.10.1       200.198.105.33           200.198.105.35

  Being A and C FXS voice boxes by Furukawa and B a Linux Gateway running
2.4.25 with H323 conntrack support  from the lastest patch-o-matic and
iptables 1.2.9. On the Linux Gateway, eth0 is the valid IP interface and
eth1 is the invalid net.
  In this setup, there is just one NAT. I loaded the ip_conntrack_h323 and
ip_nat_h323 modules on B and used just one redirect and one snat line on
iptables:

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 200.198.105.33
iptables -t nat -A PREROUTING -i eth0 -p tcp -m multiport --dports
1503,1720 -j DNAT  --to-destination 10.10.10.1

    With this setup everything works fine.... voice on both directions,
independent of who is calling.

 2) Now the second and (so far) problematic setup:

    A------------B=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3DC------------D
10.10.10.1       200.198.105.33           200.198.105.35        192.168.1.1


    Being A and D FXS voice gateways by Furukawa and B and C Linux Gateways.
    Again, on both boxes Im running Linux 2.4.25 with H323 conntrack support
from the latest path-o-matic and iptables 1.2.9
    This is the iptables setup:

    Host B:

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 200.198.105.33
iptables -t nat -A PREROUTING -i eth0 -p tcp -m multiport --dports
1503,1720 -j DNAT  --to-destination 10.10.10.1

    Host C:

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 200.198.105.35
iptables -t nat -A PREROUTING -i eth0 -p tcp -m multiport --dports
1503,1720 -j DNAT  --to-destination 192.168.1.1

    Now there are two Nats.. and if I dial from A to D, D can hear A but A
cant hear D, and vice-versa. Using tcpdump, I found out that after the
connection, A tries to send the UDP voice packets (port 16384,16385) to
192.168.1.1 (invalid IP from D) , and not to 200.198.105.35.... it took me
some time to find this
out, since before D ip was also 10.10.10.1, and then the voice packets from
A never even reached B :p
    Its seems that when A dials D and D answers, the H323 conntrack system
on C doesnt change some field on the apllication level of the protocol H323
protocol for D=B4s packets... so it in spite of the level 4 aspect of packet
is correctly SNATted by C, the level 7  aspect still carries the invalid IP
from D...
    I just couldnt fix this.
    Another odd thing... just for the sake of it, I tried to load the
RTSP_CONNTRACK module,
    modprobe ip_rtsp_conntrack ports=3D16384 (the RTSP port configured on t=
he
Furukawa boxes).. then it simples worked.. voice on both sides.. but only
once... If I dial again, stops working. Not sure if this is related at all..
I suppose is just an odd coincidence.
    If you need any more info, just let me know... what really bothers me is
that everything is fine with just one nat...

                    Many thanks in advance, for any help


                                                        Marcelo


