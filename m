From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: patch-o-matic and modules
Date: Tue, 16 Mar 2004 17:27:36 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00a701c40b38$eb8591d0$0100a8c0@newlife>
References: <Pine.GSU.4.58.0403142225080.22714@adore.lightlink.com> <20040315041348.GT26800@samad.com.au> <200403150733.07149.Antony@Soft-Solutions.co.uk> <Pine.GSU.4.58.0403160119090.6899@adore.lightlink.com>
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


I have a question about kernel and patch-o-matic.

Assuming that I have a kernel 'vmlinuz' before applying 
patch-o-matic.

Then I go ahead to apply patch-o-matic patches, a few I 
have applied, say TTL and CONNMARK. Then I go ahead to 
recompile a new kernel but those new netfilter features I specify 
them as modules. Then I compile the new modules. In this 
example, I would get ipt_TTL.o and ipt_CONNMARK.o as result.

My question is what is the impact of using this ipt_CONNMARK.o
or ipt_TTL.o with the kernel 'vmlinuz' prior to applying patch-o-matic ? 
I tried loading it, it does not seem to have any problem. I got loaded.
There is also no error in the iptables commands.

It is safe to using the new modules with the old kernel ? Or must I only
use it with the new kernel ? 









 







