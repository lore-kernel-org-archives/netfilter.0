From: alex <alex@bennee.com>
Subject: Re: intermittent and unreliable behaviour with iptables scripts
Date: 11 Nov 2002 23:19:21 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037056761.3170.8.camel@trent.nin>
References: <91F7518FF779D41181A700010266356D015555D6@mail.springbound.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <91F7518FF779D41181A700010266356D015555D6@mail.springbound.com>
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
To: Doug Watson <doug@1stbooks.com>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Mon, 2002-11-11 at 17:25, Doug Watson wrote:
>  However, I along with my test group of 5 "lucky" users began to see
> some
> intermittent and unreliable behavior when accessing the internet
> through
> this new firewall most notably when browsing the web. 
> 
> When browsing the web, web pages that normally would load very quickly
> seem 
> to hang for an inconsistent amount of time, anywhere between 1 second
> to 30 seconds or more
> before they would even begin to load or would at times never load at
> all as
> if the connection to the web was lost.

This sound familiar to my own woes with port forwarded connections. I
suspect a bug in ip_conntrack that somehow causes FORWARDED packets to
end up in the output chains. I've been trying to find out exactly when
this occurs and why (and certainly why my older script worked without
problems).

You could try a using a variation of this script to monitor your
connections "live" and see which rule starts dropping when you
experience your problems. Try using it with something like watch:

    iptables -Z -t nat
    iptables -Z
    watch -n 5 -d ./dumpview

#!/bin/bash
#
# dumpview - try and see where the packets get dropped.
#
echo "DNAT Stuff"
iptables -nvL -t nat
echo "Dropped packets of normal chains"
iptables -nvL | egrep "Chain|DROP"
echo "Connections"
cat /proc/net/ip_conntrack | wc -l
echo "Web Connections"
cat /proc/net/ip_conntrack | grep "port=80" 

-- 
alex <alex@bennee.com>
My own hacking haven


