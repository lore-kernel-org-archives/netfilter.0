From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: linux-2.6.9-rc1 compilation and configuration issue (fwd)
Date: Wed, 08 Sep 2004 13:23:28 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <413F4E20.9040807@pbl.ca>
References: <200409072333.i87NXJZA012251@bassett.home.org>	<413F12D1.3050108@pbl.ca>
	<1094665198.23966.21.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094665198.23966.21.camel@nostromo.bgsecm.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jose Maria Lopez <jkerouac@bgsec.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Jose Maria Lopez wrote:
> Patches changes the source code of the kernel and iptables in a lot
> of places, not just a modular place in the code you can separate from
> the rest, that's why you can't patch code from modules or pieces of
> code, because many places in the code are changed when you apply the
> patches.

Which is probably the reason why some of the patch-o-matic patches are 
failing to install with some versions of kernel, and other patches are 
failing to install with some other versions of kernel.  If the things 
were designed the right way from the day one, we wouldn't need to 
download xyz MB of kernel source, install development environment, 
compilers and stuff, going through the hussle of recompiling the kernel, 
....  Instead of just downloading one or two additional kernel modules 
(couple of kB) that we really need (in either source or object format), 
and there would be no need to recompile them when upgrading the kernel. 
  That was one of the things in which Solaris is light years ahead of 
Linux (sorry to have to say that, but it's the hard truth).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

