From: Andrew Schulman <andrex-cmaem7PIVQQM4YKboWzA4l6hYfS7NtTn@public.gmane.org>
Subject: Re: udp port 1025
Date: Mon, 20 Sep 2004 05:37:48 -0400
Sender: netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Message-ID: <cim8dc$pgf$1@sea.gmane.org>
References: <a0f69e5040920004411e0eeb6@mail.gmail.com>
	<1403218a04092001376308ea4a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=subscribe>
Errors-To: netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org

>> iptables -A INPUT -p TCP -s 0/0 -d 0/0 --dport 1025 -j DROP
>> iptables -A FORWARD -p TCP -s 0/0 -d 0/0 --dport 1025 -j DROP
>> iptables -A OUTPUT -p TCP -s 0/0 -d 0/0 --dport 1025 -j DROP
>
> http://www.linklogger.com/TCP1025.htm

Er... that's TCP.  But Mohamed is right, look around for some port lists.  I
don't see 1025/UDP on any of them.  E.g.
http://www.iss.net/security_center/advice/Exploits/Ports/ doesn't list any
particular use for 1025/UDP (or TCP either), except that it's the first
user-allocable port, so it's not surprising that some hosts should be using
it.

So I say get rid of those rules.
A.



