From: Denis Tatarskikh <dendy@clamas.udsu.ru>
Subject: Problem with 'random' module (v1.2.11)
Date: Mon, 17 Jan 2005 00:22:41 +0400
Message-ID: <20050116202241.GB22482@clamas.udsu.ru>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all.
I've just discouraged by following message:
iptables -A FORWARD --match random --average 60 -j LOG
iptables: No chain/target/match by that name

I'm using iptables 1.2.11 under Debian/testing with stock Debian
kernel(2.4.27). Could anybody explain why that error show up?

Thanking you in anticipation.

-- 
Denis Tatarskikh [UdSU/MF] [UdSU/IC]        mailto:dendy@udsu.ru

