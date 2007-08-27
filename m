From: "TinyApps.Org" <miles@tinyapps.org>
Subject: Question about /etc/iptables.down.rules
Date: Sun, 26 Aug 2007 15:51:44 -1000
Message-ID: <1224801D-F4F1-40D1-8C8C-94C14C3C38EC@tinyapps.org>
Mime-Version: 1.0 (Apple Message framework v752.3)
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

I have a very simple set of iptables rules:

# iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# iptables -A INPUT -p tcp -i eth0 --dport ssh -j ACCEPT
# iptables -I INPUT -i lo -j ACCEPT
# iptables -A INPUT -j DROP

which has been saved to /etc/iptables.up.rules .

I have also modified /etc/network/interfaces to use the ruleset:

            iface eth0 inet static
                    address x.x.x.x
                    [.. interface configuration ..]
                    pre-up iptables-restore < /etc/iptables.up.rules

I understand that it is best to setup a set of rules to be applied
when the network interface is down, saving it to:

  /etc/iptables.down.rules

and applying in /etc/network/interfaces via:

post-down iptables-restore < /etc/iptables.down.rules

What should this set of rules look like? The exact opposite
of /etc/iptables.up.rules ? Or just a simple flush command?
Or something else altogether?

Sincerely,

Miles


