From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: weird iptables behaviour
Date: Fri, 16 Sep 2005 00:45:45 -0500
Message-ID: <432A5C09.5000105@riverviewtech.net>
References: <20050915214651.76113.qmail@web60914.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050915214651.76113.qmail@web60914.mail.yahoo.com>
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
To: Gabriel <jarod125@yahoo.com>
Cc: netfilter@lists.netfilter.org

Gabriel wrote:
> I'm connecting to an openvpn box from a remote location. I
> can access the box I'm connecting to (I'm getting ping
> replies), but nothing that's beyond it (the box serves as a
> gateway for other clients). I'm using openvpn's --dev tap0
> because i need to pass non-ip packets through the tunnel.
> On the openvpn box, FORWARD policy is DROP, so I did
> "iptables -I FORWARD -i tap0 -j ACCEPT" and thought this
> should do the trick. But I was wrong. The only solutions I
> found were either set FORWARD policy to ACCEPT (not happy
> with that) or insert an iptables rule in the FORWARD chain
> that gives access based on the MAC address. I'm probably
> going to use the latter, but I can't really understand why
> "iptables -I FORWARD -i tap0 -j ACCEPT" won't work. Isn't
> this supposed to let ALL packets (not just ip packets) pass
> through? I'm thinking that it has something to do with the
> fact that i'm using --dev tap0 (tap0 is bridged with eth1 -
> the LAN facing interface - and they form br0) which is
> layer2 but, as I said before, -i tap0 -j ACCEPT should work
> as well...

First of all you will need to have a corresponding rule:

iptables -I FORWARD -o tap0 -j ACCEPT

To allow traffic in the reverse direction too.

Did you compile your bridging support with bridge-nf support?  If you did you will need to do some more work to allow your traffic to pass through.  This is because the bridge-nf code allows IPTables to see the traffic that is passing on layer 2 as if it was on layer 3.  Thus you will probably need a rule like this:

iptables -I FORWARD -i br0 -o br0 -j ACCEPT



Grant. . . .

