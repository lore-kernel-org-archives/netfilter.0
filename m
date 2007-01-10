From: snowcrash+netfilter <schneecrash+netfilter@gmail.com>
Subject: simple usage Q on setting sysctl opts in fw script
Date: Wed, 10 Jan 2007 14:29:42 -0800
Message-ID: <70f41ba20701101429m44c8cb65l2b99bd950ae62e23@mail.gmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

i've a question about usage in setting SYSCTL options @ fw build/load time.

i've found numerous examples online used in/by iptables
scripts/generators/etc, and i see two different implementations.

e.g., for redirects, this,

	for f in /proc/sys/net/ipv4/conf/*/accept_redirects; do
	    echo 0 > $f
	done

versus,

	echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects

is _not_ "/all/" equivalent to a recurse across "/*/" in,

	% ls /proc/sys/net/ipv4/conf
		all      br0      default  lo       ppp0

?

i've yet to find a simple/clear statement as to the difference, if any.

thanks.

