From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: 2.6.20-rc6-mm1 (build)
Date: Sun, 28 Jan 2007 11:41:48 -0800
Message-ID: <20070128114148.b8067721.randy.dunlap@oracle.com>
References: <20070127234928.64d8e437.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932783AbXA1TqN@vger.kernel.org>
In-Reply-To: <20070127234928.64d8e437.akpm@osdl.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>
Cc: linux-kernel@vger.kernel.org, netfilter@lists.netfilter.org

On Sat, 27 Jan 2007 23:49:28 -0800 Andrew Morton wrote:

> 
> Temporarily at
> 
> 	http://userweb.kernel.org/~akpm/2.6.20-rc6-mm1/
> 
> will appear one day at
> 
> 	ftp://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.20-rc6/2.6.20-rc6-mm1/


allyesconfig on x86_64 does not build for me:

drivers/built-in.o: In function `sis_init_one':
sata_sis.c:(.text.sis_init_one+0x1a1): undefined reference to `sis_info133'
sata_sis.c:(.text.sis_init_one+0x1ab): undefined reference to `sis_info133'
net/built-in.o: In function `q931_help':
nf_conntrack_h323_main.c:(.text.q931_help+0x6ad): undefined reference to `ip6_route_output'
nf_conntrack_h323_main.c:(.text.q931_help+0x6c3): undefined reference to `ip6_route_output'

Adrian Bunk has sent a patch for the sis_info133 problem.

---
~Randy
