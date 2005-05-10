From: ro0ot <ro0ot@phreaker.net>
Subject: SIP Natting
Date: Tue, 10 May 2005 22:38:52 +0800
Message-ID: <4280C77C.2040001@phreaker.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

Below is my rules for my SIP device: -

iptables -t nat -A PREROUTING -i ppp0 -p udp --dport 5060 -j DNAT --to 
172.16.10.21:5060
iptables -t nat -A PREROUTING -i ppp0 -p udp --dport 8000 -j DNAT --to 
172.16.10.21:8000

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

Can I have something like below if I want to have more than one SIP devices?

iptables -t nat -A PREROUTING -i ppp0 -p udp --dport 5060 -j DNAT --to 
0.0.0.0:5060
iptables -t nat -A PREROUTING -i ppp0 -p udp --dport 8000 -j DNAT --to 
0.0.0.0:8000

Regards,
ro0ot




