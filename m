From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Stateless NAT
Date: Thu, 24 Feb 2005 06:11:26 -0500
Message-ID: <1109243487.9286.4.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: Netfilter users list <netfilter@lists.netfilter.org>

Thanks to some help from Philip Craig of SnapGear, I'm still alive on
this issue of UDP broadcast helping using iptables.  The next problem is
creating the stateless NAT that I need.  My first choice would be to do
this with iproute2 but it appears to be broken in the 2.6 kernel.

I next tried doing this by using the raw table and NOTRACK target for
udp broadcasts on the needed port and then DNAT on the same packets to
the unicast address.  However, apparently NOTRACK disables NAT so that
didn't work.  When using conntrack for most packets, how does one
disable conntrack for certain NAT packets only? In other words, how does
one do selective, stateless NAT in iptables? Thanks - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


