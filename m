From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Please help me with iptables/NAT
Date: Mon, 16 Feb 2004 15:33:48 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402161533.48922.Antony@Soft-Solutions.co.uk>
References: <4030E03D.6050502@ciaolab.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4030E03D.6050502@ciaolab.com>
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
To: netfilter@lists.netfilter.org

On Monday 16 February 2004 3:22 pm, Matteo Pampolini wrote:

> Hi everybody,
>
> I have a Linux box running kernel 2.4.17 and iptables 1.2.5 where
> a DNAT rule is applied and I'm experiencing a strange behaviour.
>
> If I delete the rule while no connections related to it are active,
> then everything works fine, otherwise rule is apparently deleted
> but network traffic is still active while it shouldn't.
>
> Same thing with another box doing masquerading: if a start a ping
> from the inside private network to the outside and the remove the
> rule, then the rules listing is OK but ping still works.

If you are using connection tracking (which most people do, because it is the 
'stateful' bit about netfilter), then once a connection has been ESTABLISHED, 
further packets in the same connection get processed automatically in the 
background without having to match on the current ruleset.

A good way to think about it is: "the ruleset specifies which NEW packets are 
allowed to become ESTABLISHED.   Once a connection is ESTABLISHED, further 
packets are processed as efficiently as possible, withing having to get 
processed through the rules all over again."

If you don't like this behaviour, and you want each packet to match against 
the ruleset, disabling connection tracking on your firewall will achieve what 
you want.

Hope this helps,

Regards,

Antony.

-- 
Wanted: telepath.   You know where to apply.

                                                     Please reply to the list;
                                                           please don't CC me.


