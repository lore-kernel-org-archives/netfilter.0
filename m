From: tedemo <tedemo@free.fr>
Subject: ipset memory usage
Date: Sun, 25 Sep 2005 08:31:09 +0200
Message-ID: <4336442D.3090404@free.fr>
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

Hello,

The ipset modules seems to eat a lot of memory :
with a test set of  :
- 150 000 networks in a nethash
- 10 000 hosts in a iphash
ipset sometimes fails with out of memory errors :
"kernel: allocation failed: out of vmalloc space - use vmalloc=<size> to 
increase size"

The VmAllocUsed variable from /proc/meminfo goes from 6Mo to 160Mo after 
loading sets.

Is this normal ? Is there some way to reduce memory usage ?

Thanks

