From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Trasparent Proxy problem
Date: Fri, 11 Jun 2004 19:56:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406111956.12467.Antony@Soft-Solutions.co.uk>
References: <1086977845.1883.37.camel@Toshiba.Toshiba>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1086977845.1883.37.camel@Toshiba.Toshiba>
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

On Friday 11 June 2004 7:17 pm, Antonio Alvarez wrote:

> Hi all
>
> My firewall have three network interfaces 2 public ips and another one
> private ip...
> I`m gonna use load balancing with:
>
> ip route add default nexthop via gw1 nexthop via gw2 ,
>
> to here that's ok, but i got problems with transparent proxy
>
> iptables -t nat -A PREROUTING -s private subnet --dport 80 -j REDIRECT
> --to-ports 3128
>
> my linux local machine use can't connect to internet, any aideas????

The proxy server itself needs to have a working route to the Internet, via one 
ISP or the other...

What result do you get for a traceroute to www.netfilter.org from the machine 
running the proxy service?

Are any other services being routed *through* the machine (rather than being 
proxied), and are they working correctly?

Regards,

Antony.

-- 
If at first you don't succeed, destroy all the evidence that you tried.

                                                     Please reply to the list;
                                                           please don't CC me.


