From: Mike Machado <mike@innercite.com>
Subject: pptp-conntrack-nat
Date: 11 Jun 2003 17:04:09 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1055376249.20254.16.camel@rocket.innercite.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

I used CVS/POM and patched my vanilla 2.4.20 kernel to include support
for ip_conntrack_pptp and ip_nat_pptp, but after I do this, the
MASQUERADE target no longer works. lsmod shows both modules load
successfully as well as the ipt_MASQUERADE, but when I run my nat rule:

iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o eth0 -j MASQUERADE

it just says Invalid Argument. I have two identical kernels, one with
the pptp patch applied, one without, and the one without allows the
MASQUERADE target just fine. Is there a known bug with the latest CVS
pptp-conntrack-nat patch interfearing with masquerading? Thanks.

-- 
Mike Machado
mike@innercite.com
InnerCite Inc.
Engineering Director / CTO


