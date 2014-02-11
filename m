From: "Carlos R. Pasqualini" <cpasqualini@concordia.gob.ar>
Subject: Nat troubles or just a plain error?
Date: Tue, 11 Feb 2014 08:26:08 -0300
Message-ID: <1392117968.19963.21.camel@cpasqualini-nb.concordia.gob.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi list!


i have a firewall/gateway on our network, upgraded it from an old Debia=
n
Lenny to Wheezy (3.2) but things do not work as before.


=C2=BFwas there some change that i may be missing?
or i am doing something wrong this time?


the firewall it's placed between the LAN (and some VLANs), DMZ, VPN and
two internet links (plain DHCP on eth0 and a pppoe DSL on ppp0)

/sbin/iptables -t filter -F
/sbin/iptables -t filter -X
/sbin/iptables -t filter -Z
/sbin/iptables -t mangle -F
/sbin/iptables -t mangle -X
/sbin/iptables -t mangle -Z
/sbin/iptables -t nat -F
/sbin/iptables -t nat -X
/sbin/iptables -t nat -Z
/sbin/iptables -N bad_tcp_packets
/sbin/iptables -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -=
j
REJECT
/sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
/sbin/iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
/sbin/iptables -t nat -A POSTROUTING -s 192.168.0.0/16 -o eth1 -j
MASQUERADE
/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEP=
T
=2E...
/sbin/iptables -A FORWARD -p tcp -i eth2 -o eth0 --dport 443 -j ACCEPT
/sbin/iptables -A FORWARD -p tcp -i eth2 -o ppp0 --dport 443 -j ACCEPT
/sbin/iptables -A FORWARD -p udp -i eth2 -o eth0 --dport 443 -j ACCEPT
/sbin/iptables -A FORWARD -p udp -i eth2 -o ppp0 --dport 443 -j ACCEPT
=2E..
/sbin/iptables -A INPUT -p tcp -i eth2 --dport 3128 -j ACCEPT
/sbin/iptables -t nat -A PREROUTING -i eth2 -p tcp --dport 80 ! -d
192.168.0.0/16 -j REDIRECT --to-port 3128
/sbin/iptables -t nat -A PREROUTING -i eth2 -p tcp --dport 8080 -j
REDIRECT --to-port 3128
=2E.....
# the last rules:
/sbin/iptables -A FORWARD -j REJECT
/sbin/iptables -A INPUT -j REJECT



As you can see, i'm not doing DROP neither a DROP policy; i'm using an
ACCEPT policy and REJECTs for debugging as sugested on
http://major.io/2010/04/12/best-practices-iptables/ (and seems to be
helping me on other things).

The default gw is on ppp0, the second ISP (on eth0) is used to access
only some IP ranges, and another ones are routed through the DMZ.


I'm having trouble to see some https sites that should go on the ppp0
interface if i don't use the proxy and i need it to be transparent (on
plain HTTP).



Thanks!


