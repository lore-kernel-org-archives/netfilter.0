From: aksingh@hss.hns.com
Subject: nf_register_hook(), nf_unregister_hook()
Date: Mon, 26 Jul 2004 14:54:57 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF9CDF4982.3CF3E957-ON65256EDD.00330311@hss.hns.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: kernelnewbies@nl.linux.org
Cc: netfilter@lists.netfilter.org





Hi,

 Can nf_register_hook() and nf_unregister_hook ever fail ? , i.e shld I
check for nf_register_hook() returning a value of less than 0 in my code. I
looked at its definition in net/core/netfilter.c, it always returns 0,
though in some places in kernel code, I find ppl checking for a
<0(net/ipv4/netfilter/arptable_filter.c)return and at some places I dont
(net/ipv4/netfilter/ip_fw_compat.c)?, is it really required ?

thanks
Amit
*****************    HSS-Unclassified    *************


