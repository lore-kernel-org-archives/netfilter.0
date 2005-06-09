From: lmarcilly@aressi.fr
Subject: Iptables and snort inline
Date: Thu, 9 Jun 2005 09:04:01 +0000
Message-ID: <DIIE.000001ED000023D1@smtp.aressi.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all!

I try to use iptables with snort_inline on a bridging firewall. Here is my testing configuration :

------         ----------
| PC |---------| Bridge |--------- LAN
------         ----------
192.168.1.99      192.168.1.185      192.168.1.0/24

My iptables rules are :

iptables -A INPUT -j QUEUE
ipatbles -A OUTPUT -j QUEUE
iptables -A FORWARD -j QUEUE

and snort_inline is initialized correctly.

My problem is : when i put snort_inline down, i can't reach the LAN from my PC. I think it's normal but i want that when snort inline is down, the LAN is always reachable from my PC.

Is this possible only by changing rules ? Or does it exist a patch to apply to iptables ?

Thanks in advance and excuse me for my poor english!

L. M.




