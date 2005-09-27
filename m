From: Justinas =?iso-8859-2?Q?Bed=BEinskas?= <justasb@patikimi.lt>
Subject: problems compiling kernel with patch-o-matic
Date: Tue, 27 Sep 2005 12:35:36 +0300
Message-ID: <1127813736.10807.7.camel@biesas>
Reply-To: justasb@patikimi.lt
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

I patch 2.6.13.2 vanilla kernel with patch-o-matic, and I have these
errors:

net/built-in.o: In function `init':
ipt_set.c:(.init.text+0x1c7b): undefined reference to
`ipt_register_match'
net/built-in.o: In function `init':
ipt_SET.c:(.init.text+0x1c9b): undefined reference to
`ipt_register_target'
net/built-in.o: In function `fini':
ipt_set.c:(.exit.text+0xbb): undefined reference to
`ipt_unregister_match'
net/built-in.o: In function `fini':
ipt_SET.c:(.exit.text+0xdb): undefined reference to
`ipt_unregister_target'
make: *** [.tmp_vmlinux1] Error 1


Here is my config (nothing particular, just enabled IP_NF_SET..)
http://biesas.adminas.net/~digis/config


btw, http://www.ussg.iu.edu/hypermail/linux/kernel/0310.3/0466.html
patch here isn't helping, because by default, in 2.6.13.2 kernel
"that" line is: "depends on IP_NF_IPTABLES && BRIDGE_NETFILTER".


Justinas B.



