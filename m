From: Carlos Ble <carlosble@terra.es>
Subject: Re: netfilter and squid transparent proxy
Date: Tue, 1 Apr 2003 17:48:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E190Ow7-0000yp-00@Alfa.linuxserver1.net>
Reply-To: carlosble@terra.es
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

>Il 17:42, marted=EC 1 aprile 2003, Carlos Ble ha scritto:
>> Hi all.I'm new in the mailinglist.
>> I have a linux router with 3 ethernet interfaces:
>> eth0 is my LAN, eth1 and eth2 are internet gateways.
>> My system default gateway is eth2.
>> At the moment im working with mangle table to mark packets and
>> to use two gateways; http goes across eth1 and
>> other protocols goes across eth2, for example.
>> This is ok. Everything works ok.
>
> great, this is what i'm trying to do with my system. can you send me your
> route/iptables configuration or scripts?

>Best Regards

>--=20
>Davide Giunchi

Ok Davide, here you are:
The documentation is in http://lartc.org/
At the first you need iproute2 tools.=20
This are the rules:
# Activar forwarding:
echo 1 > /proc/sys/net/ipv4/ip_forward
# Hacer Masquerade para salir a internet:
iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE
iptables -t nat -A POSTROUTING -o eth3 -j MASQUERADE

# marcar http:
iptables -A PREROUTING -i eth0 -t mangle -p tcp --dport 80 \
 -j MARK --set-mark 1
iptables -A PREROUTING -i eth0 -t mangle -p udp --dport 80 \
 -j MARK --set-mark 1

# marcar https:
iptables -A PREROUTING -i eth0 -t mangle -p tcp --dport 443 \
 -j MARK --set-mark 1
iptables -A PREROUTING -i eth0 -t mangle -p udp --dport 443 \
 -j MARK --set-mark 1

# marcar secure shell (ssh):
iptables -A PREROUTING -i eth0 -t mangle -p tcp --dport 22 \
 -j MARK --set-mark 1
iptables -A PREROUTING -i eth0 -t mangle -p udp --dport 22 \
 -j MARK --set-mark 1

# marcar smtp:
iptables -A PREROUTING -i eth0 -t mangle -p tcp --dport 25 \
 -j MARK --set-mark 2
iptables -A PREROUTING -i eth0 -t mangle -p udp --dport 25 \
 -j MARK --set-mark 2

# marcar ssmtp (smtp sobre ssl):
iptables -A PREROUTING -i eth0 -t mangle -p tcp --dport 465 \
 -j MARK --set-mark 2

# marcar ftp:
iptables -A PREROUTING -i eth0 -t mangle -p tcp --dport 20 \
 -j MARK --set-mark 2
iptables -A PREROUTING -i eth0 -t mangle -p tcp --dport 21 \
 -j MARK --set-mark 2


# Deshabilitar filtrado de ruta inversa:
echo 0 > /proc/sys/net/ipv4/conf/eth2/rp_filter
echo 0 > /proc/sys/net/ipv4/conf/eth3/rp_filter
echo 0 > /proc/sys/net/ipv4/conf/eth0/rp_filter
echo 0 > /proc/sys/net/ipv4/conf/all/rp_filter
echo 0 > /proc/sys/net/ipv4/conf/default/rp_filter
echo 0 > /proc/sys/net/ipv4/conf/lo/rp_filter

# Do this only one at the first time:
echo "201  table1 " > /etc/iproute2/rt_tables
echo "202  table2 " > /etc/iproute2/rt_tables


ip rule add fwmark 1 table table1
ip rule add fwmark 2 table table2

ip route add default via <YOUR eth2 IP> dev eth2 table table1
ip route add default via <YOUR eth3 IP>  dev eth3 table table2

ip route flush cache



Good luck :)

-----------
Carlos Ble
email: carlosble@terra.es,
       tecnico@wireless-canarias.com,
       alu2388@csi.ull.es
irc.oftc.net: kharly_
irc.irc-hispano.org: kharly_

Impulsado por Debian/GNU Linux

