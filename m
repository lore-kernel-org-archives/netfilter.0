From: "Vladimir Potapov" <mailarchives@mail.ru>
Subject: Gigabit
Date: Tue, 9 Mar 2004 23:05:23 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FOELKOFDAANJCBHBJNEBIEOACCAA.mailarchives@mail.ru>
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

1)I want to use this network scheme:

      subnet-1 --------
                       | PF | --------Firewall------cisco ----- Internet
      subnet-2 --------                           |
                                                  |
                                             VPN-server


PF and Firewall - box'es with iptables . Does they need to have PPTP support
to route traffic?
2)At all I have 7 subnets with a lot of traffic.6 subnets with users (in
50-400 users in each subnet) and 1 for server with web board, chat and news.

Does anyone use iptables in gigabit network? How big nominally a throughput
of gigabit network with filtering by iptables ?


