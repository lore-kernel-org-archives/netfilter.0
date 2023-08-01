From: hack3rcon@mail2tor.com
Subject: I need help about to rewrite some iptables rules
Date: Tue, 1 Aug 2023 06:01:11 -0400
Message-ID: <ab5de8002b9af064582103c4ae386878.squirrel@_>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,
I have an OpenVPN server that has a NIC with two virtual IP addresses:

enp3s0     :  1.2.3.4
enp3s0:1   :  1.2.3.5
enp3s0:2   :  1.2.3.6

Each NIC runs two OpenVPN servers:

Server1.conf :
Tun1
1194
10.10.0.0/16

Server2.conf :
Tun2
1195
10.11.0.0/16

Server3.conf :
Tun3
1196
10.12.0.0/16

Server4.conf :
Tun4
1197
10.13.0.0/16


I use the following iptables rules:


# IF_MAIN=enp0s3
# IF_TUNNEL=tun2
# YOUR_OPENVPN_SUBNET=IP/16
# iptables -I INPUT -p udp --dport PORT -j ACCEPT
# iptables -A FORWARD -i $IF_MAIN -o $IF_TUNNEL -m state --state
ESTABLISHED,RELATED -j ACCEPT
# iptables -A FORWARD -s $YOUR_OPENVPN_SUBNET -o $IF_MAIN -j ACCEPT
# iptables -t nat -A POSTROUTING -s $YOUR_OPENVPN_SUBNET -o $IF_MAIN -j
MASQUERADE
# iptables -t nat -A POSTROUTING -s $YOUR_OPENVPN_SUBNET -j SNAT --to
$Virtual_NIC_IP


And for each IP address I must rewrite them. When the number of my servers
increases, this is a hard task. How can I reduce these iptables rules?
I'm thankful if anyone write some rules.


Thank you.

