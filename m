From: asbaeza@catsanet.com.mx
Subject: Iptables and WAN
Date: Thu, 11 Nov 2004 22:32:06 -0600 (CST)
Message-ID: <32969.201.129.61.133.1100233926.squirrel@www.catsanet.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi

We have a VPN. We use iptables in each point and everything is fine. Now
we are changing to a WAN model, but we have a problem.
First, we need remote users to get into the linux box in our corporate.
this bos is the firewall for the corporate LAN. Using VPN works fine till
here.
When we try to connect using the (new) WAN interfaces (using CISCO
routers) we get "operation not permited" error messages. When we change
the default route of one PC in the LAN to the new router and make a
connection from the WAN to that PC it works fine, so the problem is in the
linux bos, indeed with iptables. When I connect from the router to the
linux bos, it works fine, but when trying to connect from the WAN IP or
from other router in the WAn I get the "operation not permited" error. I
think it is a problem related ro reassembling of packages, but have no
idea where to find something helpfull.

Any idea?

Thanks in advice.

Armando Soto

