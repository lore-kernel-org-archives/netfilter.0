From: "Joel n.solanki" <zealous@bonbon.net>
Subject: make: *** [extensions/libipt_ROUTE_sh.o] Error 1
Date: 24 Jul 2004 09:26:29 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090641389.1939.10.camel@joel.d2visp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter <netfilter@lists.netfilter.org>

Dear all,

My system is Redhat 9.0
I have compiled kernel 2.4.21 from kernel.org for IMQ support.
I downloaded imq2-20030616.tar and installed imq in the kernel.
Now my kernel can detect imq device.

modprobe imq then it gets listed in lsmod (modules)
so i dont think kernel is the problem. so imq is working properly from
kernel.
Now installing iptables-1.2.9 its giving me following error

make: *** [extensions/libipt_ROUTE_sh.o] Error 1

I have patched iptables-1.2.9-imq1.diff to iptables directory.
now when installing ...

make KERNEL_DIR=/usr/src/linux-2.4.21

by applying this command i got the error make: ***
[extensions/libipt_ROUTE_sh.o] Error 1

So any body has solved this problem.
I dont think this is imq related problem.

Any ideas / Clues

Regards,
Joel n.solanki



