From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: UDP forwarding trouble
Date: Wed, 3 Aug 2005 12:09:19 +0100
Message-ID: <20050803110919.GQ18838@metastasis.org.uk>
References: <42E53D5C.2050004@pierre.juhen>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <42E53D5C.2050004@pierre.juhen>
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

On Mon, Jul 25, 2005 at 09:28:28PM +0200, Pierre JUHEN wrote:
> I have a problem with iptables.
> 
> This is the configuration
> 
> +---------+                 +---------+                 +---------+
> |         |                 |         |                 |         |
> |    A    +-----------------+    B    ++----------------+    C    |
> |         |                 |         |                 |         |
> +---------+                 +---------+                 +---------+
> 
> A sends UDP packets (ports p1, p2, p3) to C through B.

If the packets are being sent from A to C...

> There is a continuous flow of UDP/p1 packets (10 packets/s) whilst
> p2 and p3 are more seldom.
> 
> When I activate a rule to  redirect all UDP packets from A to B
> the rule seems to be applied only to p2 and p3 ports, p1 packets
> are still forwarded directly.

...why do you need to redirect packets?

Are you sure that the three rules ( presumably ) dealing with the three
ports are all the same?  Can you post the rules here, with the necessary
obfuscation of course.

-- 
Any ship can be minesweeper, once.


