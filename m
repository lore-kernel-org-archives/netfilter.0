From: Sander Smeenk <ssmeenk+netfilter@freshdot.net>
Subject: Kernel >= 2.6.5, ip_conntrack and udp traffic
Date: Thu, 12 Aug 2004 09:56:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040812075607.GA7616@freshdot.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hello,

I am one of the few people experiencing problems with UDP traffic being
connection tracked and somehow causing the iptables code to start
blurting out:

Aug  5 12:56:48 valor kernel: ip_conntrack_in: Frag of proto 17 (hook=0)
Aug  5 12:56:48 valor kernel: NF_IP_ASSERT:
net/ipv4/netfilter/ip_nat_standalone.c:83(ip_nat_fn)
Aug  5 12:56:48 valor kernel: ip_conntrack_in: Frag of proto 17 (hook=0)

When I try to access my sfs mounts. Google shows this has to do with a
NFS mount to localhost, with r/wsize set to >8192 bytes.

Is sfs/nfs behaving badly, or is the iptables core?

Previously, with kernels < 2.6.8-rcN, I could 'work around' this problem
by not-tracking UDP traffic, but this doesn't seem to work anymore with
the newest kernels...

There's not a lot of information in google about this problem. Am I one
of the few that experience this?

Kind regards,
Sander.


-- 
| Where are the first 6-up's ?
| 1024D/08CEC94D - 34B3 3314 B146 E13C 70C8  9BDB D463 7E41 08CE C94D

