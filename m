From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Firehol DROPping INVALID
Date: Mon, 07 Jun 2004 10:15:31 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40C48693.5070404@pbl.ca>
References: <20040605201739.GA3481@hindley.uklinux.net> <200406061511.59730.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406061511.59730.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Antony Stone wrote:
> On Saturday 05 June 2004 9:17 pm, Mark Hindley wrote:
> 
> 
>>Hi,
>>
>>I have asked this on the Firehol lists, but got no response. Hope you
>>can help.
> 
> 
> I know nothing about (have never heard of) firehol, however here's my 
> observation on the rule you've quoted.
> 
> 
>>iptables -A OUTPUT -m state --state INVALID -j DROP
>>
>>Although the comment says this is recommended in the Netfilter HOWTO, I
>>cannot find it.
> 
> 
> It seems like a rather strange rule to have, to me.   Why would you expect 
> your own machine to be generating invalid packets (and therefore go to the 
> bother of writing a firewall rule to drop them)?

Interesting.  Just last night I installed new Linux-based firewall 
(Fedora Core 2 bundled iptables, stock Fedora Core 2 build of 
kernel-2.6.5).  I wrote firewall rules by hand, and observed exactly the 
same behaviour.

For the initial config, I used simplified set of rules that put 
restrictions only on WAN side, LAN was left unrestricted.  The rules 
looked something like this (recreating from memory) (eth0 is LAN, eth1 
is WAN):

*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]
#
#   Anything invalid should be dropped and logged prompto
#
-A INPUT -m state --state INVALID -j LOG --log-prefix "INVALID INPUT "
-A INPUT -m state --state INVALID -j DROP
-A OUTPUT -m state --state INVALID -j LOG --log-prefix "INVALID OUTPUT "
-A OUTPUT -m state --state INVALID -j DROP
-A FORWARD -m state --state INVALID -j LOG --log-prefix "INVALID FORWARD "
-A FORWARD -m state --state INVALID -j DROP
#
#   Allow already established connections
#
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
#
#   Local network is unrestricted, as well as local host
#
-A INPUT -i eth0 -s 192.168.0.0/24 -m state --state NEW -j ACCEPT
-A FORWARD -i eth0 -s 192.168.0.0/24 -m state --state NEW -j ACCEPT
-A OUTPUT -m state --state NEW -j ACCEPT
#
#   Log everything else
#
-A INPUT -j LOG --log-prefix "INPUT "
-A OUTPUT -j LOG --log-prefix "OUTPUT "
-A FORWARD -j LOG --log-prefix "FORWARD "
*nat
:PREROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING -o eth1 -s 192.168.0.0/24 -j MASQUERADE

After applying these rules, I got bunch of invalid packets in output 
chain.  When I get back home I can look and post exact logs (and recheck 
that above rules are exactly what I have on the firewall).  From memory, 
source IP was firewall LAN interface (192.168.0.f), destination IP was 
Windows box on LAN (192.168.0.w).  They were ICMP unreachables for 
packet that originated from Windows box (192.168.0.w) to outside DNS 
server (142.something), if I remember correctly.

I've never seen this before.  I've spent an hour trying to find error or 
typo, and trying different things, but couldn't get rid of those invalid 
packets in output chain.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

