From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: ICMP types
Date: Sat, 30 Apr 2005 18:36:08 -0500
Message-ID: <42741668.7060001@riverviewtech.net>
References: <8a79f08aaeef.8aaeef8a79f0@vsnl.net>	<42740CF5.9070705@riverviewtech.net>
	<Pine.LNX.4.60.0504301921220.3546@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.60.0504301921220.3546@darkstar.sysinfo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> just deny pings to the broadcast address and this can be eliminated, and 
> this can be done in sysctl, does not require iptables rules and overhead.

This will take care of traffic that was destined to a broadcast address, but not traffic that was destined to your IP directly.  I have known many a person say that it is better to DROP the ICMP traffic coming in on your WAN / INet interface so that you don't become part of a DDoS.  Usually the idea behind this is for multiple owned boxen to ping some other box at random with a spoofed source address in the ICMP packet.  This effectively will cause the recipient of the ICMP packets to reply to the system that is to be DDoSed.  This is an issue on the internet at large still these days. It would not take too many owned boxen connected to cable modems or DSL modems (or higher speed connections) spewing out spoofed ICMP packets to ultimately cause a DDoS against an unwilling target.  If the average CM's upload is 512 kbps and you have a 1000 owned boxen spewing out spoofed ICMP echos as fas
 t as they can you would end up with approximately 500 Mbps worth of inbound ICMP echo repl
ies (if the packet that was sent was an ICMP echo request) destined to the one target (assuming that the owned boxen sent with the same spoofed IP).  A LOT of people want to prevent them selves from becoming a reflector in such a DDoS.



Grant. . . .

