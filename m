From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: firewall problem continued
Date: Mon, 9 Aug 2004 12:31:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408091231.33128.Antony@Soft-Solutions.co.uk>
References: <20040809081216.GA12643@tranquility.scriptkitchen.com> <200408091155.10375.Antony@Soft-Solutions.co.uk> <20040809111959.GA16482@tranquility.scriptkitchen.com>
Reply-To: Netfilter ML <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040809111959.GA16482@tranquility.scriptkitchen.com>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

On Monday 09 August 2004 12:19 pm, Payal Rathod wrote:

> On Mon, Aug 09, 2004 at 11:55:10AM +0100, Antony Stone wrote:
>
> > DNAT in PREROUTING only works for packets being routed through the
> > machine. Squid is a local process sending packets out through OUTPUT,
> > therefore you need to DNAT in the OUTPUT nat table to let Squid connect
> > to this address.
>
> Ok. I never knew that. Can you please give an small example on how to
> DNAT my scene in OUTPUT nat table ?

Exactly the same as your extisting PREROUTING rule, but you put it in the 
OUTPUT chain instead (still in the nat table):

iptables -A OUTPUT -t nat -d 1.2.3.4 -p tcp --dport 25 -j DNAT --to 10.10.10.2 

Regards,

Antony.

-- 
You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

                                                     Please reply to the list;
                                                           please don't CC me.


