From: alex_oz@gmx.net
Subject: CLUSTERIP error "iptables: Invalid argument"
Date: Wed, 2 Mar 2005 22:13:11 +0100 (MET)
Message-ID: <7203.1109797991@www46.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hi,

I tried the new Netfilter target CLUSTERIP using kernel-2.6.10. I discovered
that there is still no userspace support in iptables-1.3.0. So I added
"CLUSTERIP" in iptables-1.3.0/extenstions/Makefile and rebuilt
iptables-1.3.0 with CLUSTERIP-support.
Nevertheless it seems that shared library and kernel-object doesn't fit
thogehter. When I try to input a CLUSTERIP rule like:

iptables -A INPUT -j CLUSTERIP --new --hashmode sourceip --clustermac
01:ab:cd:ef:ab:cd --total-nodes 2 --local-node 1

there is the following error:

iptables: Invalid argument

Did I use wrong parameters?

-- 
Lassen Sie Ihren Gedanken freien Lauf... z.B. per FreeSMS
GMX bietet bis zu 100 FreeSMS/Monat: http://www.gmx.net/de/go/mail

