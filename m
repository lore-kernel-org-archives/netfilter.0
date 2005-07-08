From: Jason Opperisano <opie@817west.com>
Subject: Re: Unable to add rule on Chain with 28 characters.
Date: Fri, 8 Jul 2005 16:11:57 -0400
Message-ID: <20050708201157.GA7361@bender.817west.com>
References: <42CECD47.5050003@interage.com.br>
	<20050708195049.GA7221@bender.817west.com>
	<42CEDB7F.3060609@interage.com.br>
	<20050708200937.GA7325@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050708200937.GA7325@bender.817west.com>
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

On Fri, Jul 08, 2005 at 04:09:37PM -0400, Jason Opperisano wrote:
> it looks like 29 characters is the max:
> 
>   30 char chain name:
> 
>   # iptables -t nat -N PubABFZhrRJgwChbszxazNssqWKWB
>   # iptables -t nat -A PREROUTING -j PubABFZhrRJgwChbszxazNssqWKWB
>   iptables: No chain/target/match by that name
> 
>   29 char chain name:
> 
>   # iptables -t nat -N PubABFZhrRJgwChbszxazNssqWKW
>   # iptables -t nat -A PREROUTING -j PubABFZhrRJgwChbszxazNssqWKW
>   #

stupid off-by-one math.  subtract 1 from everything i said...

-j

--
"Peter: Hey, Brian. If cops are pigs, does that make you a Snausage?
 Brian: Clever, Peter. Did you stay up all night writing that?
 Peter: No, I got to bed around two, two-thirty."
        --Family Guy

