From: "David F. Strauch" <dstrauch@cyberlink.com>
Subject: compilation question
Date: Thu, 9 Oct 2003 21:30:05 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000401c38ed6$711a4b40$8201a8c0@OurPC>
Reply-To: "David F. Strauch" <dstrauch@cyberlink.com>
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
To: netfilter@lists.netfilter.org

Hello All,

I'm running RHL 9.0 and I hope someone can give me some advise on patching
the 2.4.22 kernel with IPTables 1.2.8. I have extracted the kernel source
from the linux-2.4.22 archive to /usr/src/linux-2.4.22 and extracted
iptables archive to /usr/src/iptables-1.2.8.

I cd /usr/src/iptables-1.2.8 and run make KERNEL_DIR=/usr/src/linux-2.4.22
and get the following error/output:

Extensions found: IPv4:recent IPv6:ah IPv6:esp IPv6:frag IPv6:ipv6header
IPv6:hbh IPv6:dst IPv6:rt
cc -O2 -Wall -Wunused -I/usr/src/linux-2.4.22/include -Iinclude/ -DIPTABLES_
VERSION=\"1.2.8\"  -fPIC -o extensions/libipt_ah_sh.o -c
extensions/libipt_ah.c
cc1: output filename specified twice
make: *** [extensions/libipt_ah_sh.o] Error 1

Can anyone make any recommendations?

Dave



