From: =?iso-8859-1?Q?Jeppe_S=F8rensen?= <smed@tdcadsl.dk>
Subject: iptables with alias again
Date: Mon, 7 Oct 2002 19:41:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001201c26e28$be880e50$3dd6a483@CBOOK>
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

Hello
If I have a interface with e.g. 3 alias
eth0
eth0:0
eth0:1
eth0:2

will this following rules apply on only eth0 and not eth0:0, eth0:1 and
eth0:2 or will it apply on all of them

iptables -A INPUT -i eth0 --dport 80 -j ACCEPT
iptables -A INPUT -i eth0 -j DROP

e.g If I get a packet on eth0:1 will the packet get ACCEPT if it is for port
80 or do I have to make a rule for all the alias where I use the alias ip
instead of the -i eth0 option?


Jeppe Sorensen


