From: felix@crowfix.com
Subject: Newbie question about NAT and forwarding
Date: Wed, 6 Sep 2006 13:52:32 -0700
Message-ID: <20060906205232.GA23980@crowfix.com>
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

I have a small network with a gateway machine which has two interfaces
to the internet.  One is (yes!) ppp0, a dialup account, the other is a
broadband connection.  Some of the network machines behind the gateway
have real static addresses, some have 192.168.* or similar local net
addresses.  The dialup account has static real addresses for those
local net machines which need internet access, but the broadband
connection gets its address dynamically from DHCP.  As much as it
would be nice to ditch the dialup account altogether, that is not
practical at the moment.

I would like all the local net machines to not be aware of there being
multiple connections, to route all SMTP traffic, both in and out, thru
the dialup account, and to route all other traffic thru the broadband
connection.

I think I know how to route based on the protocol.  For SMTP, that is
made easier by not needing to NAT anything.  But I need NAT for all
other traffic using the broadband connection, right? since it has only
a single synamically assigned DHCP address.  This is where I get
confused.

What iptables commands would I used to route non-SMTP packets between,
say, eth0 (local net, static real addresses) and eth1 (broadband DHCP)?

-- 
            ... _._. ._ ._. . _._. ._. ___ .__ ._. . .__. ._ .. ._.
     Felix Finch: scarecrow repairman & rocket surgeon / felix@crowfix.com
  GPG = E987 4493 C860 246C 3B1E  6477 7838 76E9 182E 8151 ITAR license #4933
I've found a solution to Fermat's Last Theorem but I see I've run out of room o

