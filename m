From: juanca <juanca@sat.com.py>
Subject: block msn
Date: Wed, 16 Jul 2003 07:36:04 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F1538A4.9000702@sat.com.py>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I`ve got this rulset but It doesn`t work what else do I need to add?
All the windows machine work msn, just on linux doesn`t
Any suggetions ?
Thanks in advance

iptables -A FORWARD -s 192.168.0.10 -p TCP --dport 1443:1467 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -d 207.46.107.33 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -d 207.46.110.38 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1863 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1513:1525 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -d 66.35.229.204 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -d 65.54.194.118 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -d 207.46.107.34 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -d 208.45.129.195 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1863 -d 0/0 -j DROP
iptables -A FORWARD -s 192.168.0.10 -d 207.46.110.11 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1863 -d 0/0 -j DROP
iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1601:1603 -d 0/0 -j DROP
iptables -A FORWARD -s 192.168.0.10 -d 64.4.13.0/24 -j REJECT
iptables -A FORWARD -s 192.168.0.10 -d 64.4.0.0/24 -j REJECT
iptables -A INPUT -p tcp -s 192.168.0.10 -d messenger.microsoft.com -j DROP


