From: "Eric Geater 9/01/04" <egeater@mscoinc.com>
Subject: Port forwarding or NAT?
Date: Tue, 14 Sep 2004 08:32:44 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <01ef01c49a5f$51824900$6300a8c0@93egeater>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

I have one crazy machine at our home office that must communicate on
port 6847 to an outside company.  This one machine went through our old
proxy server until it died last week.  We're using IPTABLES through
rc.firewall-2.4 on a Linux proxy, but it doesn't seem to be allowing
this communication to occur.

Would this be handled through port forwarding or NAT?  I was under the
impression that our firewall was set up to allow all traffic, initated
from the LAN, through.  This apparently isn't the case, however.

Eric


