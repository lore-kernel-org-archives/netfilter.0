From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Voice
Date: Wed, 25 Aug 2004 09:34:07 -0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <015801c48a9f$d037d690$49caa8c0@caris.priv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello everyone,

I am trying to get msn voice to work at my company.  We have an internal and
an external firewall with a dmz in the middle.  All DMZ boxes are on
routable IP's with their own network (ex 200.200.200.x/26).  The external
firewall is on its on external network as well (210.200.200.200/29).

All internal clients have the internal firewall as their gateway.  If they
are going on the web they point to a proxy server in te DMZ.  The internal
firewall does not have a route to the external firewall.  I set up static
routes on the internal firewall for any nats.

Currently I have msn set up to work through squid.  I did some sniffing when
trying to get the voice to work and it looks like the internal client tried
to make a nother connection for the voice with a source IP as itself and a
destination of the remote voice client.  This of course would not work
because 1, it is going to the net with an internal ip, and 2, my internal
firewall does not know how to get to the remote host.

Does anyone have any suggestions how I could fix this problem, or know of a
better chat client for voice ?

Thank you for your help.

Peter


