From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: RE: INPUT or FORWARD;;
Date: Mon, 20 Dec 2004 16:19:09 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10412201617430.18976-100000@darkstar.sysinfo.com>
References: <1103549777.3264.18.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1103549777.3264.18.camel@hubcap.ljm.dom>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

On Mon, 20 Dec 2004, Jason Opperisano wrote:

> On Mon, 2004-12-20 at 08:24, Rob Sterenborg wrote:
> > I'm not sure I understand this :
> > I agree it's a valid rule (syntax), but I don't think it will ever match
> > a packet.
> > 
> > If -i and -d are specified, they both have to match to accept a packet,
> > right ?
> > Because <ip_eth0> is not assigned to ppp0, how can -i ppp0 -d <ip_eth0>
> > ever match for the INPUT chain ?
> 
>   eth0 IP:  1.2.3.4
>   eth1 IP:  10.1.1.1
> 
>   iptables -A INPUT -i eth1 -p icmp -d 1.2.3.4 -j ACCEPT
> 
> an ICMP echo-request packet arrives on eth1 with dst IP 1.2.3.4.
> 
> the routing code needs to figure out what the destination of the packet
> is--so we do a route lookup.  1.2.3.4 is a local IP--OK, destination is
> local.  packets with a local destination passes through the INPUT chain
> of netfilter, so let's hook in...does the packet match our rule?
> 
>   -i eth1	YES
>   -p icmp	YES
>   -d 1.2.3.4	YES
> 
> so this rule matches--apply the target:
> 
>   -j ACCEPT
> 
> the majority of people i encounter need to free themselves from the
> notation that there is some magic binding between interfaces and their
> IP addresses, because the kernel certainly does not see things that way.
> 
> if you mean "destined for IP a.b.c.d and arriving on ethX" then say that
> in your rule:
> 
>   iptables -A INPUT -i ethX -d a.b.c.d [...]
> 
> say what you mean and mean what you say.


If I'm reading all this correctly then if set as both INPUT and FORWARD
rules the FORWARD rules would become redundant and never be hit as the
INPTU rules would be caught first and deal with what becomes of the
packets, yes?

Thanks,

Ron DuFresne
-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        admin & senior security consultant:  sysinfo.com
                        http://sysinfo.com

...Love is the ultimate outlaw.  It just won't adhere to rules.
The most any of us can do is sign on as it's accomplice.  Instead
of vowing to honor and obey, maybe we should swear to aid and abet.
That would mean that security is out of the question.  The words
"make" and "stay" become inappropriate.  My love for you has no
strings attached.  I love you for free...
                        -Tom Robins <Still Life With Woodpecker>


