From: Tib <tib@tigerknight.org>
Subject: Re: more limiting fun
Date: Fri, 11 Feb 2005 10:05:53 -0600 (CST)
Message-ID: <Pine.LNX.4.53.0502111005170.1996@altaica>
References: <Pine.LNX.4.53.0502110936210.1996@altaica>
	<20050211155352.GA2708@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050211155352.GA2708@bender.817west.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org


I see. I tried a NEW for the jump target but it didn't like that, so I
tried accept instead. Now it seems to work just fine. Thanks everyone!

<EOL>
Tib

On Fri, 11 Feb 2005, Jason Opperisano wrote:

> On Fri, Feb 11, 2005 at 09:43:05AM -0600, Tib wrote:
> > Ok, I've done some fiddling but still have some issues. I went with some
> > recommendations on what people said and here's what I have. The first
> > three rules of my startup set are as follows:
> >
> > iptables -A INPUT -i eth0 -p tcp --dport 22 -m state \
> >   --state ESTABLISHED -j ACCEPT
> >
> > iptables -A INPUT -i eth0 -p tcp --destination-port 22 -m limit \
> > --limit 15/hour --limit-burst 5
>
> this rule doesn't jump anywhere; therefore it is a non-terminating match
> and all packets will continue on to...
>
> > iptables -A INPUT -i eth0 -p tcp --destination-port 22 -j DROP
>
> ...the rule that drops all inbound ssh traffic.
>
> try adding a "-j ACCEPT" to the limit rule.
>
> -j
>
> --
> "That's it! You people have stood in my way long enough. I'm going
>  to clown college!"
>         --The Simpsons
>

