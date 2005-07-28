From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: ESTABILISHED connections are not that estabilished
Date: Thu, 28 Jul 2005 05:41:44 -0500
Message-ID: <42E8B668.3030201@gmx.co.uk>
References: <dc8blc$p5s$1@sea.gmane.org> <dca9si$kis$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <dca9si$kis$1@sea.gmane.org>
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
To: netfilter <netfilter@lists.netfilter.org>

Gioele Barabucci wrote:
>>In my logs I often find reports of dropped input packets from my DNS:53 or
>>dropped output packets generated from localhost:25 to other mail servers.
>>Why are these packets dropped?

I have a theory and a suggestion.

>   iptables -P OUTPUT DROP

Bad idea (see below.)

>   iptables -P FORWARD DROP # just for fun, I don't do any routing

Good idea. Even if not routing it doesn't hurt to take these out at the 
firewall level.

>   iptables -A OUTPUT -p udp --dport nameserver -j ACCEPT
>   iptables -A OUTPUT -p tcp --dport nameserver -j ACCEPT

Theory:
# iptables -vA OUTPUT -p tcp --dport nameserver
   tcp opt -- in * out *  0.0.0.0/0  -> 0.0.0.0/0  tcp dpt:42
# iptables -vA OUTPUT -p tcp --dport domain
   tcp opt -- in * out *  0.0.0.0/0  -> 0.0.0.0/0  tcp dpt:53
I cannot see into your /etc/services, but mine resolves "nameserver" to 
"42". (R.I.P., D. Adams.)

>   echo "Logging"
>   iptables -A INPUT -m limit --limit 3/second --limit-burst 5 -i ! lo -j LOG
> --log-level "debug" --log-ip-options --log-tcp-options --log-prefix
> 'iptables INPUT DROP '
>   iptables -A INPUT -m limit --limit 3/second --limit-burst 5 -i ! lo -j
> ULOG --ulog-prefix 'iptables INPUT DROP '
>   iptables -A OUTPUT -m limit --limit 3/second --limit-burst 5 -o ! lo -j
> LOG --log-level "debug" --log-ip-options --log-tcp-options --log-prefix
> 'iptables OUTPUT DROP '

Whoa, that is a lot of logging! What do you expect to find in all that? 
Why LOG and ULOG both?

>   echo "REJECT for outgoing packets"
>   iptables -A OUTPUT -j REJECT # reject, don't DROP outgoing packets

It's cleaner to limit this to "-p tcp".


Suggestion: OUTPUT filtering is a bad idea. Carefully crafted rules to 
limit what your daemons can do with -m owner might slightly enhance 
security. General OUTPUT filtering only guarantees that things won't 
work well.

Why are you doing it? What is the benefit you think you are getting? 
This sounds like a single user machine, from the fact that there's no 
routing. Who are you limiting with OUTPUT rules? Yourself?

I would do OUTPUT -p ACCEPT and eliminate the OUTPUT rules. I'd also do 
away with the logging, or at least tightly curtail it. I usually only 
log for specific short-term reasons (troubleshooting a problem.) I'd 
include a "-m state --state INVALID -j DROP" rule for good measure. 
Finally, I'd move your --state rules to the top.

At that point everything would be working as you expect, and you would 
have a very tight firewall.
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

