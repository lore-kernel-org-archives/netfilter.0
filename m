From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DNAT problem /  question
Date: Fri, 18 Jun 2004 17:06:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406181706.28684.Antony@Soft-Solutions.co.uk>
References: <519AD2BA94FC6E4DB5DE078B2E37CB10A76BA5@PDBEX01E.pdb.fsc.net>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <519AD2BA94FC6E4DB5DE078B2E37CB10A76BA5@PDBEX01E.pdb.fsc.net>
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

On Friday 18 June 2004 4:45 pm, Arnauts, Bert wrote:

> Hello all,
>
> I am still stuck with my DNAT. I updated the information that was
> requested.
> Could you please check my config, if I execute this I can not ping my
> internal lan ip of this host 172.25.239.208 any more. I think this is
> really wierd. I included all kinds of information, hopefully enough for
> you guys to take a look at.

It appears you have overlooked both of John Sullivan's postings on this (both 
more recent than mine).

> $IPTABLES -t nat -A PREROUTING -d 172.25.239.220/27 -j DNAT
> --to-destination 11.0.0.16
> $IPTABLES -t nat -A OUTPUT -d 172.25.239.220/27 -j DNAT --to-destination
> 11.0.0.16

You have specified an inappropriate combination of address and netmask with 
172.25.239.220/27 - the address 220 is not the base address of a /27 range, 
and it is possible (I am not certain) that this combination is confusing 
netfilter.

The /27 range within which address .220 falls is 172.25.239.192 (the braodcast 
address is 172.25.239.223), so firstly, try specifying that as your address 
range and see if it helps.

Secondly, do you really mean that you want all packets addressed to anywhere 
within the /27 range to be redirected instead to 11.0.0.16?   That is a valid 
rule, but seems like a slightly strange requirement.

Regards,

Antony.

-- 
"Linux is going to be part of the future. It's going to be like Unix was."

 - Peter Moore, Asia-Pacific general manager, Microsoft

                                                     Please reply to the list;
                                                           please don't CC me.


