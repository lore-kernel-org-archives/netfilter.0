From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Redirect to same LAN and preserve source IP
Date: Mon, 12 Jul 2004 14:38:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407121438.59254.Antony@Soft-Solutions.co.uk>
References: <200407121419.40110.gdh@acentral.co.uk>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407121419.40110.gdh@acentral.co.uk>
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

On Monday 12 July 2004 2:19 pm, Gavin Hamill wrote:

> Presently, I'm running squid on the same machine that the LAN uses for
> Internet access, so I'm doing a simple
>
> $IPT -A PREROUTING -s 10.0.0.0/255.255.255.0 -i eth1 -p tcp -m tcp --dport
> 80 -j REDIRECT --to-ports 3128
>
> and this preserves the IP address of the LAN machine which made the
> request, which is what we want for the log files.
>
> However, I need to change the 10.0.0.254 'defaut gateway' machine to a
> standalone router, and the squid installation will be then on a seperate
> machine. Is there any way I can 'grab' the outgoing requests on port 80,
> and shove them into port 3128 on another machine and preserve the correct
> source IP, rather than everything being marked with the IP of the gateway
> 10.0.0.254 ?

Yes.   Just use DNAT, and make sure the Squid box is not on the same subnet as 
the clients (so that it has to send the replies back through the firewall).

It's the classic arrangement - put your clients on your internal LAN, put the 
Squid box on the perimeter network (DMZ), and have the firewall restricting 
traffic between internal / DMZ / external networks.

Regards,

Antony.

-- 
Wanted: telepath.   You know where to apply.

                                                     Please reply to the list;
                                                           please don't CC me.


