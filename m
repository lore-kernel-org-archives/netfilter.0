From: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Subject: Re: Recompile iptables
Date: Thu, 29 Mar 2012 09:29:58 +0200
Message-ID: <1333006198.2741.14.camel@ns014530.dcyb.net>
References: <1333004474.86926.YahooMailNeo@web125606.mail.ne1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1333004474.86926.YahooMailNeo@web125606.mail.ne1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, 2012-03-29 at 00:01 -0700, gopi bhimavarapu wrote:
> Hi
> 
> I need to recompile the iptables userspace program using the include
> files of my kernel. (which has specific improvements in ipt_entry structure).
> I am using iptables-1.4.12.2 and ussing --with-ksource option and giving my
> kernels include directory.
> Even then, ipt_entry sturcture of iptables-1.4.12.2/include is getting precedence.
> How can I force it to take my include files.

(We're now at iptables-1.4.13.)

When you installed the kernel with 'make modules_install && make
install' (or something like that), the modules are installed
in /lib/modules/`uname -r`. That directory holds symlinks to the kernel
source: build and source (at least, here is does). After you reboot
using the new kernel, iptables configure will find the kernel source by
itself, without specifying --with-ksource.
If you booted the new kernel, just run ./configure and see what happens.
If it doesn't work, then look for configure options to make it work.

Besides, if you checked ./configure --help, it says that --with-ksource
should point to '/lib/modules/CURRENT/source', not
'/lib/modules/CURRENT/source/include' which is what you seem to have
done.


--
Rob


