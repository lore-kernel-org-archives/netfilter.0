From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: iptables, portforward, DNAT, SNAT
Date: Thu, 31 Oct 2002 22:54:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DC1A6A1.6060900@fugmann.dhs.org>
References: <542FEF78.196CA339.03240133@netscape.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Thomas Meindl <methodaut@netscape.net>
Cc: netfilter@lists.netfilter.org

Thomas Meindl wrote:
> Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
> 
> no, i didn't write it that way in the actual script.
> just to save some tipping here..
> 
> * stands for the three below
> 
> sorry for that confusing
> I simply should have copied and pasted it like
> 
> echo 1 > /proc/sys/net/ipv4/ip_dynaddr
> echo 1 > /proc/sys/net/ipv4/ip_forward
> echo 1 > /proc/sys/net/ipv4/tcp_syncookie
> 
>>># enable masquerading
>>>iptables -t NAT -A POSTROUTING -o $EXTIF -j MASQUERADE
>>
>>"NAT" in this rule should read "nat" - it matters !
>>
> 
> 
> spelling mistake sorry! nat
> 
Something that completely eludes me. You have hand typed the script you 
  post for debugging? Then how do you know that the error is in the script?

Try to narrow the problem down to a very small set of rules, and test 
the script. If it still does not work then post the script as is - copy 
and paste. I imagine that over 50% of all script questions posted to 
this list would answer itself, it the scripts posted had actually been 
tested.

I'm not flaming you, and apologize if you take it that way.
I'm trying to provide you with the tools to solve the problem. I guess 
that if you work systematically, then one of two will happen: you
solve the problem yourself, or you will be able to ask very 
accurate/specific questions to the list, which has a much higher chance 
of being answered correctly.

Regards
Anders Fugmann


