From: Mark-Walter@t-online.de
Subject: Re: IPT Output packet died
Date: Sat, 18 Feb 2006 12:56:11 +0100
Message-ID: <20060218115611.GB628@server.homelinux.net>
References: <20060217111426.GB1183@server.homelinux.net>
	<57599.193.173.147.3.1140180092.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <57599.193.173.147.3.1140180092.squirrel@webmail.sterenborg.info>
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

Hi Rob,

many thank's for your quick reply.

> > From time to time the log rule next to the output section show's this:
> > Feb 17 10:59:01 gerry kernel: IPT OUTPUT packet died: IN= OUT=eth0
> > SRC=192.168.0.1 DST=217.89.23.137 LEN=61 TOS=0x00 PREC=0x00 TTL=64
> > ID=19170 DF PROTO=UDP SPT=32769 DPT=53 LEN=41

> These are indeed "some" rules, not all. There are none before these in the
> OUTPUT chain that could block outgoing traffic ? (You say you use Oscar's
> script but you could have modified it.)

I set my filter rules to the original of Oscar Andreason, without any
success.

> I have not seen your other rules for this chain and assuming there's no DROP
> or REJECT or such rule in the chain, why do you even bother to set rules in it
> ? It seems you want to allow everything which is the same as policy set to
> ACCEPT and no rules in it.

it seem's I've found the problem.

I had my DSL-Modem router in the /etc/resolv.conf

There are no packet's the the time anymore of port 53.

-- 
Best Regards,

Mark

