From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Second shot at IPTables script
Date: Fri, 17 Dec 2004 19:50:26 -0500
Message-ID: <200412171950.26445.JALaramie@Loudoun-Fairfax.com>
References: <6.1.2.0.0.20041217130746.026796b0@corpmail.courtesymortgage.com>
	<200412171840.20625.JALaramie@Loudoun-Fairfax.com>
	<1103328683.3262.57.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1103328683.3262.57.camel@hubcap.ljm.dom>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

> > > then the rules should have interface restrictions as well.  do or do
> > > not do, there is no try.
> >
> > Huh? If it's not an IP you assigned why let it out on any interface? I'm
> > not sure I follow you here.
>
> sorry, i suppose i wasn't very clear--what i meant was...instead of
> using a rule that says:
>
>   iptables -A OUTPUT -s $LAN_IP -j ACCEPT
>
> restrict it by interface as well as by IP:
>
>   iptables -A OUTPUT -o $LAN_IF -s $LAN_IP -j ACCEPT

OK, now I see your point.
>
> this is all matter of opinion.  i'm not trying to dictate anything here.

The whole issue is essentially theoretical since changing IP addresses 
requires root access. If it ever gets to this you're only buying yourself a 
few minutes and an intruder would probably rather have the original 
functioning connection anyway.

Jeff

