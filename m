From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: strange ip-number
Date: Mon, 23 Sep 2002 15:40:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209231440.g8NEeFv24643@vulcan.rissington.net>
References: <3D8DD395.4070307@aon.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D8DD395.4070307@aon.at>
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

On Sunday 22 September 2002 3:28 pm, Johann Klonner wrote:

> Hallo
> I got spam mail containing "href=http://f2m.aac.com.tw". I think, this
> mail connected with this URL. So I block ed this URL in my iptables script:
>
> "iptables - A OUTPUT - o ippp0 -p tcp -d http://f2m.aac.com.tw -j REJECT"

It is not recommended to use hostnames in netfilter rules.   It will not work 
if your machine cannot resolve the hostname at the time your ruleset gets 
loaded, and it will not do what you expect if that hostname actually resolves 
to multiple IP addresses (which is common with large web server or mail 
server farms).

> I wanted to find out the IP number with "ping", but ping timed out
> without an answer.

Either the destination machine was turned off, unplugged, blocked by a 
firewall, or for some other reason wasn't contactable using ICMP at the time 
you tried this.   It's not unusual.

For example, try pinging www.microsoft.com   It won't answer.   Doesn't mean 
the webserver's down - just means it's not answering ICMP.

> iptables -L -v produced ff output:
>
> OUTPUT ...
> "211-23-43-85.HINET-IP.hinet.netreject with icmpport unreachable"
>
> can somebody tell me the meaning of this output?

The hostname you see here is the reverse lookup of the forward lookup of the 
hostname you put in the original rule.

Again, it's not unusual for these to be different (in fact it's one test 
sometimes carried out on mail servers to decide whether they appear to be 
legitimate - see whether the reverse lookup matches the forward lookup).

I'll give you an example from my own network.   I have a block of 32 IP 
addresses from my ISP.   I have my own domain, and I run my own name server, 
so I can forward resolve any name I like within that domain to any IP address 
I like, including ones within my 32 IP range.

However, my ISP runs the reverse DNS for their entire IP range (including the 
32 addresses they let me use) so reverse resolving one of those addresses 
bears no resemblance to the hostname I decided to configure the forward 
resolver from.

> And why did ping time out without any
> comment such as icmpport unreachable?

There is no such thing as "ICMP port unreachable" for the simple reason that 
ICMP does not use ports.

ICMP uses type numbers, and code numbers, but there is also a requirement 
that ICMP packets must not be generated in response to other ICMP packets 
(except for the obvious exceptions such as echo request -> echo reply).

Therefore if you do not get a positive response to a ping you get nothing at 
all.

Antony.

-- 

How I want a drink, alcoholic of course, after the heavy chapters
involving quantum mechanics.

 - 3.14159265358979

