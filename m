From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Unexpected RSTs?
Date: Fri, 11 Oct 2002 14:03:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210111303.g9BD3mL19306@vulcan.rissington.net>
References: <200210111434.52124.mklingens@ism.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210111434.52124.mklingens@ism.nl>
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

On Friday 11 October 2002 1:34 pm, Martijn Klingens wrote:

> Please consider the following piece of our firewall script's output:
>
> iptables -A acl_lan -p tcp --tcp-flags RST RST -j log_lan
> iptables -A log_lan -p tcp --tcp-flags RST RST -j LOG \
>         --log-level debug --log-prefix '* DROP: Unexpected RST * '
>
> The last line intrigues me. We drop these packets since quite a while, but
> didn't log them until yesterday. It turns out that almost 15% of my
> firewall log now consists of packets qualifying as 'Unexpected RST' though.

Depending on what else you're logging, 15% of your log entries could be a lot 
of packets, could be only a few....

> But... isn't the conntrack code at the beginning supposed to take care of
> accepting RSTs if they are associated with an active connection?

Yes.

> I'm a bit surprised to see this to say the least. It's not a subnet-wide
> portscan at least, the dropped packets definitely seem to indicate
> legitimate traffic.

I'd expect the reason might be a system sending two RST packets (I believe 
this is quite common, but I haven't done any specific network sniffing to 
check it out).   The first one takes down the connection so it is no longer 
ESTABLISHED, the second one gets logged because it doesn't correspond to an 
established connection...

Maybe you could try putting a LOG rule to catch *all* RSTs at the beginning 
of your rules (before even the ESTABLISHED, RELATED rule) and see if this 
shows they are coming along in pairs ?

Antony.

-- 

Most people have more than the average number of legs.

