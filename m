From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DMZ to DMT through ROUTER problem !
Date: Thu, 20 May 2004 18:44:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405201844.49709.Antony@Soft-Solutions.co.uk>
References: <200405201318.34706.liste@zerozone.it> <200405201832.26844.liste@zerozone.it> <200405201834.23351.Antony@Soft-Solutions.co.uk>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405201834.23351.Antony@Soft-Solutions.co.uk>
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

On Thursday 20 May 2004 6:34 pm, Antony Stone wrote:

> On Thursday 20 May 2004 5:32 pm, O-Zone wrote:
> >
> > $IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $SIENA_IP -m
> > multiport - --dports 25,53,80,110 -j DNAT --to-destinati$
> > $IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $SIENA_IP -m
> > multiport - --dports 53 -j DNAT --to-destination $DMZ_SI$
>
> Your PREROUTING DNAT rules specify the input interface (-i $INET_IFACE),
> therefore they do not apply to packets arriving on any other interface.

The same applies to your FORWARDing rules as well, by the way, so these will 
need changing before the packets can get through your firewall to their 
destination.

Regards,

Antony.

-- 
People who use Microsoft software should be certified.

                                                     Please reply to the list;
                                                           please don't CC me.


