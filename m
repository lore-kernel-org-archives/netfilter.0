From: Bill Davidsen <davidsen@tmr.com>
Subject: Re: iptables local port forwarding
Date: Sat, 03 Apr 2004 12:30:38 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <c4ms44$qhg$1@gatekeeper.tmr.com>
References: <20040403095005.GA4511@scholars.home> <200404031127.02648.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404031127.02648.Antony@Soft-Solutions.co.uk>
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
> On Saturday 03 April 2004 10:50 am, Mark Ord wrote:
> 
> 
>>I have iptables setup, firewalling eth0 (the internet) extensively, and
>>doing NAT for my lan, and some custom port forwards.
>>
>>One is forwarding port 81 -> 80 - due to my provider firewalling port
>>80:
>>     iptables -t nat -I PREROUTING -p tcp --dport 81 -j REDIRECT --to 80
>>
>>This works for connections coming in on both eth0, and eth1. However, I
>>can't connect to port 81 on the iptables machine (no matter what
>>iptables rules I try).
> 
> 
> That rule looks fine to me, and you must obviously have an appropriate INPUT 
> rule allowing the connection to port 80 after the REDIRECT has completed, 
> otherwise you wouldn't be able to connect directly to port 80 which you say 
> works fine.
> 
> The only thing I can think to ask is whether "iptables -L -t nat -nvx" shows 
> the packet/byte counters for this rule incrementing when you do try to access 
> port 81?
> 
> Perhaps a few judicious LOGging rules (before and after the REDIRECT in the 
> nat table, before and after the ACCEPT in the INPUT chain) will tell you 
> something useful?

Actually, you need to allow port 81 in, it doesn't become 80 until after 
the rewrite.

-- 
bill davidsen <davidsen@tmr.com>
   CTO TMR Associates, Inc
   Doing interesting things with small computers since 1979

