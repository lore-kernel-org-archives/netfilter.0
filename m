From: Gordon Heydon <gordon@heydon.com.au>
Subject: Problem with Port Forwarding and multiple Internet links
Date: Fri, 31 Dec 2004 11:04:15 +1100
Message-ID: <1104451455.5503.24.camel@horse>
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

Hello,

I am having a problem with setting up a clients firewall, with Internet
access.

The set up is that they have 2 adsl connections for which they have a
default connection that all the normal ad-hoc traffic runs though, and a
second 512/512 adsl link that they use for vpn access, both in and out,
as well as some terminal services access, and minor web sites.

We have just changed the primary link to another ISP, and anything that
is being port forwarded to machines behind the firewall such as the web
servers and terminal services are not getting routed correctly back out
to the world.

eg. The packets for the terminal server are coming in though the 512/512
link as they are suppose to, and getting forwarded onto the terminal
server. The packets coming back are then being sent back out through the
main link, but with the source ip address being the re-written back to
the correct address from the 512/512 link where it came in.

I was to the best of my knowledge working correctly before the change
over to the new ISP. I think their is something I am missing but I just
can't see it.

IMO as the masquerading is happening in the POSTROUTING and getting the
source address is getting written then, the ip rule to tell it to use a
different routing table from the main one is being missed, and the going
through the default route. It is like it needs to be run back though the
routing again.

here are my routing tables and rules. I am running on quite an old
version on the kernel, 2.4.21. I am a bit reluctant to upgrade because
of the procedures that I will have to go through to make this happen and
it is not the actual kernel upgrade.

stealth:/etc/bind# ip rule list
0:      from all lookup local
32762:  from all to 202.x.x.0/24 lookup vpn
32763:  from all to 202.x.x.0/24 lookup vpn
32764:  from all to 202.x.x.0/24 lookup vpn
32765:  from 218.x.x.x/28 lookup vpn
32766:  from all lookup main
32767:  from all lookup default

stealth:/etc/bind# ip route list table vpn
218.x.x.0/28 dev eth2  scope link  src 218.214.208.9
192.168.211.0/24 dev ipsec1  scope link
default via 218.x.x.x dev eth2

Any help will be most appreciated.

Thanks in advance.
-- 
Gordon Heydon <gordon@heydon.com.au>


