From: netfilter_user <netfilter_user@o2.pl>
Subject: PREROUTING
Date: Tue, 29 Apr 2003 09:23:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <13955288009.20030429092330@o2.pl>
Reply-To: netfilter_user <netfilter_user@o2.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello everyone,

this is my problem:
My LAN is connected to Internet via Linux machine with 2 interface (
ppp0 - for internet and eth1 for local net). I need to connect from
local host, service that is running on port 23073 and 23083 UDP in
internet. For this i wrote afew rules with PREROUTING but when I start
script with rules below i receive:

Bad argument `PREROUTING'
Try `iptables -h' or 'iptables --help' for more information.
Bad argument `PREROUTING'
Try `iptables -h' or 'iptables --help' for more information.


iptables -t nat -A PREROUTING -p udp -d 80.50.60.185 --dport 23073 -j DNAT --to-destination 192.168.1.2
iptables -t nat -A PREROUTING -p udp -d 80.50.60.185 --dport 23083 -j DNAT --to-destination 192.168.1.2

iptables -A FORWARD -p udp -d 192.168.1.2 --dport 23073 -j ACCEPT
iptables -A FORWARD -p udp -d 192.168.1.2 --dport 23083 -j ACCEPT

What maybe a reason of this msg?
Im using slackware 8.1 with iptables 1.2.6a

-- 
Best regards,
  mailto:netfilter_user@o2.pl


