From: kako@zhnet.hu
Subject: conntrack questions
Date: Mon, 28 Aug 2006 14:09:33 +0200 (CEST)
Message-ID: <2100.192.168.150.209.1156766973.squirrel@www.zhnet.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

I've got some problems with connection tracking. At the inner side of
the linux-netfilter based firewall there are more then 700 workstations.
Before half a year the firewall started to work unstable. By the logs I
realised this is because of "ip_conntrack table is full" :-)
I tried to increase (120000) the ip_conntrack_max value, and seemed to
work, but if the active connections
(cat /proc/net/ip_conntrack |wc -l) reaches the 60-70000, the load
starts to go up, and the server dies. This means I can't connect to
server remotely and can't start a new terminal locally. If I have an
opened terminal, and stop and start the firewall (so drop the conntrack
table), the load goes down, and everything is OK.
The questions:
1, Can I somehow limit every clients to establish (for example) only 30
active connections?
2, If not, can I somehow drop the full conntrack table when it is
fullfilled (automaticly of course)
3, any other ideas to keep working the firewall

thanks
kako
wasn't I off or incomprehensible a little bit?
(english isn't my native language)



