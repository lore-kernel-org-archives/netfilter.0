From: Jason Opperisano <opie@817west.com>
Subject: Re: Second shot at IPTables script
Date: Fri, 17 Dec 2004 17:46:37 -0500
Message-ID: <1103323597.3262.49.camel@hubcap.ljm.dom>
References: <6.1.2.0.0.20041217130746.026796b0@corpmail.courtesymortgage.com>
	<1103319685.3262.34.camel@hubcap.ljm.dom>
	<6.1.2.0.0.20041217143032.025241e8@corpmail.courtesymortgage.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6.1.2.0.0.20041217143032.025241e8@corpmail.courtesymortgage.com>
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

On Fri, 2004-12-17 at 17:37, Jason Williams wrote:
> > > $IPTABLES -A INPUT -p ALL -i $LAN_IFACE -s $LAN_IP_RANGE -j ACCEPT
> >
> >you really want to allow unlimited access to your firewall from your
> >internal network?
> 
> Probably not. Just want to allow my LAN access to the internet (private 
> home LAN) and to use whatever services as needed: 80, 443, 21, ssh etc.
> Recommend better rule?

INPUT is only traversed by packets destined for a local processes.  to
allow your LAN to access the Internet, you need FORWARD rules.

> >stylistic note:  the "-p ALL" is unnecessary.  seems to be awfully
> >popular amongst those that post their rules here, but it's just more
> >stuff to read, type, and possibly mistype...no biggie, though.
> 
> Good tip to know. Would you recommend -p tcp instead?

if you mean "any IP protocol" you don't need a "-p" at all.  if you mean
TCP, then use "-p tcp"...say what you mean and mean what you say.

[...snip...]

> So I could remove those three above and just put:
> 
> $IPTABLES -A OUTPUT -j ACCEPT
> 
> and that should do it?

yup.

> I am amazed at the complexity and power that one has with IPTables. It 
> really is quite astonishing (a good thing). The level of flexibility, 
> customization is mind boggling. I look forward to further getting involved 
> with IPTables.

it's good stuff, yes.

> Thanks for your help.

np.

> Jason

-j

--
"I've figured out an alternative to giving up my beer. Basically,
 we become a family of traveling acrobats!"
	--The Simpsons


