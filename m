From: Tom Fischer <tfischer@abh.de>
Subject: Routing Problem
Date: Fri, 20 Sep 2002 16:29:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D8B30B3.9030002@abh.de>
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
To: netfilter@lists.samba.org

Hi,

I have 2 Machines connected to the Internet via DSL. The first machine 
is the default gateway on all machines in the LAN. I've 2 Machines 
because i want to use the second as a fallback. But now i want to route 
a few services over the second machine, like E-Mail.

For testing i wanted to route a host over the second machine. I followed 
the Adv-Routing-HOWTO and placed:

iptables -I PREROUTING -i eth0 -t mangle -p tcp -s host -j MARK --set-mark 1
echo 201 test >> /etc/iproute2/rt_tables
ip rule add fwmark 1 table test
ip route add default via xxx.xxx.xxx.xxx dev eth2 table test

xxx.xxx.xxx.xxx is the IP of the second Machine connected to the first 
via a Crossover-Cable. This works fine, both machines can ping the other.

This setup didn't work. Did i miss something?

Hope anybody can help me out.

Regards, Tom

-- 
Tom Fischer			ABH Marketingservice GmbH
System Administrator		Weisshaustrasse 23a
Tel: 0221-94400446		50939 Koeln
http://www.abh.de



