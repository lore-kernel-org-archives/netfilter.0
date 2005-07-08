From: Jason Opperisano <opie@817west.com>
Subject: Re: Unable to add rule on Chain with 28 characters.
Date: Fri, 8 Jul 2005 16:09:38 -0400
Message-ID: <20050708200937.GA7325@bender.817west.com>
References: <42CECD47.5050003@interage.com.br>
	<20050708195049.GA7221@bender.817west.com>
	<42CEDB7F.3060609@interage.com.br>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <42CEDB7F.3060609@interage.com.br>
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

On Fri, Jul 08, 2005 at 05:01:03PM -0300, Rafael Dreher wrote:
> >>Hi,
> >>
> >>I'm trying do add a rule on a user-defined chain, on the NAT table, with 
> >>28 characters.
> >
> >
> >my guess is you're leaving out the '-t nat' as custom chains only exist
> >in the table they're created in:
> >
> 
> Hi, again.
> 
> I guess no. :)

provide more info next time and i won't have to guess.  :-D

> [root@ward] [16:55:58]
> [~]#iptables -t nat -N ecommerce-internet@POSTROUTING
> 
> [root@ward] [16:56:01]
> [~]#iptables -t nat -A POSTROUTING -j ecommerce-internet@POSTROUTING
> iptables: No chain/target/match by that name
> 
> [root@ward] [16:56:19]
> [~]#
> 
> Am I crazy? :)
> 
> This chain has 30 characters... the max.. if I reduce it to 28, it's added 
> wihtout any problem.

(note:  your OP said the error was with the 28 char chain)

it looks like 29 characters is the max:

  30 char chain name:

  # iptables -t nat -N PubABFZhrRJgwChbszxazNssqWKWB
  # iptables -t nat -A PREROUTING -j PubABFZhrRJgwChbszxazNssqWKWB
  iptables: No chain/target/match by that name

  29 char chain name:

  # iptables -t nat -N PubABFZhrRJgwChbszxazNssqWKW
  # iptables -t nat -A PREROUTING -j PubABFZhrRJgwChbszxazNssqWKW
  #

-j

--
"Peter: This party couldn't be better if Jesus was here.
 Jesus: For my next miracle, I will turn water... into FUNK."
        --Family Guy

