From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: bytes counting
Date: Fri, 23 Apr 2004 16:04:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404231604.32275.Antony@Soft-Solutions.co.uk>
References: <086C43C9A9A1A541BFDFABCFDA05F58901448BAB@mailnew.tecnun.es>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <086C43C9A9A1A541BFDFABCFDA05F58901448BAB@mailnew.tecnun.es>
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

On Friday 23 April 2004 2:42 pm, Arrizabalaga, Saioa wrote:

> Hello everyone,
>
> I have been reading some mails in this listing and it is said the best
> place to count bytes/packets is the mangle table, but I have a problem.
>
> iptables -A POSTROUTING -t mangle -o eth2 -s 192.168.0.50
>
> With this rule I catch all the packets going from 192.168.0.50 to eth2,
> but I don't know where to put the rule to catch the packets going from eth2
> to 192.168.0.50, because as far as I can see it, when I put the rule:
> iptables -A PREROUTING -t mangle -i eth2 -d 192.168.0.50 nothing is
> caught because the packet has not been SNAT-ed yet. Am I wrong?

You are not wrong, no, so put the rule in the FORWARD mangle table - then you 
will see all the packets with their real addresses.

PS: If you don't have a FORWARD mangle table, then upgrade your version of 
netfilter :)

Regards,

Antony.

-- 
Christmas was just an opportunity to upgrade to kernel 2.6 while no-one was 
around to notice the downtime.

                                                     Please reply to the list;
                                                           please don't CC me.


