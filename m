From: Wes Zhang <pppxqqq@gmail.com>
Subject: compile kernel with iptable support
Date: Wed, 15 Dec 2004 23:29:29 -0500
Message-ID: <4980a3fa0412152029776b9182@mail.gmail.com>
Reply-To: Wes Zhang <pppxqqq@gmail.com>
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

I am a newbie in iptable installation. While I was installing iptable
1.2.11, what's KERNEL_DIR? Is it the kernel directory that used to
store the newly compiled kernel or kernel source code used to compile
iptable?

I also have following questions. I compiled iptable by following as
instructed in INSTALLfile:
   1. make KERNEL_DIR="/boot"
   2. make install KERNEL_DIR="/boot"
But when I execute "iptables -A POSTROUTING -t NAT -o eth0 -j MASQUERADE"
" ./iptables -A POSTROUTING -t NAT -o eth0 -j MASQUERADE
   iptables: target `MASQUERADE' v1.2.10 (I'm v1.2.11)."

Looks like I am totally lost here. Can someone shed some light here?

Thanks,
Wesley

