From: Duane Cloud <cloud@cray.com>
Subject: Question about a kernel module adding an iptables rule...
Date: Thu, 25 Sep 2003 14:52:06 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309251952.h8PJq6f13018@kumo.us.cray.com>
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
To: netfilter@lists.samba.org

Hello,

I was wondering if there was a simple way for a kernel module
to create a NAT rule "on the fly".  For example, a TCP connection
request (i.e. SYN packet) is received by its destination host,
and that host (for whatever reason) wants a different host to
service this connection...

I've got a kernel module listening for these "connection redirects"
on the gateway into the complex, and would like it to be able to
insert a rule into the NAT table then send the packet up to ip_rcv()
such that this specific connection will end up being NAT'd to the
other host.

Is there a simple way to accomplish this?  I was hoping there
would be an insert_rule() function, but it looks like the tables
are modified by a doing a get_table(), modify the local copy, then
replace_table().

Any help you could pass onto me would be greatly appreciated!

Thank you,
Duane Cloud

