From: Eric Leblond <eric@regit.org>
Subject: Re: mysql remote connections
Date: Mon, 01 Mar 2004 21:09:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078171758.1848.1.camel@localhost>
References: <009001c3ffc8$5eacc970$3901a8c0@AFBWholesale.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <009001c3ffc8$5eacc970$3901a8c0@AFBWholesale.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset=; charset="utf-8"
To: Robert Gil <rgil@bodybuildingdiscount.com>
Cc: netfilter@lists.netfilter.org

On some distro mysql doest not listen on tcp=20
check this with :
	netstat -ltp
you may have to enable it in mysql.conf

BR,

Le lun 01/03/2004 =C3=A0 21:04, Robert Gil a =C3=A9crit :
> mysql port is 3306.... its currently running on the same box as the firew=
all
> just for testing purposes... but i cant figure out why i cant connect
> remotely.. im sure its just a careless mistake somewhere or a mixup.. if
> somone can just take a quick peek i would appreciate it alot.
>=20
> # Start With Everything Closed
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -P OUTPUT ACCEPT
>=20
> # Connection Tracking
> #TCP
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
>=20
> #ICMP
> iptables -A OUTPUT -p icmp -m state --state NEW,ESTABLISHED,RELATED -j
> ACCEPT
> iptables -A INPUT -p icmp -m state --state ESTABLISHED,RELATED  -j ACCEPT
>=20
> # Open Ports
>=20
> iptables -A INPUT -j ACCEPT -p tcp --dport 80
> iptables -A INPUT -j ACCEPT -p tcp --dport 21
> iptables -A INPUT -j ACCEPT -p tcp --dport 110
> iptables -A INPUT -j ACCEPT -p tcp --dport 25
> iptables -A INPUT -j ACCEPT -p tcp --dport 22
> iptables -A INPUT -j ACCEPT -p tcp --dport 3389
> iptables -A INPUT -j ACCEPT -p tcp --dport 3306
> iptables -A INPUT -j ACCEPT -p tcp --dport 2121
> iptables -A INPUT -j ACCEPT -p tcp --dport 53
>=20
> # Masquerading and NAT
> iptables -t nat -A POSTROUTING -s 192.168.1.2 -j MASQUERADE
> iptables -A FORWARD -j ACCEPT -i eth1 -s 192.168.1.2
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>=20
> # Terminal Services Forwarding
> iptables -A FORWARD -j ACCEPT -p tcp --dport 3389
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 3389 -j DNAT --to
> 192.168.1.2:3389
>=20
> # MS BOX FTP Fowarding
> iptables -A FORWARD -j ACCEPT -p tcp --dport 2121
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 2121 -j DNAT --to
> 192.168.1.2:2121
>=20
> # Flood Protection
> # SYN
> iptables -A FORWARD -p tcp --syn -m limit --limit 1/s -j ACCEPT
>=20
> # Port Scan
> iptables -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --lim=
it
> 1/s -j ACCEPT
>=20
> # Ping Of Death
> iptables -A FORWARD -p icmp --icmp-type echo-request -m limit --limit 1/s=
 -j
> ACCEPT
>=20
> # Enable Forwarding
> echo 1 > /proc/sys/net/ipv4/ip_forward
>=20
>=20


