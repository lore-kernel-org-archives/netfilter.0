From: "azeem ahmad" <azeem484@hotmail.com>
Subject: ftp again
Date: Sat, 22 May 2004 15:29:56 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY15-F4dP1h5lOX3Af000a1ed3@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi all
when i run this script on my box the natting of ftp stops. neither clients 
browse in non-paasive mode nor in passive mode
what is the problem

---------------------------------------------------------------------------------------------------------------------------------------
iptables -F
iptables -t nat -F
iptables -P INPUT DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 8080 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 8080 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 22   -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 53   -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 53   -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 137  -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 138  -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 139  -j ACCEPT

iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
iptables -t nat -A PREROUTING -p udp --dport 80 -j REDIRECT --to-port 8080

iptables -P FORWARD DROP
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 20        -j ACCEPT
iptables -A FORWARD -i eth0 -p udp --dport 20        -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 21        -j ACCEPT
iptables -A FORWARD -i eth0 -p udp --dport 21        -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 443       -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 5000      -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 5001      -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 5005      -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 5050      -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 6660:6670 -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 7000      -j ACCEPT
#iptables -A FORWARD -i eth0 -p tcp --dport 28805     -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 51215     -j ACCEPT

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
------------------------------------------------------------------------------------------------------------------------------------------

Regards
Azeem

_________________________________________________________________
Add photos to your messages with MSN 8. Get 2 months FREE*. 
http://join.msn.com/?page=features/featuredemail


