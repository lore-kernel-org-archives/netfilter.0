From: Alok Shukla <alokshukla@yahoo.com>
Subject: Re: HELP : How to group IP addresses by refering to them as a single name ?
Date: Thu, 19 Sep 2002 11:00:21 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020919180021.80821.qmail@web40206.mail.yahoo.com>
References: <200209191302.g8JD20v19671@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200209191302.g8JD20v19671@vulcan.rissington.net>
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
To: netfilter@lists.netfilter.org
Cc: Antony Stone <Antony@Soft-Solutions.co.uk>

Let me say if i am able to sort out the lab in the
accordance that i start my ip settings of lab2 
 like 192.168.9.1-63 for lab 1

and next 64 for lab 2 , would that help and how ?

but i still think that it still bounds me ..

But i would request you to explain in detail as you
said

Alok SHukla


--- Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
> On Thursday 19 September 2002 8:45 am, Alok Shukla
> wrote:
> 
> > HI,
> >
> > I run a College Laboratory with two rooms for the
> > whole labaratory
> > I have given a static IP for each of the computers
> > from 192.168.0.1 to 192.168.0.254.
> >
> > 1. My Lab 1 has IP from 192.198.0.11 to
> 192.168.0.50
> > and Lab 2 has IP from 192.168.0.51 to 192.168.0.90
> >
> > I want to have a set of rules so that i can group
> Lab
> > 1 computers in one group and Lab 2 computers in
> > another group. In this I want to able to shutdown
> the
> > Internet facility by stopping its masquerading as
> a
> > whole by refering as a single name.
> >
> > Like something like :-
> >
> > iptables -t nat -D POSTROUTING -s "LAB1" -d any/0
> -J
> > MASQUERADE
> 
> You can't use names like this in rules, however you
> might be able to achieve 
> something almost as effective by creating two
> user-defined chains forthe two 
> groups of machines, and then putting your rules to
> apply to each group in the 
> appropriate chain ?
> 
> It's a pity your two groups do not split on a neat
> IP address boundary (maybe 
> you could fix this sometime in the future, for
> example by putting all LAB1 
> machines in the range 192.168.0.0-63, all LAB2
> machines in the range 
> 192.168.0.64-127, and all 'general net admin'
> machines (DNS, NT server etc) 
> above 192.168.0.128 ?), however you could try
> splitting them up as follows:
> 
> # create a user-defined chain called LAB1
> iptables -N LAB1
> # add rules to match machines *not* in LAB1 and
> return immediately
> iptables -A LAB1 -s 192.168.0.64/26 -j RETURN
> iptables -A LAB1 -s 192.168.0.56/29 -j RETURN
> iptables -A LAB1 -s 192.168.0.52/30 -j RETURN
> iptables -A LAB1 -s 192.168.0.50/31 -j RETURN
> # now any further rules we put in chain LAB1 will
> only apply to those machines
> 
> # create user-defined LAB2 chain
> iptables -N LAB2
> # add some rules to eliminate non-LAB2 machines
> iptables -A LAB2 -s 192.168.0.0/27 -j RETURN
> iptables -A LAB2 -s 192.168.0.32/28 -j RETURN
> iptables -A LAB2 -s 192.168.0.48/31 -j RETURN
> # now any further rules we put in chain LAB2 will
> only apply to those machines
> 
> I suggest using these chains as follows:
> 
> 1. Add rules as necessary to the above chains to
> ACCEPT the traffic you want
> 2. Put a rule at the end of both LAB1 and LAB2
> chains to DROP any other 
> traffic
> 3. Call both rules near the start of your FORWARD
> chain and then add any 
> other rules for non-(LAB1 or LAB2) machines:
> 
> iptables -A FORWARD -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -j LAB1
> iptables -A FORWARD -j LAB2
> iptables -A FORWARD -s $extDNS -p tcp --dport 53 -j
> ACCEPT
> iptables -A FORWARD -s $extDNS -p udp --dport 53 -j
> ACCEPT
> 
> This would allow servers not in the LAB1 or LAB2
> ranges to access an external 
> DNS server, for example.
> 
> If you want any help understanding how I created the
> range matches in the two 
> chains above, let me know and I'll explain in more
> detail.
> 
> Hopw this helps,
> 
> Antony.
> 
> -- 
> 
> This is not a rehearsal.
> This is Real Life.
> 


__________________________________________________
Do you Yahoo!?
New DSL Internet Access from SBC & Yahoo!
http://sbc.yahoo.com

