From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Routing through PtP and iptables
Date: Sat, 13 May 2006 01:56:57 +0200
Message-ID: <446520C9.4040604@plouf.fr.eu.org>
References: <200605122335.10078.antonio.dibacco@aruba.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200605122335.10078.antonio.dibacco@aruba.it>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Antonio Di Bacco a =E9crit :
>=20
> I have two identical linux boxes (A e B), each one with two interfaces:=
 an=20
> ethernet (eth0 with ip 192.168.1.50) and an hdlc (hdlc0). The two boxes=
 are=20
> only connected via a link through their hdlc interfaces. Because they h=
ave to=20
> be  exactly the same, if I have to assign an ip address to hdlc0 of A t=
hen=20
> the hdlc0 of B should have the same ip address. Each one should have a=20
> default route that cannot coincide with the hdlc interface. Every linux=
 box=20
> has a web server. When I connect with my notebook to box A I want to re=
ach=20
> the web server on A typing in my browser http://192.168.1.50 and I want=
 to=20
> reach web server on B typing http://192.168.1.50:8080 .
> Some one knows how could it be possible?

I would choose a "fake" unused address $FAKE_IP, route it through the=20
HDLC interface and NAT traffic on the HDLC link so that both source and=20
destination addresses appear to be $FAKE_IP. Of course this address must=20
not be assigned to any interface, else traffic to that address would be=20
routed locally and that's not what you want.

Same setup on both boxes (not tested) :

# IP forwarding is assumed to be enabled by any means, e.g.
sysctl -w net.ipv4.ip_forward=3D1
# or
echo 1 > /proc/sys/net/ipv6/ip_forward

# add route to the fake address using 'route'
route add $FAKE_IP dev 'hdlc0'
# or using 'ip'
ip route add $FAKE_IP dev hdlc0

# forwarding box setup
# 1st step : NAT destination 192.168.1.50:8080 -> $FAKE_IP:80
iptables -t nat -A PREROUTING -d 192.168.1.50 -p tcp --dport 8080 \
   -j DNAT --to-destination $FAKE_IP:80

# 2nd step : NAT source on HDLC -> $FAKE_IP (for return path)
iptables -t nat -A POSTROUTING -o hdlc0 -d $FAKE_IP \
   -j SNAT --to-source $FAKE_IP

# server box setup
# NAT destination on HDLC $FAKE_IP -> 192.168.1.50
iptables -t nat -A PREROUTING -i hdlc0 -d $FAKE_IP \
   -j DNAT --to-destination 192.168.1.50

