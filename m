From: Paul Goodyear <pgudge@gmail.com>
Subject: Re: iptables on DLink DSL-502T Modem/Router
Date: Tue, 8 Nov 2005 20:39:52 +0000
Message-ID: <cc8f3f150511081239x4bd4d8favd7e2807f0748711c@mail.gmail.com>
References: <cc8f3f150511071747m64e3841ava98596bfe776fcf3@mail.gmail.com>
	<200511072031.46307.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200511072031.46307.rob0@gmx.co.uk>
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

Thanks for the reply, that would explain a few things. I did try the
rule in both INPUT and FORWARD chains, but neither worked, I took a
guess that it would be INPUT to use so I posted with that chain.

Order, when I do a iptables -L -n I can see my rule, but it is always
at the bottom of the pile, so this might be the whole issue. How do I
know what <ruleid> the other rules are so I can add above them?

I have read the -A param is "to add a rule at the end of the chain"
how do I add at the begining of the chain?

Thanks again.

On 11/8/05, /dev/rob0 <rob0@gmx.co.uk> wrote:
> On Monday 2005-November-07 19:47, Paul Goodyear wrote:
> > Does iptables version v1.2.6a support forwarding from a source IP?
>
> I cannot parse this. Please rephrase (although I think I've answered
> your question below.)
>
> > The reason I ask, is I have a DLink DSL-502T modem router, the router
> > has linux on and running iptables.
>
> General note about embedded devices: you're limited to the netfilter
> drivers that the developer saw fit to include. My Linksys w/Sveasoft
> firmware lacks some of the more recent and better toys. (I'm planning
> to upgrade to OpenWRT.)
>
> > The webadmin for the router does not allow you to create ip filters,
> > port forwarding is there but not filtering.
>
> But apparently you can get to a shell?
>
> > I want to allow access to port 3389 from only 1 internet IP address.
> > Should this work? (81.81.81.81 being an example)
> >
> > iptables -A INPUT -s 81.81.81.81 -d 192.168.1.2 -p tcp --dport 3389
> > -j ACCEPT
>
> Without seeing your rules I can only guess. I have 3 guesses, in the
> order they appear on the command line:
>
> 1. "-A" : order matters. If an earlier rule does something else with
> your MS-RDP traffic from 81.81.81.81 destined to 192.168.1.2, this is
> never hit.
>
> 2. "INPUT" : If 192.168.1.2 is not a local IP on the router, this rule
> can never be hit. Try "FORWARD".
>
> 3. "-d 192.168.1.2" : That's a non-routable RFC 1918 address. You have
> to perform DNAT in the nat table prior to this. You implied that this
> has been done, but you were not explicit.
>
> Given the topology you described (the rules being on a DSL router) I
> would guess number 2 is your problem. Embedded devices are not likely
> to be running RDP servers.
> --
>     mail to this address is discarded unless "/dev/rob0"
>     or "not-spam" is in Subject: header
>
>

