From: Carsten Maass <cm@blinkenlichten.de>
Subject: INET_IFACE: Secure to allow traffic from 192.168.x.0/24?
Date: Thu, 04 Mar 2004 13:29:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40472125.4000608@blinkenlichten.de>
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

Dear List,

recently i connected together two internal networks over an IPSec-tunnel:

(Localnet A)---(Gateway A)==IPSec==(Gateway B)---(Localnet B)

Now i am unsure which iptables-rules i should apply to the external 
interfaces of the gateways to match the traffic between the Localnets 
without opening up a security hole. Is it sufficient to simply apply 
some general rules like:

$IPTABLES -A FORWARD -i $INET_IFACE -s 192.168.a.0/24 -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -s 192.168.b.0/24 -j ACCEPT

or would this approach be vulnerable to some kind of IP-spoofing attack? 
What would be your solutions in this situation?

Thanks for your help,
Carsten.


