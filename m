From: Visham Ramsurrun <vishamr2000@gmail.com>
Subject: Re: netfilter Digest, Vol 9, Issue 4
Date: Mon, 4 Apr 2005 11:19:54 +0400
Message-ID: <9927912d050404001934175025@mail.gmail.com>
References: <4250a314.2ce46d3c.5456.16e8SMTPIN_ADDED@mx.gmail.com>
Reply-To: Visham Ramsurrun <vishamr2000@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4250a314.2ce46d3c.5456.16e8SMTPIN_ADDED@mx.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> From: Pablo Neira <pablo@eurodev.net>
> Subject: Re: Load balancing.
> To: szpak <xperience@interia.pl>
> Cc: netfilter@lists.netfilter.org
> Message-ID: <425056ED.3010104@eurodev.net>
> Content-Type: text/plain; charset=us-ascii; format=flowed
> 
> szpak wrote:
> > Hello.
> >
> > I need help with I think something very easy to do with Iptables.
> >
> > I need to have load balancing via nat for two or more ISP as in chart:
> >
> >                            ------ ISP1
> >                           |          128.0.0.0/30
> > <MY NET>---->[Linux NAT]-------- ISP2
> > 192.168.0.0/24     |      80.0.0.0/30
> >                            ------ ISP3
> >                                    85.0.0.0/30
> >
> > I have some users on my side and I want them to simply load balance trafic
> > from them via those three ISP's.  How to do that, is there a way to have three default static routes?
> 
> This is not related to iptables itself. Have a look at iproute.
> 
> http://lartc.org/howto/
> 
> --
> Pablo
> 
> ------------------------------

I found this rule in a book :

iptables -t nat -A PREROUTING -i eth0 -o eth1 -d 192.0.34.72 -j dnat
--to-destination 192.168.1.2-192.168.1.4

you can replace populate a variable, PC_LB, with the ip addresses of the ISPs.

Regards,
Visham

