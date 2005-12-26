From: "Richard Pickett" <Richard.Pickett@CSRTechnologies.com>
Subject: Strange FORWARD problem
Date: Sun, 25 Dec 2005 18:57:39 -0600
Message-ID: <00c201c609b7$601ce790$1101a8c0@quebec>
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

Stock RH FC4 kernel, 2.6.11 - no modification or patches.

I have a special script that generates the correct iptables settings
from a configuration file. Basic NAT, Routing, and IN/OUT capability.

Everything that comes into INPUT, OUTPUT, and FORWARD goes through the
following logic:

1. We check the state to see if it is RELATED,ESTABLISHED, if yes, jump
ACCEPT
2. Log, we log the inbound packet, indicating which chain it is coming
on (INPUT, OUTPUT, FORWARD).
3. check against a "DROP" list of addresses we reject all traffic
to/from.
4. check against "allow" rules
5. log and Drop the packet.

Well, we've run into an intermittent problem. What we are seeing is
after different amounts of time (sometimes a few hours, sometimes
several weeks) suddenly forwarding breaks. It just doesn't forward
anything that is D or S NATed.

We iptables-save > file and check it all over, and the logic is all in
place just like I list above. At a minimum things hitting the forward
chain should at least get logged, but they don't, the only logging is
INPUT and OUTPUT.

We can turn right around and cat file | iptables-restore and "magically"
it all starts working again.

It's like it just needs to be bumped every once in a while to make it
keep running.

Any ideas? Are there some kernel logging things we can try or other
things we need to be looking at to determine this problem?

We don't touch anything except the iptables-restore to make it work
again, so things like /proc/sys/net/ipv4/ip_forward aren't touched at
all to make it work.

Thanks for any ideas and all help!


