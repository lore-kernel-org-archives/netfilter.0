From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: traceroute
Date: Wed, 30 Jun 2004 22:52:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406302252.10870.Antony@Soft-Solutions.co.uk>
References: <00df01c45ea2$f5dc1290$49caa8c0@caris.priv> <200406301429.14248.Antony@Soft-Solutions.co.uk> <40E334EC.1080606@web.de>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40E334EC.1080606@web.de>
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
To: netfilter <netfilter@lists.netfilter.org>

On Wednesday 30 June 2004 10:47 pm, Florian Boelstler wrote:

> Hi,
>
> I have a similar problem.
>
> My traceroute says:
>
> traceroute to www.google.akadns.net (66.102.11.99), 30 hops max, 38 byte
> packets
> traceroute: sendto: Operation not permitted
>  1 traceroute: wrote www.google.akadns.net 38 chars, ret=-1
> [ ... ]
>
> My setup is rather simple. I have "black-boxed" router connected to the
> internet, that is able to forward traceroutes. My client is equipped
> with netfilter.
> When I disable my local netfilter on the client, traceroute works fine.
>
> I use
>
> $IPTABLES -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> at the beginning of my firewall script.
>
> Nevertheless traceroute does not work.
>
> Do I miss something?

Tell us how you handle NEW packets leaving the machine.

Regards,

Antony.

-- 
"The problem with television is that the people must sit and keep their eyes 
glued on a screen; the average American family hasn't time for it."

 - New York Times, following a demonstration at the 1939 World's Fair.

                                                     Please reply to the list;
                                                           please don't CC me.


