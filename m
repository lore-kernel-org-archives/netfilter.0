From: Derrick Sawyer <derrick@ip3.com>
Subject: Error compiling kernel 2.6.11.7 w/ pptp_conntrack_nat patch
Date: Sat, 27 Aug 2005 15:07:36 -0700
Message-ID: <4310E428.3060806@ip3.com>
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

Hi all,

I am getting this error when compiling kernel 2.6.11.7 with pptp 
patch-o-matic patch:

LD      .tmp_vmlinux1
net/built-in.o(.text+0x68bce): In function `timeout_ct_or_exp':
: undefined reference to `__ip_conntrack_expect_find'
make: *** [.tmp_vmlinux1] Error 1

I have the latest subversion of patch-o-matic-ng.

Any suggestions will be greatly appreciated.

Thanks,
~Derrick


