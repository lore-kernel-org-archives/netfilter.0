From: "Shankar; Hari" <hari@ece.utexas.edu>
Subject: Newbie question
Date: Sun, 16 Feb 2003 01:04:33 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.10.10302151813260.17251-100000@tick.ece.utexas.edu>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hello,

I'm trying to use IPTables in User Mode Linux. I've configured UML to
use IPTables replacing IPChains. But when I start up UML, and try to play
around with IPTables, I get the message,

iptables v1.2.4: can't initialize iptables table `filter': Table does not
exist (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.

The UML version that I'm running is 2.4.19.

What could I be doing wrong? I'd very much appreciate any help!

Thanks,
Hari



