From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Re: LOG one particular IP traffic (Antony Stone)
Date: Thu, 8 Apr 2004 18:36:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404081836.30490.Antony@Soft-Solutions.co.uk>
References: <006a01c41d89$94419eb0$da0da8c0@pisic>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006a01c41d89$94419eb0$da0da8c0@pisic>
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

On Thursday 08 April 2004 5:50 pm, Danila Octavian wrote:

>  I'm sorry for posting twice but i messed up my mail accounts... I was
> sending to the list from a non-member account... I fixed that ...

Okay :)

> but regarding my problem  ... i don't know how am I supposed to log
> everything originating from 192.168.13.222 going to 0.0.0.0 except three
> destinations : - intip
> -extip
> -localnet
>
> can you give me an example line : iptables -A ... ?

iptables -A POSTROOUTING -t mangle  -o eth0 -s 192.168.13.222

Yes, that's the entire rule - there is no -j TARGET at the end :)

How does this work?

1. It is in the POSTROUTING mangle table, therefore it's the very last bit of 
netfilter before the packet hits the wire - this means you catch *all* the 
packets (the filter and nat tables will miss some, for connection tracking 
reasons).

2. It's looking at packets leaving eth0 (I'm assuming this is your external 
interface - change as appropriate if not), so it's not going to see anything 
addressed to your internal machines or the firewall itself.

3. It matches packets with a source address of the one machine you are 
interested in, and.... well... simply counts them.   There is no target at 
the end of the rule, so nothing special happens to the packets (they're not 
dropped, or accepted, or rejected, or natted, or mangled), however the 
byte/packet counters for the rule will still tell you how many matched.

4. Every time you want to know how many packets & bytes have some from that 
machine, do a "iptables -L -t mangle -nvx" and the first two columns tell you 
what has matched the rule (this is probably your only rule in the mangle 
table).

Hope that helps,

Antony.

-- 
"The joy of X!!??  I've always hated compiling graphical shite.  You have a 10 
line program, and it ends up depending on the entire known universe."

 - Philip Hands

                                                     Please reply to the list;
                                                           please don't CC me.


