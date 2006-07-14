From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: (no subject)
Date: Fri, 14 Jul 2006 11:55:38 +0200
Message-ID: <000701c6a72b$a91696a0$0101000a@tanjian>
References: <0E6ED28F-854E-43D2-BD60-D551639A7680@wiu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <0E6ED28F-854E-43D2-BD60-D551639A7680@wiu.edu>
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
To: Netfilter <netfilter@lists.netfilter.org>

> Try to build a clean box with Fedora Core 4 and IPTables with 
> connlimits. I keep running into errors.
> 
> I clean install Fedora Core 4. Download iptables 1.3.5, 
> patch-o-matic 20060710, and linux kernel 2.6.17.3. Create a 
> link from /usr/src/ linux to the linux kernel directory.
> 
> cd into patch o matic and enter the following:
> export KERNEL_DIR=/usr/src/linux
> 
> export IPTABLES_DIR=~/iptables-1.3.5
> 
> ./runme connlimit
> 
> 
> I have to force this as connlimit, if I do a y I get the following
> error:
> 
> unable to find ladd slot in src /tmp/pom-29493/net/ipv4/netfilter/
> Makefile (./patchlets/connlimit/linux-2.6.11/./net/ipv4/netfilter/
> Makefile.ladd)

And thus your kernel-/iptables-source isn't patched.

I had the same error and patched the kernel manually.
Look in POM in patchlets/connlimit directory and you'll find what you
need. The directory layout is just like you find it in the kernel
source.
Add the content of Makefile.ladd to the appropriate Makefile and that of
Kconfig.ladd to the appropriate Kconfig. Copy the .c and .h files into
the appropriate directories.
Start "make menuconfig" and the new options should show up and compile.


Gr,
Rob


