From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Many Many table rules
Date: Tue, 14 Sep 2004 14:24:05 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41474555.1030207@pbl.ca>
References: <d82fbdb70409141006173a23f2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d82fbdb70409141006173a23f2@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Michael Eck wrote:
> I have a bridging traffic shaper that uses htb and sfq.  My iptables
> and kernel are patched with ipp2p and layer-7 filtering to mark p2p
> traffic.  Currently, this unit is at the head end of a broadband
> network.  I'm dividing up my users into htb classes based on their
> location on the network.  This amounts to 5 rules per IP address, 1
> for generic traffic, and 4 for ipp2p and a few layer7 rules.  That
> puts me at about 820 rules for the inside interface portion of my
> iptables.

It might be a good idea to optimize things using user defined chains. 
That way, packet that matches your 820th rule, wouldn't need to go 
through 820 rules.

For example, simple solution would be to have rules that match only by 
protocol, and than from them jump into the chain where you match by IP 
address, something like:

   -A FORWARD -p tcp --dport aaa -j mychain
   -A FORWARD -p tcp --dport bbb -j mychain
   -A FORWARD -p udp --dport ccc -j mychain
   -A mychain -s a1.b1.c1.d1 -d e1.f1.g1.h1 -j ACCEPT
   -A mychain -s a2.b2.c2.d2 -d e2.f2.g2.h2 -j ACCEPT
       ... and so on ...
   -A mychain -j DROP

Or you could do it the other way around (first by IP addresses, and than 
by protocol)...  Even with simple setup, if you have 200 clients and you 
are allowing 5 protocols per client, in worst case packet would go 
through 205 rules instead of 1000 rules.

Another idea that might work for you is using statefull matching, and 
putting rule that matches ESTABLISHED packets as the first rule of 
INPUT, OUTPUT and FORWARD chains, for example:

   -A FORWARD -m state --state ESTABLISHED -j ACCEPT

If this is the very first rule in forward chain, 99.99% of your network 
traffic will be matched by it (so as performance goes, it's like you 
have only one rule instead of 820).

Only the very first packet of each connection would have to go through 
subsequent rules (say 400 rules on average?).  And if you presorted 
packets to user defined chains first, than this number will be even lower.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

