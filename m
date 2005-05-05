From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: IP + MAC filter -  wireless client
Date: Thu, 05 May 2005 03:10:24 -0500
Message-ID: <4279D4F0.8050502@riverviewtech.net>
References: <cae754caa373.caa373cae754@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <cae754caa373.caa373cae754@vsnl.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> How do you handle a client connected to the LAN
> via wireless. In such a case there will be more
> than one MAC address in the route.

How are you going to have more than one (source) MAC address?  If you are routing then the MAC address that will be seen by the IPTables firewall will be the MAC address of the router that is doing the routing for you, not the MAC of the wireless card.  If you are using an AP that is in bridging mode the MAC that will be seen by the IPTables firewall should be the MAC address of the physical wireless card, not of the AP/Bridge.  The MAC of the AP/Bridge only comes in to play when you connect to it's management interface, not normal traffic flow.  (Does any one else care to comment / correct me on this?)



Grant. . . .

