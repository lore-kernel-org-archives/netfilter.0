From: Sasa Stupar <sasa@stupar.homelinux.net>
Subject: Redirection question
Date: Mon, 20 Dec 2004 18:02:25 +0100
Message-ID: <41C705A1.2040107@stupar.homelinux.net>
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

Hi!

I have installed mail server on my lan. Now I would like to redirect all 
lan users to use that mail server as smtp (similar as transparent proxy 
with squid). How do I do that smtp redirection?
I was thinking something like:
-------------
iptables -t nat -A PREROUTING -i eth0 -s ! smtp-box -p tcp --dport 25 -j 
DNAT --to smtp-box:25
iptables -t nat -A POSTROUTING -o eth0 -s local-network -d smtp-box -j 
SNAT --to iptables-box
iptables -A FORWARD -s local-network -d smtp-box -i eth0 -o eth0 -p tcp 
--dport 25 -j ACCEPT
--------------
Is this correct?

Regards,
Sasa

