From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DMZ to DMT through ROUTER problem !
Date: Thu, 20 May 2004 18:34:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405201834.23351.Antony@Soft-Solutions.co.uk>
References: <200405201318.34706.liste@zerozone.it> <200405201707.30559.Antony@Soft-Solutions.co.uk> <200405201832.26844.liste@zerozone.it>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405201832.26844.liste@zerozone.it>
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

On Thursday 20 May 2004 5:32 pm, O-Zone wrote:

> On Thursday 20 May 2004 18:07, Antony Stone wrote:
> > What about the rest of rc.firewall?   You have posted your POSTROUTING
> > SNAT rules - do you have any PREROUTING DNAT rules to convert 151.8.47.B
> > into 192.168.0.3?
>
> Yes ! Here is (for SIENA only):
>
> $IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $SIENA_IP -m
> multiport - --dports 25,53,80,110 -j DNAT --to-destinati$
> $IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $SIENA_IP -m
> multiport - --dports 53 -j DNAT --to-destination $DMZ_SI$

Your PREROUTING DNAT rules specify the input interface (-i $INET_IFACE), 
therefore they do not apply to packets arriving on any other interface.

Change this, either by removing the -i option altogether, or by adding extra 
rules to apply to the other interrface/s on your firewall from which you want 
to allow packets to be DNATted, and things should work.

Regards,

Antony.

-- 
If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

                                                     Please reply to the list;
                                                           please don't CC me.


