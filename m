From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Blocking source ports after REDIRECT
Date: Wed, 14 Apr 2004 18:04:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404141804.57989.Antony@Soft-Solutions.co.uk>
References: <407D69F3.8050105@turton.co.za>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <407D69F3.8050105@turton.co.za>
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

On Wednesday 14 April 2004 5:42 pm, Trevor Turton wrote:

> I am running an untrusted web/app server and mail server on a Linux
> server, and choose to run then as non-root.  The apps must therefore use
> ports other than the well-known privileged ones.

You can't start them as root, bind to a privileged port, then drop privilege 
to run the remainder of the app as a standard user?

> I have set up iptables
> to redirect client requests addressed to the well-known ports to the
> ports that these apps open, e.g.
>  25 -> 8025
>  80 -> 8080
> 110 -> 8110
> This works fine.

Fair enough - an alternative way to do it.

> Out of obsessive neatness rather than for any good
> technical reason I would like to block direct access to the apps through
> their non-privileged (8xxx) ports.  When I insert a filter command to do
> this, it blocks the redirected traffic as well.

> /sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 25  -j
> REDIRECT --to-ports 8025
> /sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 80  -j
> REDIRECT --to-ports 8080
> /sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 110 -j
> REDIRECT --to-ports 8110
> /sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 443 -j
> REDIRECT --to-ports 8443
> #
> # accept traffic addressed to the serviced tcp ports
> #
> /sbin/iptables -A INPUT -p tcp --dport 22  -j ACCEPT
> /sbin/iptables -A INPUT -p tcp --dport 25  -j ACCEPT
> /sbin/iptables -A INPUT -p tcp --dport 80  -j ACCEPT
> /sbin/iptables -A INPUT -p tcp --dport 110 -j ACCEPT
> /sbin/iptables -A INPUT -p tcp --dport 443 -j ACCEPT

There is absolutely no reason to have the above rules, since your apps are not 
listening on those ports!   Port 25 just got redirected to 8025, 80 -> 8080, 
110 -> 8110, and 443 -> 8443.   Remember that PREROUTING happens before 
INPUT, so the INPUT chain only sees the destination addresses/ports after 
they've been changed.

> #
> # filter out traffic to remaining privileged tcp ports
> #
> /sbin/iptables -A INPUT -p tcp -i eth0 --dport 0:1023 -j DROP
> ## the following command blocks -eth0 --dport 25,80,110,443 as well!!
> ## /sbin/iptables -A INPUT -p tcp -i eth0 --dport 8000:8443 -j DROP

Yes, sure, because you're now blocking the packets which just got translated 
from the low port numbers :)

What you need to do is either:

1. DROP the packets sent to the high port numbers in PREROUTING (not a 
recommendation I would normally make, but there are always exceptions!)

or

2. DNAT the high port numbers to something you don't care about, and then DROP 
those in INPUT.

eg:

1. iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8025  -j DROP 
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8080  -j DROP 
etc.

or 

2. iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8025 -j REDIRECT --to 
65535
iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 8080 -j REDIRECT --to 
65535
etc.
iptables -A INPUT -p tcp -i eth0 --dport 65535 -j DROP

Regards,

Antony.

-- 
"There is no reason for any individual to have a computer in their home."

 - Ken Olsen, President of Digital Equipment Corporation (DEC, later consumed 
by Compaq, later consumed by HP)

                                                     Please reply to the list;
                                                           please don't CC me.


