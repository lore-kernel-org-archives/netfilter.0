From: Leon Stringer <leon.stringer@ntlworld.com>
Subject: Firewall only/bridging set up
Date: Sun, 27 Nov 2005 20:04:09 +0000
Message-ID: <1133121850.3039.16.camel@localhost.localdomain>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I've been using iptables as a firewalling router for a year and it's
worked brilliantly.

(O/T: It went into service after the Cisco-qualified engineers failed to
get their Cisco kit to meet our modest requirements!).

I now have a new requirement for just a firewall, i.e. no routing.

So the LAN will connect to one NIC and the other NIC will connect to the
ISP router.

So I assume that this will require a "virtual" bridge device to be set
up. And I've read that this isn't straightforward to get iptables to
work in this configuration.

So my question is: as an existing iptables user, should I be able to set
up a box for firewalling only as described?

If so, is there any (good!) documentation on this?

Or would I be better off with a firewall "appliance"?

Thanks in advance for any advice,

Leon...


