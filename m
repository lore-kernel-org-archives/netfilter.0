From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: iptables pom installation, help!
Date: Fri, 2 Jul 2004 11:58:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <TBEXEDU01ALjdO3J1L200000097@smtp.maurickcollege.nl>
References: <6.0.3.0.1.20040702173337.5a864b90@mail.axisglobal.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6.0.3.0.1.20040702173337.5a864b90@mail.axisglobal.com>
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

> 	i just want to ask the proper way to install the 
> patch-o-matic for iptables. because i need the 
> libipt_ipv4options.so for my firewall rules. 
> i'm using iptables-1.2.7a. what are the things do i need for 
> me to install it properly?

First, Obtain the (new ?) kernel, POM-NG and iptables source and extract
the files from the tarballs.

Next, patch with pom the kernel and iptables source with "KERNEL_DIR=...
IPTABLES_DIR=... ./runme <pending|base|extra>"

Then compile the kernel modules and copy/install them into the correct
lib directory.
(If it's an option, maybe you can use a new kernel source and
compile/install a complete brand new kernel.)

After that compile a new iptables and install it and you should be done.


Gr,
Rob


