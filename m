From: Philip Craig <philipc@snapgear.com>
Subject: Re: conntrack question - what happens after timeout?
Date: Wed, 23 Nov 2005 15:55:34 +1000
Message-ID: <43840456.1000002@snapgear.com>
References: <43819555.9030005@hilton.rwth-aachen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43819555.9030005@hilton.rwth-aachen.de>
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
To: Daniel Sievers <sievers@hilton.rwth-aachen.de>
Cc: netfilter@lists.netfilter.org

On 11/21/2005 07:37 PM, Daniel Sievers wrote:
> since recently we have had some problems with the conntrack table
> growing too large and thus I experimented with lowering
> /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_established
> from 5 days to a couple of hours.

Perhaps increasing your memory to match the workload is a better solution.

> One thing I am still curious about though:
> What happens after established connections timeout if packets arrive
> which still belong to that connection? Do they get dropped automatically
> by netfilter or do I have to set up a rule to accomplish this?

The packets will not match any existing conntrack, and so a new
conntrack will be created.  If you want to drop these packets,
then you will need a rule such as:

iptables -A FORWARD -p tcp ! --syn -m conntrack --cstate NEW -j DROP

Note that a conntrack state of NEW does not imply that the SYN flag is set.

> In other words: Is the conntrack code merely about managing a table with
> connection states that gets used e.g. in the NAT code and can be used to
> query the state of connections in iptables rules or does it perform
> stateful inspection itself and (based on that) packet dropping etc. too?

The conntrack code determines whether the packet belongs to a
NEW or ESTABLISHED conntrack etc.  Whether packets are dropped based
on that state is entirely up to the iptables rules.

