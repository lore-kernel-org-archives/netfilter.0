From: "Michael K" <micke@klintan.se>
Subject: RE: Firewall Setup on RH 9
Date: Thu, 3 Jul 2003 10:07:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000201c3413a$23328d50$c800a8c0@klintan.local>
References: <015201c3412d$992c0ac0$660210ac@christo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <015201c3412d$992c0ac0$660210ac@christo>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Christo
Bezuidenhout
Sent: Thursday, July 03, 2003 8:38 AM
To: netfilter@lists.netfilter.org
Subject: Firewall Setup on RH 9


I need to do the following.

1. I have a Redhat 9 Box with Two nics. NIC1 is my Private Network. NIC2
is connected to my PPP0 interface for internet access. I need to add
NIC3 which will be second Private Network.

2. Both NIC1 and NIC3 Should be able to Connect VIA NIC2 to Internet. 
NIC1 Should be able to connect to NIC3 but NIC3 must not be ABLE to
Connect to NIC1 's network

I have my network already setup as in 1 above and it working very well.
I'm using iptables to get this running. 

Please mail me offline if more info needed or with a suggestion

Christo 

Perhaps something like this.

NIC1=eth0
NIC2=ppp0
NIC3=eth1

modprobe ip_nat_ftp
 
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

#Allow everything out to $NIC2
iptables -A FORWARD -o $NIC2 -j ACCEPT
#Accept only connections from $NIC1 to $NIC3
iptables -A FORWARD -i $NIC1 -o $NIC3 -j ACCEPT

iptables -t nat -A POSTROUTING -o $NIC2 -j MASQUERADE
sysctl -w net.ipv4.ip_forward=1


/Klintan



