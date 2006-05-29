From: Mike Polek <mike@pictage.com>
Subject: Connection tracking looses packets?
Date: Sun, 28 May 2006 19:23:44 -0700
Message-ID: <447A5B30.7090304@pictage.com>
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

Hi,

For anyone interested, I was attempting to set up a load balancing
FTP server, which I've done before. I had a brand new kernel,
installed the nfct patches, etc. Not knowing that there had
been a tcp-window-tracking patch to the kernel, I couldn't figure
out why the first passive connection would always work, but
later passive connections would fail. After poking around, I could
see the (*pskb)->nfct pointer was NULL, and I was completely
stumped.

Thanks to Pascal Hambourg's post, I tried

echo 1 > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal

and magically, everything works perfectly, just like the old server.

I hope this helps others who are load balancing ftp servers.

Thanks to everyone who contributes to Open Source and these
mailing lists!!!

Mike Polek
Pictage, Inc.


