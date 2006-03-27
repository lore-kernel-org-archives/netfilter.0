From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: iptables v1.2.11: can't initialize iptables table `filter':
	Moduleis wrong version
Date: Mon, 27 Mar 2006 07:15:21 +0200
Message-ID: <000001c6515d$723a4e70$0101000a@sterenborg.info>
References: <000801c64f53$bd883ce0$0201a8c0@NORVY>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000801c64f53$bd883ce0$0201a8c0@NORVY>
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
To: netfilter@lists.netfilter.org

> Hi All
> Now I am using iptables v1.2.11, 2.6.9 kernel, and glibc-2.3.4 But I
> can not use iptables. 
> 
> Following error message.
> ip_tables: (C) 2000-2002 Netfilter core team
> iptables v1.2.11: can't initialize iptables table `filter': Module is
> wrong version
> Perhaps iptables or your kernel needs to be upgraded. # lsmod
> Module                  Size  Used by    Not tainted
> iptable_filter 2368 0 - Live 0xbf007000
> ip_tables 20640 1 iptable_filter, Live 0xbf000000
> 
> How can I use iptables on 2.6.9 kernel ?

Like the error says : your iptables binary cannot use a matching kernel
module.

Does this come from a distro CD or did you recompile the kernel without
recompiling iptables or something like that ?
Or perhaps you installed a 2.6 kernel and a 2.4 iptables binary from CD
(we don't know if your distro supports both kernels) ?

> I think that getsockopt has error in TC_INIT.

Kernel 2.6.9 and iptables-1.2.11 date back to june/october 2004 AFAICT.
If there was an error in the code then a lot of people would have this
problem and it would be solved with a recent kernel/iptables..


Gr,
Rob


