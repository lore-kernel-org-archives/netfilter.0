From: "Gregory Gerard" <ggerard@ggerard.com>
Subject: Network mapping from internal to external
Date: Sun, 3 Oct 2004 20:36:53 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200410040336.i943acIV023476@ylpvm29.prodigy.net>
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
To: netfilter@lists.netfilter.org

I'm not sure how to describe my setup and intended network in iptables
parlance. Have searched much and can't find anything that matches my
situation.

I have 5 static IPs from my ISP. Out the Ethernet end of my DSL box I see
those 5 IPs directly. I have no control over the router but that's fine.

I have many more than 5 machines in my network.

Internally, I have 10.9.x.x (255.255.0.0).

I would like to setup iptables such that 4 of the external IP addresses map
completely map onto exactly 4 internal IP addresses. The fifth external
address will simply be used to NAT for internal only machines.

What's the right mix of NICs and settings?

I was thinking about bringing up several eth0:1..4 interfaces to accept
those 4 external addresses and map them that way.

Suggestions?

Thanks!
greg



