From: <mondgrav-netfilter@yahoo.com>
Subject: Netfilter architectural documentation ?
Date: Mon, 26 Mar 2007 08:56:44 -0700 (PDT)
Message-ID: <415701.68957.qm@web38715.mail.mud.yahoo.com>
Reply-To: mondgrav-netfilter@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Is there documentation (other than the source code) of
aspects of the software architecture of netfilter in
the Linux kernel, i.e., whether/when inspected packet
headers are cached for future lookups; when/how the
different hash tables get used, etc.? I understand
iptables, conntrack, networking, and firewalls. I need
to make some performance assessments of iptables
constructs for config files for a high performance
application. E.g., whether there is a performance hit
for using IP range match and multiport range
constructs. I haven't found appropriate documentation.

thank you.



