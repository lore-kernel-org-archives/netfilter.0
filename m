From: Jason Opperisano <opie@817west.com>
Subject: Re: IPTables connection limitiing rule meaning
Date: Mon, 1 Nov 2004 15:38:28 -0500
Message-ID: <20041101203827.GA19234@bender.817west.com>
References: <20041101195527.75983.qmail@web53503.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041101195527.75983.qmail@web53503.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, Nov 01, 2004 at 11:55:27AM -0800, Rajesh Menon wrote:
> Hello,
> 
> I have a rule in my output chain as follows:
> 
> iptables -A OUTPUT -o <external-IF> -m limit --limit
> 15/minute --limit-burst 10 -j LOG --log-prefix
> "GW->Intet: "
> 
> 1. Would this rule LOG packets as long as the rule is
> matched?

yes--conditional on your limit match.  read rusty's description on the
"hysteresis door" algorithm used by limit/limit-burst under "Other Match
Extensions" at:

http://netfilter.org/documentation/HOWTO//packet-filtering-HOWTO-7.html

> 2. If the limit is reached (15/min) would the packets
> stop going to the next rule in the chain? 

no--"-j LOG" is a non-terminating match (packets will never stop
traversing rules/chains/tables when they match)

> 3. Supposing I have this rule after the above rule 
> 
> iptables -A OUTPUT -j ACCEPT

this rule matches all packets, and no rules after this rule will match
in the OUTPUT chain.

-j

--
"No jury in the world is going to convict a baby ... Maybe Texas."
        --The Simpsons

