From: Reuven Kohanim <rkohanim@yahoo.com>
Subject: Re: Allow station addresses to remain intact during masquerade
Date: Mon, 7 Apr 2003 06:15:20 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030407131520.37012.qmail@web20706.mail.yahoo.com>
References: <200304061118.11158.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304061118.11158.netfilter@newkirk.us>
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
To: netfilter@newkirk.us
Cc: netfilter@lists.netfilter.org


--- Joel Newkirk <netfilter@newkirk.us> wrote:
> On Sunday 06 April 2003 06:36 am, Reuven Kohanim
> wrote:
> > Hello,
> > I currently work with ipchains to setup NAT from
> my
> > private network to the internet. Before getting to
> the
> > MASQ line I had a few  forward rules for letting a
> few
> > stations to get to a server in my DMZ with their
> > original IP address intact (i.e. not NATted). I
> need
> > to do this to allow those stations to work the
> > X-protocol with the sever set in my DMZ.
> >
> > I have tried to upgrade to iptables. No matter
> what I
> > have tried those stations go out with the NAT
> address.
> > After having studied the flow charts of how a
> packet
> > traverses the chains it seems to me that I am out
> of
> > luck and no matter what I do the packet will end
> up in
> > the nat table of iptables and therefore its
> address
> > will get masqueraded. Am I wrong? Can anyone tell
> me
> > how to aviod masquorading those few stations when
> > working with my server. The SNAT will not do since
> I
> > need to preserve their original address.
> 
> If you need to SNAT other traffic going to the
> server in the DMZ but NOT 
> SNAT traffic from select sources, you can:
> 
> iptables -t nat -A POSTROUTING -o $DMZIF -s a.b.c.d
> -j ACCEPT
> iptables -t nat -A POSTROUTING -o $DMZIF -s a.b.c.e
> -j ACCEPT
> iptables -t nat -A POSTROUTING -o $DMZIF -t SNAT
> --to $DMZIFIP
> 
> Obvious substitutions for your environment would
> apply, but the basic 
> idea is to ACCEPT those particular connections, then
> SNAT what remains.
> 

Your idea sounds plausible. I tried it. I now get hung
trying to telnet to the server in my DMZ. Here is the
full detail
I tried
iptables -t nat -A POSTROUTING -J ACCEPT -s a.b.c.d -d
server_ip 
iptables -t nat -A POSTROUTING -J SNAT -s
Private_ip_range --to DMZIFIP
After this did not work, i.e. the connection hung, I
added an additional line by transposting the source
and destination addresses. The result remained the
same.
Any suggestion?

Reuven

> > If I am not in the correct place for asking this
> > question I would appreciate it if someone would
> point
> > me to the right forum.
> 
> Precisely the correct place.  :^)
> 
> > Thanks,
> > Reuven
> 
> j
> 


__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - File online, calculators, forms, and more
http://tax.yahoo.com

