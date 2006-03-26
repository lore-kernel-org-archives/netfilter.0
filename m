From: Andrew Beverley <andy@andybev.com>
Subject: Using conntrack to delete all connections for one source address
Date: Sun, 26 Mar 2006 23:49:35 +0100
Message-ID: <20060326234935.y1gsd3csowckgkko@www.simplelists.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Is there a way of using conntrack to delete all connections associated with one
particular source address? If I do:

conntrack -D --orig-src 192.168.4.240 -p tcp

I get:

NFNETLINK answers: No such file or directory
Operation failed: such conntrack doesn't exist

However, if I specify all parameters (source and destination IP and ports) then
it works. Doing it this way makes it quite difficult deleting all connections
for a particular host.

conntrack v1.00beta1
libnfnetlink-0.0.14
libnetfilter_conntrack-0.0.30

Andy Beverley

