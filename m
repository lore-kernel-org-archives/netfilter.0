From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: map internal ip
Date: Fri, 19 Mar 2004 19:18:05 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403191918.05189.Antony@Soft-Solutions.co.uk>
References: <1079722569.1980.52.camel@kaos.mpsnet.net.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1079722569.1980.52.camel@kaos.mpsnet.net.mx>
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

On Friday 19 March 2004 6:56 pm, Omar Armas wrote:

> I have the following config:
>
> (public ip)
> eth0
> Firewall
> eth1 (150.50.53.4)
>
> 148.145.133.1 (vpn router)
>
> 150.50.57.0/24
> (LAN, including a server with 150.50.57.2)
>
> *Class 150.50.57.0/24 is routed to 148.245.164.1
>
> I want that when people(from eth1 lan) goes to 150.50.53.5, be
> redirected to 150.50.57.2.
>
> I tried:
>
> iptables -t nat -A PREROUTING 150.50.53.5 -j DNAT --to-destination
> 150.50.57.2
>
> But doesn't seem to be working. Any idea if it is possible and how to do
> it?

That looks correct.   Do you have a suitable FORWARD rule to allow the 
translated packets through the firewall?

Does 150.50.57.2 know how to route the replies back again (through the 
firewall)?

How are you testing?

I'm not sure I understand the significance of the "VPN router" shown on your 
diagram with only a single IP address - can you explain further what this 
means, and what is its relevance to the setup?

Regards,

Antony.

-- 
Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

                                                     Please reply to the list;
                                                           please don't CC me.


