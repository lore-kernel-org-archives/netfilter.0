From: Magnus Solvang <magnus@solvang.net>
Subject: lan users surfing on lan webserver
Date: Tue, 25 Feb 2003 22:53:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030225215326.GA30804@first.knowledge.no>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm configuring a firewall on a network where we have put
the webserver on the inside of the firewall and given it
a reserved ip-address.
I have done the appropriate forwarding so that the webserver
can be reached from the internett. Trouble is, users on the
LAN have to use its internal ip-address to reach the web-
pages. I know I can set up an internal dns-server to fix this,
but I was hoping it would be possible to solve this with some
more ip-forwarding.

Is it possible to forward internal requests going to the
external webserver-address back into it's internal address?

Is it recommended? :)

I have found one example of this behaviour vie google, but
it doesn't work.

- M

