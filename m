From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: fake ping reply
Date: Thu, 4 Sep 2003 16:04:16 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030904200416.GD31513@cannon.eng.us.uu.net>
References: <20030902165026.2edc8dfd.i.kuten@sam-solutions.net> <20030904162444.GB31513@cannon.eng.us.uu.net> <3F57935E.9060305@chrisbrenton.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3F57935E.9060305@chrisbrenton.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: "I.S.Kuten" <i.kuten@sam-solutions.net>, netfilter@lists.netfilter.org

On Thu, Sep 04, 2003 at 03:32:46PM -0400, Chris Brenton wrote:

> >>i wanted to setup iptables , when someone pings my box , echo-reply
> >>would come from other machine then mine .
> >
> >A very strange question. When the client sends you a echo-request, it
> >expects to receive echo-reply from the same IP address. If some other
> >IP address sends the echo-reply, it will simply get dropped by the OS
> >on the client, as there is no match for this bogus packet...
> 
> I don't think that's where he's going with this. This used to be a very 
> cool feature that was remove about 2 years ago. :(  :(  :(
> 
> Here's the concept, let's say you've been allocated a class C legal 
> address space and have 10 or so IP address that are not in use. What I 
> used to do was reject echo-request packets going to those address with 
> echo-replies, and reject all other echo-requests with an host-unreachable.

I see, you want to pretend that the non-assigned IP's are assigned and the
assigned ones are not (??). If so, do this:

            1.2.3.4     5.6.7.8
                ----------
Internet -----eth0--GW--eth1----Internal LAN
                ----------

Say, you have a.b.c.0/24 assigned to you and you use a.b.c.0/25 (assigned
to your boxes) and have a.b.c.128/25 unused. Then for the same effect you
mentioned above you can have:

$IPT -t nat -A PREROUTING -i eth0 -p icmp --icmp-type echo-request \
                          -d a.b.c.128/25 -j DNAT --to 5.6.7.8

$IPT -t filter -A FORWARD -i eth0 -p icmp --icmp-type echo-request \
                          -d a.b.c.0/25 -j REJECT --reject-with host-unreach


Or maybe I didn't get your explanation right???

Ramin

