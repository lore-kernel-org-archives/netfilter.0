From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: netmeeting (incoming and outgoing connection)
Date: 28 Apr 2003 03:08:04 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051513684.2388.138.camel@alpha.newkirk.us>
References: <33659.172.16.28.1.1051508134.squirrel@pat.dyndns.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <33659.172.16.28.1.1051508134.squirrel@pat.dyndns.info>
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
To: Patrick Kwan <pat@pat.dyndns.info>
Cc: netfilter@lists.netfilter.org

On Mon, 2003-04-28 at 01:35, Patrick Kwan wrote:
> Hello,
> 
> I'm using iptables NAT to allow lan client to access internet.
> if i patch my kernel with netfilter's POM and load the required
> H323 modules.
> 
> I want to confirm if h323 modules also allow "Incoming connection"
> to Netmeeting in internal lan client?

If you're talking about a new connection being initiated, then it's the
same as with any other NAT situation - you have to explicitly DNAT new
incoming connections to a local IP if you want them to reach a
particular target.  Otherwise they will end up in the INPUT chain,
destined for the firewall/nat box itself.  As long as you only need
incoming NEW state connections to reach a single client, just add a DNAT
rule to nat PREROUTING to handle them. If you need multiple internal
clients to be able to receive NEW connections from outside the network,
you have a problem.  (however, you would anyway, regardless of
firewall/NAT solution - this is a limit imposed by the nature of NAT
itself, not netfilter)

> Please clarify me. (already search the past thread)
> Many thanks your advices.
>
> Patrick

j



