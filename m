From: "Florian Effenberger" <floeff@arcor.de>
Subject: iptables: Invalid argument
Date: Thu, 5 Jun 2003 10:07:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000d01c32b39$828880a0$0500a8c0@effenberger>
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

Hello there,

I know this problem is quite old and well-known, however, I was not able to
find a fix.

As soon as I use the owner module on my Linux box (iptables 1.2.7a, Debian
Kernel 2.4.20), I get the error message

  iptables: Invalid argument

I heard that this has something to do with structural changes in the kernel,
but - what can I do to make it work on my 2.4.20? Compiling 1.2.8 did not
seem to help me out :(

Thanks!
Florian


