From: Jason Opperisano <opie@817west.com>
Subject: Re: Mail Server Behind IPTABLES
Date: Wed, 01 Sep 2004 14:19:34 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094062773.1824.56.camel@wolfpack.ljm.dom>
References: <7768933ECEDCA644AF7908B278CF125D021454@exchange.datec.com.fj>
	<200409011050.44393.Alistair@nerdnet.ca>
	<1094054540.5456.16.camel@matevz.net>
	<200409011227.32394.Alistair@nerdnet.ca>
	<1094062361.5456.35.camel@matevz.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094062361.5456.35.camel@matevz.net>
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

On Wed, 2004-09-01 at 14:12, Matevz wrote:
> Thank you for ansver, but i think i will give up on this.
> 
> iptables -I POSTROUTING -p tcp -i eth0 -d 192.168.2.1 --dport 25 -j SNAT
> -to 192.168.2.2
> 
> than i get this:
> 
> Bad argument `192.168.2.2'

there's no POSTROUTING chain in the filter table--you need to specify
either "-t nat" or "-t mangle" as those are the tables that have such a
chain.  you also cannot use "-i" in POSTROUTING.  the SNAT target is
valid in the POSTROUTING chain of the nat table:

        iptables -t nat -I POSTROUTING -p tcp -o eth0 \
          -d 192.168.2.1 --dport 25 \
          -j SNAT --to-destination 192.168.2.2

is correct, syntax-wise.  whether it accomplishes what you want;
functionality-wise, is another question...

-j

-- 
Jason Opperisano <opie@817west.com>


