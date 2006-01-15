From: "sjdcom" <sjdcom@totalise.co.uk>
Subject: Problems installing conntrack
Date: Sun, 15 Jan 2006 18:55:48 -0000
Message-ID: <004801c61a05$4cc0a4d0$0c00a8c0@Jupiter>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I'm installing netfilter for the first time.  I'm installing on Fedora
Core 4 with kernel 2.6.14.  I've installed iptables, libnfnetlink,
libnetfilter_log, libnetfilter_queue and libnetfilter_conntrack without
any trouble.  I have tried installing conntrack but I'm not having much
success.  When I do a ./configure everything seems OK, but when I do a
make it comes up with the following errors;

Conntrack.c:844: error: too few arguments to function
'nfct_dump_conntrack_table_reset_counters'

I also get some other errors of the same type regarding
'nfct_ump_conntrack_table', 'nfct_dump_expect_list',
'nfct_flush_conntrack_table', and 'nfct_flush_expectation_table'

Hope I'm not asking too dumb a question ... Has anyone come across this
before?

Steve


