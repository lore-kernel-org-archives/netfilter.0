From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Question about marking traffic.
Date: Mon, 28 Jun 2004 17:31:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406281731.40331.Antony@Soft-Solutions.co.uk>
References: <1987903676.20040628181707@op.pl>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1987903676.20040628181707@op.pl>
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

On Monday 28 June 2004 5:17 pm, mortar wrote:

> Hi
>
> I marked few types of traffic:
>
> $IPTABLES -t mangle -A PREROUTING -p tcp -j CONNMARK --restore-mark
> $IPTABLES -t mangle -A PREROUTING -p tcp -m mark ! --mark 0 -j ACCEPT
>
> $IPTABLES -t mangle -A PREROUTING -p tcp -m ipp2p --ipp2p -j MARK
> --set-mark $P2P $IPTABLES -t mangle -A PREROUTING -p tcp --dport 21   -j
> MARK --set-mark $FTP $IPTABLES -t mangle -A PREROUTING -p tcp --dport 80  
> -j MARK --set-mark $WWW
>
> $IPTABLES -t mangle -A PREROUTING -p tcp -j CONNMARK --save-mark
>
>
> With rules below I can count traffic of this types:
>
>
> $IPTABLES -t mangle -A POSTROUTING -m mark --mark $P2P -j ACCEPT
> $IPTABLES -t mangle -A POSTROUTING -m mark --mark $FTP -j ACCEPT
> $IPTABLES -t mangle -A POSTROUTING -m mark --mark $WWW -j ACCEPT
>
>
> But I want count all other traffic, not marked with marks $P2P, $FTP,
> $WWW withe speparated rule. How can I do that?

I believe unMARKed packets are the same as packets with MARK = 0

Therefore "$IPTABLES -t mangle -A POSTROUTING -m mark --mark 0" should count 
the packets not marked with anything.

By the way, I suggest you remove the "-j ACCEPT" from the end of the lines in 
your mangle table - that table should not be used for filtering actions 
(that's what the filter table is for), and ACCEPT is a filtering action.

Rules without targets will still happily count packets for you.

Regards,

Antony.

-- 
Bill Gates has personally assured the Spanish Academy that he will never allow 
the upside-down question mark to disappear from Microsoft word-processing 
programs, which must be reassuring for millions of Spanish-speaking people, 
though just a piddling afterthought as far as he's concerned.

 - Lynne Truss, "Eats, Shoots and Leaves"

                                                     Please reply to the list;
                                                           please don't CC me.


