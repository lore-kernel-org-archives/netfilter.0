From: Mpourtounis Dimitrios <mpourtou@ceid.upatras.gr>
Subject: Sequence of matches
Date: Thu, 2 Mar 2006 19:48:20 +0200 (EET)
Message-ID: <Pine.LNX.4.61.0603021944040.28991@diogenis.ceid.upatras.gr>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all,

I am using 2.6.15 kernel, iptables-1.3.5.tar.bz2 and 
netfilter-layer7-v2.1.tar.gz patch.

Is there any possibility the sequence of "matches" is important?

This one is ok:
iptables -t mangle -A POSTROUTING -m layer7 --l7proto http -m mark 
--mark=0x2710 -j MARK --set-mark=0x2711

but this one does not match:
iptables -t mangle -A POSTROUTING  -m mark --mark=0x2710 -m layer7 
--l7proto http -j MARK --set-mark=0x2711

Thanks,
DB



