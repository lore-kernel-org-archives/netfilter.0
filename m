From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: iptables: Unknown error 4294967295
Date: Thu, 30 Aug 2007 18:59:11 +0200
Message-ID: <000301c7eb27$16bd11d0$0101000a@tanjian>
References: <5686909.1188492556761.JavaMail.karimas@kfupm.edu.sa>
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5686909.1188492556761.JavaMail.karimas@kfupm.edu.sa>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> How can I recompile the kernel and not iptables.

Simple. They are separate packages (iptables is not the same as
netfilter; it's part of the project). So it's possible to just compile
the kernel but not iptables, which is only the userspace utility to
create rules.

If you haven't compiled iptables you can download it from
ftp.netfilter.org.
If you patched the kernel before compiling using patch-o-matic-ng, it's
possible that iptables also had to be patched before compiling it so it
may not be enough to just compile and install iptables.
Also, keep in mind that you probably have an older version of iptables
installed that comes with your distro and you should uninstall that
version.


Grts,
Rob



