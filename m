From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: default policy
Date: Fri, 1 Nov 2002 18:22:00 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0211011820180.3625-100000@dell>
References: <NEENJAPFEAIEMGMNIGFLGEABCEAA.rwideman@austin.rr.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NEENJAPFEAIEMGMNIGFLGEABCEAA.rwideman@austin.rr.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Thu, 31 Oct 2002, Rob wrote:

> I have been looking at several scripts checking the default policies on
> them.
> Some include items that others don't.  Oscars tutorial doesn't cover all of
> these compared to Ziegler's book.  I have been wondering if the following
> covers ALL built-in chains?
> iptables -P INPUT   DROP
> iptables -P OUTPUT  DROP
> iptables -P FORWARD DROP

nope, only for the filter table.
 
> Ziegler's book states that it should be this (it was never put in these
> words but this is what I am gathering from my reading):
> iptables -t nat    -P PREROUTING  DROP
> iptables -t nat    -P OUTPUT      DROP
> iptables -t nat    -P POSTROUTING DROP
> iptables -t mangle -P PREROUTING  DROP
> iptables -t mangle -P OUTPUT      DROP
> iptables -t filter -P INPUT       DROP
> iptables -t filter -P OUTPUT      DROP
> iptables -t filter -P FORWARD     DROP

while this is missing the newer chains in the mangle table, the
bigger issue is what it even means to put DROP policies on chains
in the nat and mangle tables.

apparently, it's legal -- i tried it and it took the policy
assignment.  i just have no idea what it means to do this.

rday


