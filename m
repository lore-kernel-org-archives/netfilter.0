From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: multiple mapping
Date: Wed, 01 Sep 2004 07:33:08 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094038388.2034.15.camel@localhost>
References: <006701c48ff9$9627b5b0$2a245cc2@cea05>
	<1094036834.2045.2.camel@localhost>
	<007f01c49015$9544e610$2a245cc2@cea05>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <007f01c49015$9544e610$2a245cc2@cea05>
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
To: Tomek Macioszek <tomekm@cea.pl>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-09-01 at 07:19, Tomek Macioszek wrote:
> Thanks for help. I have just only one question?
> If I make multiple mapping like this:
> iptables -t nat -A POSTROUTING -s 192.168.10.0/24 -o eth0 -j SNAT --to
> 4.3.2.0/24
> I should bind all this addresses (4.3.2.0/24) to eth0?
> ip address add 4.3.2.2/24 dev eth0
> ip address add 4.3.2.3/24 dev eth0
> ip address add 4.3.2.4/24 dev eth0
> ....
> ip address add 4.3.2.254/24 dev eth0
> Best regards
> T.
<snip>
If that is what you want to do, you will probably want to use the NETMAP
target from patch-o-matic.  The rule that you propose does not guarantee
a one-to-one mapping.  It does a round-robin mapping.  Thus there is no
guarantee that 192.168.10.5 maps to 4.3.2.5. In fact, it most likely
will not.

As far as I know, you will need to bind all of the addresses so that
they respond to the ARP requests.

This is where a tool like ISCS comes in handy
(http://iscs.sourceforge.net).  Not only does it automate the access
control configuration but it automates NAT and ARP.  You would simply
create a server with a private IP address of 192.168.10.1-192.168.10.254
and a public address of 4.3.2.1-4.3.2.254 and check the enforce
one-to-one box.  It would then create all the NAT rules, the address
bindings for ARP and distribute them to the gateway.  The project only
has pre-alpha releases thus far but we are moving quickly toward a full
release.  Good luck - John
-- 
John A. Sullivan III
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevel.com


