From: "ArcosCom Linux User" <linux@arcoscom.com>
Subject: ROUTE target and kernel 2.6.19
Date: Fri, 1 Dec 2006 10:30:01 +0100 (CET)
Message-ID: <35999.195.55.244.106.1164965401.squirrel@www.arcoscom.com>
Reply-To: linux@arcoscom.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi, I'm using:
   iptables 1.3.5 (FC5 distro with ROUTE target enabled)
   kernel 2.6.19
   pom-ng 20061129

My box is a dual xeon machine (SMP kernel).

I'm using 2 uplinks to connect my network to internet and its working
fine, but some disconnection isues using messenger (amsn, gaim, m$msn,
msn-messenger, etc...) needs I route all -p tcp --dport msnp over one
uplink.

To solve this problem, I want to try -j ROUTE target, to route all msnp
traffic only for one uplink (I don't know if this will solve the problem,
but I want to try). For this purpose, I wrote:

iptables -t mangle -A PREROUTING -p tcp --dport msnp -j ROUTE --gw
<uplink> --continue

The error is:
iptables: Unknown error 4294967295

In dmesg:
ipt_ROUTE: targinfosize 0 != 40

Any help about this?

Thanks


