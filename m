From: Jason Opperisano <opie@817west.com>
Subject: Re: Mail Server Behind IPTABLES
Date: Wed, 01 Sep 2004 14:25:23 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094063123.1824.60.camel@wolfpack.ljm.dom>
References: <7768933ECEDCA644AF7908B278CF125D021454@exchange.datec.com.fj>
	<200409011050.44393.Alistair@nerdnet.ca>
	<1094054540.5456.16.camel@matevz.net>
	<200409011227.32394.Alistair@nerdnet.ca>
	<1094062361.5456.35.camel@matevz.net>
	<1094062773.1824.56.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094062773.1824.56.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 2004-09-01 at 14:19, Jason Opperisano wrote:
> 
>         iptables -t nat -I POSTROUTING -p tcp -o eth0 \
>           -d 192.168.2.1 --dport 25 \
>           -j SNAT --to-destination 192.168.2.2
> 
> is correct, syntax-wise.  whether it accomplishes what you want;
> functionality-wise, is another question...
> 
> -j

damn copy & paste...  of course "--to-destination" makes no sense with
SNAT either:

        iptables -t nat -I POSTROUTING -p tcp -o eth0 \
          -d 192.168.2.1 --dport 25 \
          -j SNAT --to-source 192.168.2.2

-j

=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~
I was in Vegas last week. I was at the roulette table, having a lengthy
argument about what I considered an Odd number. -- Steven Wright
=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~


