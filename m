From: cc <cc@belfordhk.com>
Subject: compile errors
Date: Tue, 26 Oct 2004 14:16:37 +0800
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <417DEBC5.3000006@belfordhk.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Group <netfilter@lists.netfilter.org>

Hi,

System:  2.4.27 Kernel.
Iptables:  1.2.11  (trying to compile)

I don't recall having so much trouble with 1.2.8 (the last
version I compiled following the README instructions),
basically:

make KERNEL_DIR=/usr/src/linux

But I get all sorts of warnings.   Mind you, the 2.4.27
kernel was patched from a 2.4.21 one, so I d/led the
2.4.27 full kernel and uncompressed it to /usr/src/linux.

Then I ran 'make KERNEL_DIR=/usr/src/linux'.

Now, it gives:

Making dependencies: please wait...
Something wrong... deleting dependencies.
make: *** [/usr/src/linux/include/asm/errno.h] Error 1

I don't know if this is considered an improvement
or not.

This is a stock kernel.  Unpatched from the POMs.
Even with patched, I still get the above error.

Can someone please tell me what I'm doing wrong?

Does 1.2.11 work with 2.4.27 anyway?

Thanks

Edmund

