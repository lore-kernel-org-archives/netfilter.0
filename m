From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: counting packets and bytes
Date: Mon, 28 Oct 2002 13:39:56 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210281340.g9SDdxe08458@vulcan.rissington.net>
References: <Pine.LNX.4.44.0210280821560.7961-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210280821560.7961-100000@localhost.localdomain>
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
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Monday 28 October 2002 1:25 pm, Robert P. J. Day wrote:

>   i'm sure i saw somewhere a reference to using iptables rules
> just for counting packets.  how did that work?  if i recall correctly,
> it had to do with the fact that the target part of a rule was optional,
> and i could forward the packets i wanted to count through a chain
> or rule that did, essentially, nothing, but i could use
> "iptables -L" later to get statistics.
>
>   pointer, anyone?  i'm pretty sure this required a user-defined
> chain, but i forget the format.

It certainly doesn't *require* a user-defined chain.   You can use one if you 
want, though.

All rules count the packets & bytes which match them.

It is also perfectly valid to write a rule with no target, eg:

iptables -A FORWARD -i eth0

or

iptables -A FORWARD -s 192.168.1.0/24 -p tcp --dport 80

These rules will match all packets coming in from eth0, and all packets from 
Class C network 192.168.1.0 going to TCP port 80 somewhere, respectively.

You can find out how many bytes & packets matched each rule with

iptables -L -n -v -x

The -L lists the rules, I like the -n because it doesn't do reverse name 
lookups and so is quicker and has a more consistent output format, the -v 
shows the values of the packet and byte counters, and the -x shows these as 
full-size integers - without it you'll get things truncated with k and M 
after them for thousands and millions.

If you want to put all your "targetless" rules in a single user-defined chain 
(for example, called "counters"), and then jump to that chain from INPUT, 
OUTPUT or FORWARD, it will not change the logic of your ruleset (no packets 
will get ACCEPTed, DROPped or REJECTed - they will simply all fall out of the 
end of your user-defined chain and then contineu as before), and you can get 
a display only of these packets by listing only that chain, eg:

iptables -L counters -n -v -x

Antony.

-- 

90% of network problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

