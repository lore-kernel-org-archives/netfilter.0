From: Oscar Arranz <oarranz@riafinancial.com>
Subject: Iptables don't block traffic
Date: Thu, 22 Apr 2004 15:53:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4087CE5F.5030503@riafinancial.com>
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

Hi all, this is my first message to the list, so excuse me if it is too
trivial...

    I have a Red Hat box running as a firewall in my network. It's
working fine, but now I'm doing tests in order to block certain Internet
traffic. I've added the following rules which should drop packets from
my PC to a known public IP (a web server):

iptables -A FORWARD -s 192.138.35.110 -d 193.110.128.200 -j DROP

    But the packets are not droped because I still can connect to the
web server.

    The default rule for FORWARD chain is DROP

   Any ideas?

Thanks,
Oscar





