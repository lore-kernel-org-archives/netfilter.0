From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: H323 gateway? HELP
Date: Fri, 19 Sep 2003 08:46:42 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0309190825390.12735@simba.math.ucla.edu>
References: <5.2.0.9.0.20030919105537.00b313d0@mail.network.com.pt>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.2.0.9.0.20030919105537.00b313d0@mail.network.com.pt>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carlos Santos <csantos@csantos.net>
Cc: netfilter@lists.netfilter.org

On Fri, 19 Sep 2003, Carlos Santos wrote:
> All the netfilter related modules (including
> h323) are built into the kernel so no dynamic loading is necessary in the
> firewall script.

> - Does anyone have / know about a step by step guide I can read to have
> h323 support in a redhat gateway ? I'd prefer not to have to use h323
> proxies like GateKeeper. I would like to get this done with
> Netfilter/Iptables alone if possible.

Have a look at:
http://www.netfilter.org/documentation/pomlist/pom-extra.html#h323-conntrack-nat
I've never actually used it, but I've heard comments on this list that
people use it successfully.

> - Can anyone tell me how to maje sure the kernel has specific modules built
> in ? I know I selected them to be built in when I recompiled but I really
> can't be sure they're there. Is there a command to find out ?

Make sure the answer is "no" to your question :-)  That is, rebuild your
kernel with everything as modules.  If you're messing with drivers (as I
am), It's a real godsend to be able to get rid of a broken or unwanted
module without recompiling the kernel and without even rebooting, if the
broken feature didn't splatter.  And to be able to support a new device /
connection / etc. by just installing the module.  Your distro should have a
script to automatically assess which modules are needed in an initrd, and
to write the thing; if you roll your own everything, a simple static script
is easy.  (See /usr/src/linux/Documentation/initrd.txt for details.)
With the initrd, you don't even need to compile your boot disc / raid / etc
drivers into the kernel -- a really big advantage with raid.
(Paraphrasing from /usr/src/linux/Documentation/initrd.txt: you must
hardwire at least the drivers for the RAMdisc, to exec ELF binaries, and to
handle the filesystem that's on the RAMdisc, typically ext2.)

Hope this is helpful!

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA  90095-1555
Email: jimc@math.ucla.edu    http://www.math.ucla.edu/~jimc (q.v. for PGP key)

