From: "Brad Morgan" <B-Morgan@concentric.net>
Subject: Configuration Questions
Date: Thu, 9 Jan 2003 17:11:24 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NABBJOOEOFODEALNMJAJIEGCHHAA.B-Morgan@concentric.net>
References: <200301090258.04071.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200301090258.04071.netfilter@newkirk.us>
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

I'm doing some volunteer work for a non-profit client that wants to add a
firewall to the following configuration:

T1 to outside --- Cisco 2600 router --- LAN

The LAN has 3 subnets, a.b.c.d/25, d.e.f.g/25, and just recently 10.0.h.i/16
which is NATed in the Cisco router.  The first two subnets are public IP
addresses.  Although the machines on the LAN have public IP addresses, there
are no "known" public services being offered.

I believe the firewall would be added between the Cisco 2600 router and the
LAN like this:

T1 --- Cisco 2600 --- Firewall --- LAN

The firewall will run RedHat Linux 8.0 with iptables 1.2.6a.

How do you configure the ethernet adapters to pass all the traffic for all
three subnets?

I'm assuming that the router now routes packets between 2 machines in
different subnets on the LAN.  Should the firewall assume this role?

If you can point me to any documents or examples on the web that would help
me understand
how to solve this challenge I would be very grateful!

Regards,

Brad Morgan



