From: Sasa Stupar <sasa@stupar.homelinux.net>
Subject: Ports opened without request
Date: Wed, 25 Feb 2004 18:01:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <403CD4DF.1070704@stupar.homelinux.net>
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

Hi!

I have linux RH8 with kernel 2.4.20-28.8, iptables v1.2.8. I have setup 
a firewall with some tcp ports opened (21,25,80,110,443) for servers.
Then I have ran a port scan  and scanned all 65535 tcp and udp ports. I 
was suprised that 3 ports were opened even if I didn't opened them in 
the configuration. These ports are tcp 389,1002 and 1720.
I have tried to block them manually by entering a drop command for these 
three ports but no success-they are still open.
What am I missing here? Is this some problem with iptables?

Sasa

