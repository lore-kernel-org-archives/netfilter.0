From: archi@archi.szn.pl
Subject: redirection in local private network problem
Date: Tue, 10 Feb 2004 02:10:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1076375425.40282f8119f37@archi.szn.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

hi,

configuration first:

router eth0 (192.168.1.1), eth1 (x.x.x.x public ip)
www host (192.168.1.100)
clients (192.168.1.0/24)

I want to connect by 192.168.1.1 on port e.g. 1025 to local host at 
192.168.1.100:80 but it doesn't work from local network.

If I write into iptables:

nat
-A PREROUTING -i eth1 -p tcp -m tcp --dport 1025 -j DNAT --to-destination 
192.168.1.100:80

it works good from external network (it's fine)

How to make it working in local net?

e.g.

192.168.1.x -> 192.168.1.1:1025 -> (redir) 192.168.1.100:80

please respond to archi(at)archi.szn.pl

