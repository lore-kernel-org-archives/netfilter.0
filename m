From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Can't compile iptables 1.2.8. Please help me!
Date: Mon, 5 May 2003 09:31:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E6D65A6EE5AAD6119DE800B0D03DA0C528960C@MS_LEU1>
References: <20030505045757.67027.qmail@web20310.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030505045757.67027.qmail@web20310.mail.yahoo.com>
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

> I tried a lot but I can't compile iptables 1.2.8 for 
> linux-kernel 2.4.5!
> 
> # make pending-patches KERNEL_DIR=/usr/src/linux
> make: *** No rule to make target `pending-patched`!
> Stop.

Patch-o-matic and iptables have become separate packges since some time
now.
To patch the kernel (and I think I'd use 2.4.20) you need the separate
patch-o-matic packages, and call "KERNEL_DIR=<path/to/kernel> ./runme
<submitted|pending|base|extra>".
To compile iptables you can alter the Makefile if you need to and then
just call "make".


Rob


