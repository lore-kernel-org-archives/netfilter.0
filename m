From: Michael Schneider <michael.schneider@ins.hsr.ch>
Subject: Can't add an CLUSTERIP rule
Date: Fri, 21 Jul 2006 16:45:18 +0200
Message-ID: <44C0E87E.30308@ins.hsr.ch>
Mime-Version: 1.0
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

Hi all,

I'd like to run cluster ip on two nodes with Debian 3.1 R2. I tried the 
rule below with itables version 1.2.11, 1.3.3 and 1.3.5 along with the 
stable Linux kernel 2.6.17.6.

iptables rule:
iptables -A INPUT -d 192.168.10.1 -i eth0 -p tcp --dport 80 -j CLUSTERIP 
--new --hashmode sourceip --clustermac 01:00:5e:08:08:08 --total-nodes 2 
--local-node 1

error:
iptables v1.2.11: chain name not allowed to start with `-'

Try `iptables -h' or 'iptables --help' for more information.


Any help would be greatly appreciated.

cheers,
Michael

