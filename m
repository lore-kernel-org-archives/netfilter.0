From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Not forwarding?
Date: Mon, 29 Mar 2004 22:42:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403292242.16217.Antony@Soft-Solutions.co.uk>
References: <20040328155231.32b07799@darna.vectec.net> <20040329155147.4fa98da1@darna.vectec.net> <20040329162620.50afb911@darna.vectec.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040329162620.50afb911@darna.vectec.net>
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

On Monday 29 March 2004 9:26 pm, Cody Harris wrote:

> It works once i ran this:
>
> iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 22 -j DNAT --to
> 192.168.0.2:22
>
> Why did i need that? Do i still need my other rules? (in my filter -
> forward chain)?

You need a PREROUTING nat rule if you want the firewall to change the 
destination address where the packets are going to.

You need a FORWARD filter rule to allow the packets through the firewall 
(whether it's changed the destination address or not).

Regards,

Antony.

-- 
The first fifty percent of an engineering project takes ninety percent of the 
time, and the remaining fifty percent takes another ninety percent of the 
time.

                                                     Please reply to the list;
                                                           please don't CC me.


