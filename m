From: gfzhang@njnu.edu.cn (gfzhang)
Subject: NAT : mem usage is increasing ? may crash my box ?
Date: Wed, 30 Apr 2003 12:43:32 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030430044332.M93350@pine.njnu.edu.cn>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I'm using a REDHAT 9.0 to be a NAT server. after few days
I found the system is going to eat all of it's memory
I count /proc/net/ip_conntrack only have 10000 lines
and i have 2GB mem. 
   it seems that the box will continue to eat as much mem
as I have . how to free those memory ?
    what's wrong with my box ?
    thanks in advancd
____________________________
cat /proc/sys/net/ipv4/netfilter/ip_conntrack_max
 65536





