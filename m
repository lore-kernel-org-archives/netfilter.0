From: Rodolphe CARMIGNANI <rodolphe.carmignani@wanadoo.fr>
Subject: Iptables Logs
Date: Mon, 28 Oct 2002 23:11:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DBDB60B.6000406@wanadoo.fr>
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

Hi all,

I want to log my Iptables logs in /var/log/firewall

In my syslog.conf I put
# Firewall Logs
kern.=debug                          /var/log/firewall

One of my iptables rules, for example:
 iptables -A INPUT -p UDP -i ${UPLINK} -j LOG -m limit --limit 1/s 
--log-level debug --log-prefix "[UDP]"

It works, but when I type dsmg I can see LOG lines too, and I don't want to.

Any ideas ? What should I change ?

Thanxx

RC


