From: Navneet Choudhary <navneetkc@gmail.com>
Subject: Re: Fwd: Linux as router (Gateway Server)
Date: Sun, 13 Feb 2005 22:34:50 +0530
Message-ID: <1dceb01205021309043b1bb1e8@mail.gmail.com>
References: <1dceb012050211233357e23dd4@mail.gmail.com>
	<1dceb01205021123483860fb86@mail.gmail.com>
	<1108216901.4462.27.camel@hubcap.ljm.dom>
Reply-To: Navneet Choudhary <navneetkc@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1108216901.4462.27.camel@hubcap.ljm.dom>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

> > Feb 12 09:15:33 squid (squid): Cannot open HTTP Port
> 
> that has nothing to do with iptables.  my guess is that you are either:
> 
> (a) telling squid to listen on a port that is already in use by another process

No, squid is listening on port 3128(not used by any process)

> (b) trying to start squid after it's already started

No, it's just started once.

> (c) running squid as an unprivileged user and trying to bind to a
> privileged port

No, it's being started by root.Afterward it's owned by squid

Is this stopping squid to access HTTP port?

Since,  OUTPUT rule only allow user squid to access port 80 [Wild guess]

-A OUTPUT -o eth1 -p tcp -m tcp --sport 1024:65535 \ --dport 80
--tcp-flags SYN,RST,ACK SYN -m owner  --uid-owner squid -j ACCEPT

> go read:
> 
>   http://www.squid-cache.org/Doc/FAQ/FAQ-11.html#ss11.23
> 
> (ps - google is your friend)

Always been our friend.

> > Why my iptables rule blocking squid to open HTTP port.
> 
> it isn't.

I think some way this problem is related to iptables rule
Since, squid daemon won't die if i start it with no fireawall rule
(allowing everything to pass, no blocking/restrictions)
> -j
 
By the way, all my iptables rules were lifted or inspired by yours
reply to this mailing list[posted this month itself].

Thank you for your help & co-operation

regards,
Navneet
> --
> "It's not easy to juggle a pregnant wife and a troubled child, but
>  somehow I managed to fit in eight hours of TV a day."
>         --The Simpsons
> 
>

