From: Andrew Walrond <andrew@walrond.org>
Subject: Iptables-1.2.9/10 compile failure with linux 2.6.7 headers
Date: Fri, 18 Jun 2004 16:17:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406181617.23362.andrew@walrond.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

The addition of a
	__user
attribute to a line in
	linux-2.6.7/include/linux/netfilter_ipv4/ip_tables.h
causes iptables build to fail unless I export
	CC="gcc -D__user= "

Presumably ip_tables.h should include a header defining __user, or iptables 
should include the relevant header before ip_tables.h ?

Sorry if this has already been reported; Archive search found nothing on 
either ML.

Andrew Walrond

