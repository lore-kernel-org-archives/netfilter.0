From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: rc.firewall script
Date: Tue, 11 Nov 2003 00:44:54 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311110044.hAB0ivj17271@agate.rockstone.co.uk>
References: <Pine.LNX.4.53.0311101822110.1446@hardon.truncatedtetrahedron.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0311101822110.1446@hardon.truncatedtetrahedron.com>
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

On Tuesday 11 November 2003 12:24 am, Kelly Shutt wrote:

> Can someone look over my rc script.  I'm relatively new to iptables, so I
> just want to make sure I'm not doing something that's just totally insane.
> Any input on this would be nice, I'm still trying to figure out exactly
> how secure i want to get with this.

I would actually phrase the question the other way around - "how much access 
do I want to allow with this?" - in other words, stick to the principle of 
blocking everything except the traffic you know you want.

Anyway, regarding your script:

1. I would recommend leaving kernel forwarding off until your have completed 
setting up the rules, and then do "echo 1 > /proc/sys/net/ipv4/ip_forward" - 
that ensures that no packets can get through while you've only got half a 
ruleset installed.

2. I do not believe you can use REJECT as a policy on the INPUT chain - try 
DROP instead.

3. I *really* don't like the ACCEPT policy on the FORWARD chain.   Set it to 
DROP and then list rules for the packets you want to route.   Otherwise your 
"firewall" is actually just a router - ie: no security :)

4. What does your PREROUTING nat rule do?   TCP port 3389 seems to be 
something to do with Microsoft, called Terminal Server, but I don't 
understand why you're DNATting it to a range of IP addresses.   Don't you 
care which machine the connection goes to?

Hope this helps,

Antony.

-- 

Ramdisk is not an installation procedure.
                                                     Please reply to the list;
                                                           please don't CC me.

