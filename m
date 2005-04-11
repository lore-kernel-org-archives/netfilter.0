From: Paul <lists@loudas.com>
Subject: preempt vs SMP
Date: Mon, 11 Apr 2005 12:37:24 +1200
Message-ID: <4259C6C4.1060200@loudas.com>
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
To: "Netfilter (list)" <netfilter@lists.netfilter.org>

are there any known issues using the preempt patch with smp/netfilter?
I've got a constant error that looks like this:

Apr 10 18:19:07 trinity kernel: BUG: using smp_processor_id() in
preemptible [00000001] code: modprobe/11068
Apr 10 18:19:07 trinity kernel: caller is ip_conntrack_init+0x255/0x369
[ip_conntrack]
Apr 10 18:19:07 trinity kernel:  [<c02ec398>] smp_processor_id+0xa8/0xc0
Apr 10 18:19:07 trinity kernel:  [<f0cdb275>]
ip_conntrack_init+0x255/0x369 [ip_conntrack]
Apr 10 18:19:07 trinity kernel:  [<f0cdb275>]
ip_conntrack_init+0x255/0x369 [ip_conntrack]
Apr 10 18:19:07 trinity kernel:  [<f0d45c17>] init_or_cleanup+0x17/0x290
[ip_conntrack]
Apr 10 18:19:07 trinity kernel:  [<f0cdb00f>] init+0xf/0x20 [ip_conntrack]
Apr 10 18:19:07 trinity kernel:  [<c013d86a>] sys_init_module+0x18a/0x250
Apr 10 18:19:07 trinity kernel:  [<c010328f>] syscall_call+0x7/0xb
Apr 10 18:19:07 trinity kernel: BUG: using smp_processor_id() in
preemptible [00000001] code: modprobe/11081
Apr 10 18:19:07 trinity kernel: caller is
ip_conntrack_helper_register+0x18/0x170 [ip_conntrack]
Apr 10 18:19:07 trinity kernel:  [<c02ec398>] smp_processor_id+0xa8/0xc0
Apr 10 18:19:07 trinity kernel:  [<f0d48848>]
ip_conntrack_helper_register+0x18/0x170 [ip_conntrack]
Apr 10 18:19:07 trinity kernel:  [<f0d48848>]
ip_conntrack_helper_register+0x18/0x170 [ip_conntrack]
Apr 10 18:19:07 trinity kernel:  [<c02eb2df>] sprintf+0x1f/0x30
Apr 10 18:19:07 trinity kernel:  [<f0cdb0d5>] init+0xd5/0x114
[ip_conntrack_ftp]
Apr 10 18:19:07 trinity kernel:  [<c013d86a>] sys_init_module+0x18a/0x250
Apr 10 18:19:07 trinity kernel:  [<c010328f>] syscall_call+0x7/0xb

