From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Mail Server Behind IPTABLES
Date: Wed, 1 Sep 2004 14:23:52 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409011423.52853.Alistair@nerdnet.ca>
References: <7768933ECEDCA644AF7908B278CF125D021454@exchange.datec.com.fj>
	<200409011227.32394.Alistair@nerdnet.ca>
	<1094062361.5456.35.camel@matevz.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094062361.5456.35.camel@matevz.net>
Content-Disposition: inline
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

On September 1, 2004 02:12 pm, Matevz wrote:
	> Na 1094056052, 2004-09-01 ob 18:27, je Alistair Tonner napisal(a):
<SNIPPAGE>

> > 	iptables -P FORWARD DROP
> >
> > 	iptables -A FORWARD -s [LAN_SEGMENT] -i [LAN_DEVICE] -d 0.0.0.0 -j
> > ACCEPT iptables -A FORWARD -d [LAN_SEGMENT] -m state --state
> > RELATED,ESTABLISHED  \ -j ACCEPT
> >
> >
> > 	iptables -A POSTROUTING  -o [INTERNET_DEVICE] -j MASQUERADE
> > 	or
> > 	iptables -A POSTROUTING -o [INTERNET_DEVICE] -j SNAT -to [internet
> > address]
> >
> >
> > 	keep in mind that you might want to review the ORDER in which the rules
> > load .... it can be critical as to what gets processed when
> >
> > iptables -Lnvx
> > iptables -Lnvx -t nat
> > iptables -Lnvx -t mangle.
> >
> >
> >
> > 	Alistair Tonner
>
> Thank you for ansver, but i think i will give up on this.
>
> iptables -I POSTROUTING -p tcp -i eth0 -d 192.168.2.1 --dport 25 -j SNAT
> -to 192.168.2.2
>
> than i get this:
>
> Bad argument `192.168.2.2'


	Okay ---- @swat=me for not double checking my syntax

	iptables -I POSTROUTING -p tcp -i eth0 -d 192.168.168.2.1 --dport 25 -j SNAT   
--to-source 192.168.2.2


	Alistair Tonner

