From: Bob Iverson <bob@spectrum-comm.com>
Subject: router w/ iptables using nat and routing
Date: Tue, 21 Oct 2003 17:28:34 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <oprxe4xwgvv668az@mail.theiversons.us>
Reply-To: bob@spectrum-comm.com
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

i am setting up a router using rh8.0

it has 3 interfaces, eth0 66.119.211.74/30, eth1 64.146.167.254/27, eth1 
10.10.1.1/8

currently i use two routers to accomplish my need. that is to route from 
eht0 my isp link to eth1 my routable subnet, containing email, dns, vpn and 
web sites. and do NAT on eth1 to 10.10.1.1-10.10.1.255 for my customers who 
do not need routable addresses.
i can make one or the other work, nat 10.10.1.1 to the internet. or route 
64.x.x.x to the internet. but i have not been able to get both to work.

currently i have a router doing 66.119.211.74 to 64.146.167.254. and a 
router doing 10.10.1.1 to 64.146.167.228 w/NAT. then they are connected on 
the 64. network to allow access to dns, email and web.

is it possible to run one machine with 3 card to accomplish this task?

-- 
Bob Iverson
SPECTRUM COMMUNICATIONS
765-7773
bob@spectrum-comm.com

