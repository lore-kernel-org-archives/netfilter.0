From: laurent.ml@linuxfr.org
Subject: 2.5 kernel and patch-o-matic
Date: Mon, 09 Dec 2002 10:28:14 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <wazza.874r9nzdtt.fsf@message.id>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hi,

I'm trying to use netfilter/patch-o-matic on 2.5 kernel tree.
I can't get patches to be applied.
I've tried with the cvs patch-o-matic runme and the patch-o-matic_2.5 one.
That's the kind of error I get:

Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] Y
Testing patch base/REJECT.patch.ipv6...
Warning - no help text file could be found in either
/usr/src/linux-2.5/../c62c99fc67edd58b0e489365f0396b196d35894ae90feca146dd16320f5b08b4/net/ipv6/netfilter/Config.help
or /usr/src/linux-2.5/../c62c99fc67edd58b0e489365f0396b196d35894ae90feca146dd16320f5b08b4/Documentation/Configure.help
fgrep: /usr/src/linux-2.5/../c62c99fc67edd58b0e489365f0396b196d35894ae90feca146dd16320f5b08b4/net/ipv6/netfilter/Config.in: No such file or directory
Could not find place to slot in Config.in line
TEST FAILED: patch NOT applied.

I've tried a runme patch from netfilter-devel mailing list, but it does not solve the problem.
Could you give me some advice or tell me where to find a working 2.5 runme ?

Thanks in advance

-- 
Laurent

