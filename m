From: Gerald Galster <Gerry@gerry.de>
Subject: IP Accounting and performance
Date: Sun, 8 Dec 2002 22:18:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <AB18D92A-0AF2-11D7-96A2-00039376F59E@gerry.de>
Mime-Version: 1.0 (Apple Message framework v548)
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
Cc: Gerald Galster <Gerry@gerry.de>

Hi all,

Perhaps you can give me some hints on a performance problem that I'm
currently experiencing with iptables.

The situation is as follows:

I have a firewall currently running kernel 2.4.20, Celeron 1 GHz and 
512 MB of RAM
that should do traffic accounting based on single IP addresses. I 
thought it would be more
efficient to use iptables than writing a standalone application using 
pcap or the like.

I need to add filtering rules like

/sbin/iptables -A FORWARD -o eth0 -s ip_address/32
/sbin/iptables -A FORWARD -i eth0 -d ip_address/32

for about six class-C networks (this means about 3000 iptables rules).

The average throughput is around 3 Mbits / second.

After I've added those rules, the latency in ping times to a machine 
behind
the firewall increases from 30 ms to over 200 ms ...

Now my question is if I can speed those things up ... do you have any 
ideas?

Thanks in advance.

Regards,
Gerald


