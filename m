From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Nested targets
Date: Tue, 29 Oct 2002 22:53:31 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021029225335.MZOX9836.mta01-svc.ntlworld.com@there>
References: <BC6421B0F2CC4C43897842092E0E00A94C1906@tx1ex1nt.dyncorptx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BC6421B0F2CC4C43897842092E0E00A94C1906@tx1ex1nt.dyncorptx.com>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Tuesday 29 October 2002 10:08 pm, Kellogg, Chris wrote:

> Hi, everyone.
>
> I am encountering a problem where packets are not being handled correctly
> after being passed through several custom chains.

> The DNSSRVDST Chain:
> $ipt --new DNSSRVDST 2>/dev/null

Why are you throwing away error messages here ?   What are you hiding :-) ?

> $ipt -A DNSSRVDST -p udp --dport 53 -j ACCEPT
> $ipt -A DNSSRVDST -p tcp --dport 53 -j ACCEPT
> *SNIP*...SSH connections for management -J ACCEPTs...*SNIP*
> $ipt -A DNSSRVDST -j LOG --log-level warn --log-prefix "Unmatched DNSSRVDST
> "
> $ipt -A DNSSRVDST -j DROP
>
> I'm at a loss why this would occur.  I'm open to ideas on what the cause
> might be, as well as better ways of building my firewall script.

Please can you (a) post your entire DNSSRVDST rules so we can see the whole 
set, and (b) try iptables -L DNSSRVDST -n -v and check that the rules really 
are what you think they should be (for example, is the chain empty before you 
start adding the rules shown above ?)

Antony.

-- 

Perfection in design is achieved not when there is nothing left to add,
but rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

