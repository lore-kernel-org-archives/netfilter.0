From: "Rinse Kloek" <rinse@solcon.nl>
Subject: Iptables efficiency
Date: Mon, 10 Mar 2003 19:04:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007b01c2e72f$76712180$0200a8c0@rinse>
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

We use a RedHat 7.3 machine as bridge on a P3 1.8 Ghz with 2 64 bits
Gigabit interfaces. On the machine we have a lot of iptables rules like :
            all  --  213.134.x.0        0.0.0.0/0
            all  --  0.0.0.0/0            213.134.x.0
TOS    all  --  213.134.x.4        0.0.0.0/0          TOS set 0x08
            all  --  0.0.0.0/0            213.134.x.4

We have about 3200 iptables rules on our bridge. I've tested today to
remove 1000 of these rules. The load dropped from about 40% to 25%. So I
think the iptables rule take up the most of the CPU load. Do you think this
is a problem of ineffeciency of iptables or just a 'limitation' in the
TCP/IP stack of linux ?

regards Rinse


