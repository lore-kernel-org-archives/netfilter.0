From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: I have no idea why this doesn't work...(further details)
Date: Thu, 22 Apr 2004 21:57:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404222157.19162.Antony@Soft-Solutions.co.uk>
References: <20040422192403.16425.25260.Mailman@vishnu.netfilter.org> <6.0.0.22.0.20040422095244.03eb5ec0@mail.garisonpiatt.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6.0.0.22.0.20040422095244.03eb5ec0@mail.garisonpiatt.com>
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
To: netfilter@lists.netfilter.org

On Thursday 22 April 2004 9:10 pm, Garison Piatt wrote:

> At 09:24 PM 4/22/04 +0200, you wrote:
>
> >(for example, you have some pretty strange destination port
> >numbers in there, and I can't begin to guess why).
>
> Because this was cobbled together from scripts that were said to work in
> other places, and my assumption was that these were common port numbers.

I'm reminded of the phrase "a little bit of knowledge can be a dangerous 
thing".  :)

> >I recommend the following:
> >1. Describe your network setup to us so that we know what clients &
> > servers you have on what network segments.
>
> As far as I know: one server, everything on the same machine, no
> LAN.  Right now, there is only the IP for the server itself, and another
> for one web site client; in the future she'll have 8-10 sites (with
> independent IPs) on the server.

1. I assume the server is not the same machine running netfilter?   (ie: you 
are trying to set up a routing firewall, not create rules on a machine to 
protect itself?)

2. "One web site client"?   I don't understand.   Surely the server is 
accessible to the entire Internet (although maybe not...)?

> I say "as far as I know" because all of my information come via my client,
> who is not exactly computer literate, even though she is in the business of
> designing web sites.  Support calls are $150 a pop, so she wants me to make
> as few of those (read: zero) as possible.

Support from whom (where)?   All we're asking is basic network configuration 
stuff - not technical assistance in getting something working.

The information for the questions I asked should be freely provided by whoever 
is acting as the service provider here - it's in their interests to do so, 
otherwise the client will (should) move to an ISP who *will* tell her how the 
network is set up....

I mean, I can show you ISPs who charge less than $150 a year to host a web 
server, let alone to give you the information about how it's plugged in....

> >2. Explain what traffic you want to allow and what traffic you want to
> > block (and what you want to log).
>
> We want to allow TELNET (just from me and her, if possible), all FTP, and
> web traffic.

Okay, where are you (in network terms, compared to the firewall and server 
we're talking about), where is she, and where does the web traffic come from?

Telnet is not a recommended protocol - everything is sent in clear text - is 
there any good reason why you are not using ssh?

> Okay: I'd like some guidance on how to do what I described in (2), given
> the situation in (1).

Okay, here's my first attempt.   It's based on a few assumptions about 
information I've mentioned above:

1. I assume this is a routing firewall, not a machine protecting itself.
2. I assume you and you client have fixed IP addresses which can be used to 
selectively allow some traffic from you and not elsewhere.
3. I assume you want to website to be accessible to the entire Internet.

If any of the above are incorrect, please supply more details.

# Drop everything we don't allow
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD

# Allow reply packets through the firewall
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
# Allow access (from anywhere) to the web server, TCP port 80
iptables -A FORWARD -p tcp --dport 80 -d a.b.c.d -j ACCEPT
# Allow access (from anywhere) to the web server for FTP
iptables -A FORWARD -p tcp --dport 21 -d a.b.c.d -j ACCEPT
# Allow access from e.f.g.h to the web server by Telnet
iptables -A FORWARD -p tcp --dport 23 -d a.b.c.d -s e.f.g.h -j ACCEPT
# Allow access from j.k.l.m to the web server by Telnet
iptables -A FORWARD -p tcp --dport 23 -d a.b.c.d -s j.k.l.m -j ACCEPT

Substitute in the above:
a.b.c.d should be the IP address of the web server
e.f.g.h should be your IP address (for Telnet access)
j.k.l.m should be your client's IP address (for Telnet access)

Note that the above rules will *not* give you remote access to the firewall 
itself.   You almost certainly do want this, but I await your answer to my 
question about why you're not using ssh before I deal with accessing the 
firewall itself (and anyway, it might turn out to be the same machine as the 
web server yet).

Regards,

Antony.

-- 
"Reports that say that something hasn't happened are always interesting to me, 
because as we know, there are known knowns; there are things we know we know. 
We also know there are known unknowns; that is to say we know there are some 
things we do not know. But there are also unknown unknowns - the ones we 
don't know we don't know."

 - Donald Rumsfeld, US Secretary of Defence

                                                     Please reply to the list;
                                                           please don't CC me.


