From: "Christopher Lyon" <cslyon@netsvcs.com>
Subject: Issues with NAT from the ipsec0 interface
Date: Thu, 20 Feb 2003 21:27:07 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <AC3C815D983E4F4F974EC31FDF7F5CAE016D23@neon.netsvcs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

I am trying to perform NAT using iptables 1.2.7a on packets coming from
the ipsec0 interface.

Here is the config of the host in question

eth0 - x.x.x.x (public)
eth1 - 172.16.124.10
ipsec0 (FreeS/WAN)

Here is the original Packet (Sniffed on ipsec0)
SRC			DEST
192.168.254.100 - 1.2.124.10


SRC 			DEST
192.168.254.100 - 172.16.124.10

The translation I would image would need to take place before routing
since 1.2.124.0 doesn't live on this box so I would guess the command
would be something like this:

# iptables -t nat -A PREROUTING -s 1.2.124.10 -i ipsec0 -j DNAT --to
172.16.124.10

I can't seem to get this to work? I am missing something. I have tried
many combinations of commands but I think the command above should do
it. Any suggestions?=20




Here is a netstat -rn from the host in question
Destination     Gateway         Genmask         Flags   MSS Window  irtt
Iface
x.x.x.x	    0.0.0.0         255.255.255.192 U        40 0          0
eth0
x.x.x.x	    0.0.0.0         255.255.255.192 U        40 0          0
ipsec0
172.16.124.0    0.0.0.0         255.255.255.0   U        40 0          0
eth1
192.168.254.0   66.167.5.126    255.255.255.0   UG       40 0          0
ipsec0
127.0.0.0       0.0.0.0         255.0.0.0       U        40 0          0
lo
0.0.0.0         66.167.5.126    0.0.0.0         UG       40 0          0
eth0




