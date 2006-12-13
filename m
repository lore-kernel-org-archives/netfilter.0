From: Andrew Beverley <andy@andybev.com>
Subject: Unable to use MARK target with iptables-1.3.7
Date: Wed, 13 Dec 2006 20:18:23 +0000
Message-ID: <1166041103.4316.5.camel@andybev.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi,

I've just installed iptables 1.3.7. However, when I run:

iptables -t mangle -A POSTROUTING -p tcp --dport 22 -j MARK \
--set-mark 10

I get:

FATAL: Module ip_tables not found.

However, if I drop back to version 1.3.6 all works fine.

To compile I use:

make PREFIX=/usr LIBDIR=/lib BINDIR=/sbin install

There are no compile errors when making. Kernel is 2.6.17.14

Thanks,

Andy Beverley



