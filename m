From: Jason <baker@cyborgworkshop.com>
Subject: Re: chance to impress the suits
Date: Thu, 27 Feb 2003 08:11:28 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.50.0302270809520.19694-100000@alfred.home.cyborgworkshop.com>
References: <Pine.LNX.4.50.0302261757350.18770-100000@alfred.home.cyborgworkshop.com>
 <200302270201.04762.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200302270201.04762.netfilter@newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Newkirk <netfilter@newkirk.us>
Cc: Netfilter List <netfilter@lists.netfilter.org>

The firewall I am using allows me to rename connections to lan or internet
or dmz using ifname to make things a little easier to understand, so yes
lan is eth0.  What has happened thus far is that connections that the rule
never seems to be triggered.  I didnt think about another rule being hit
before this one,  I will tear this guy down and see what I have going on.
Thank you.

-- 
Jason Baker
baker@cyborgworkshop.com
www.cyborgworkshop.com

On Thu, 27 Feb 2003, Joel Newkirk wrote:

> On Wednesday 26 February 2003 06:57 pm, Jason wrote:
> > Hello,  I have been given a task that I think netfilter is ideal for,
> > but need a little help.  I need to be able to limit the number of
> > connections going through a router running netfilter to a max of 500.
> > When I hit 500, I want to reject any new connections. I know that the
> > iplimit match does this, but I don't seem to be having any luck
> > getting it to work.  Here is the scenario..
> >
> > ----                ----                ----
> > =A =  -> Port 80 -> +NF+  -> Port 80 -> =C =
> > ----                ----                ----
> >
> > Simple enough.  NF is my netfilter router, A is source, C is
> > destination. C is an application that when it gets overworked, pretty
> > much tarpits connecting clients and never lets go.  I have tried many
> > permutations of
> >
> > iptables -A FORWARD -p tcp -i lan -m state --state NEW -m iplimit
> > --iplimit-above 1 -j REJECT
> >
> > with out much luck.  Does anyone have any idea on how to make iplimit
> > in a router situation work?  Should I apply this to the output chain?
>
> Definitely the FORWARD chain, OUTPUT is for connections from the
> firewalling box itself.  Make sure this appears before any ACCEPT rules
> in your FORWARD chain, too.  Have you tried:
>
> iptables -A FORWARD -i eth0 -p tcp --syn --dport 80 -m iplimit
> --iplimit-above 500 -j REJECT
>
> This is almost precisely the format of the example rule for iplimit...  I
> noticed you used "-i lan" above - is that a typo?  You have to specify a
> valid interface name, which my version presumes is eth0 for traffic from
> the LAN.
>
> When you say "without much luck" what do you mean?  Everything still gets
> through, nothing gets through at all, or what?  Does "iptables -L -v -n"
> show any matches to this rule?
>
> j
>
>

