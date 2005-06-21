From: Joakim Axelsson <gozem@gozem.se>
Subject: Re: iptables leaking blocked ip addresses.
Date: Tue, 21 Jun 2005 16:57:25 +0200
Message-ID: <20050621145725.GA6605@aaricia.csbnet.se>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201329.19701.rob0@gmx.co.uk>
	<49bf7d70506201347749fdeed@mail.gmail.com>
	<200506210717.47018.rob0@gmx.co.uk>
	<49bf7d705062107362321dee6@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <49bf7d705062107362321dee6@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: "terry l. ridder" <artisticforge@gmail.com>
Cc: netfilter@lists.netfilter.org

2005-06-21 09:36:34-0500, "terry l. ridder" <artisticforge@gmail.com> ->
> hello;
> 
> reply below.
> 
> On 6/21/05, /dev/rob0 <rob0@gmx.co.uk> wrote:
> > On Monday 20 June 2005 15:47, terry l. ridder wrote:
> > > > In the meantime I bet a few external nmap's of your IP would
> > > > give you some unpleasant surprises.
> 
> you made the above comment did you not?
> you implied that my network was not secured.
> 
> > >
> > > you lose the bet.
> > > since you did not have the courage to post the results of an nmap of
> > > my network, i will.
> > >
> > > please see http://uuoc.com/?id=953 for the results of an external
> > > nmap of my network, 204.238.34.0/24.
> > 
> > Lack of courage, lack of interest, lack of will to be your unpaid
> > security analyst, whatever. It's remarkable that you found that nmap
> > acceptable, neither unpleasant nor surprising.
> >
> 
> i see, yet you make unfounded statements which i quote below:
> 
> > > > In the meantime I bet a few external nmap's of your IP would
> > > > give you some unpleasant surprises.
> 
> > 
> > You certainly have won your arguments! People point to specific
> > documented examples of why you're wrong, and you insist otherwise.
> > Indeed I am convinced: writing to you is a waste of my time. Your
> > arguments have been very persuasive in that regard.
> > 
> 
> you should really read the Iptables Tutorial 1.1.19 written by
> Oskar Andreasson located at
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html
> 
> since you may not read it, i will quote a few  parts.
> 
> <begin quote>
> 6.2. Tables
> 
> The nat table is used mainly for Network Address Translation. "NAT"ed
> packets get
> their IP addresses altered, according to our rules. Packets in a stream only 
> traverse this table once. We assume that the first packet of a stream
> is allowed.
> The rest of the packets in the same stream are automatically "NAT"ed or 
> Masqueraded etc, and will be subject to the same actions as the first packet. 
> These will, in other words, not go through this table again, but will
> nevertheless be
> treated like the first packet in the stream.
> <end quote>
> 
> did you catch that last sentence? since the the first packet in the stream is
> dropped the rest of the packets in the same stream are also dropped.
> 
> <begin quote>
> This is the main reason why you should not do any filtering in this
> table, which we
> will discuss at greater length further on. The PREROUTING chain is
> used to alter
> packets as soon as they get in to the firewall. The OUTPUT chain is used for 
> altering locally generated packets (i.e., on the firewall) before they
> get to the
> routing decision. Finally we have the POSTROUTING chain which is used to alter 
> packets just as they are about to leave the firewall.
> <end quote>
> 
> 7.2.10. PREROUTING chain of the nat table
> 
> The PREROUTING chain should not be used for any filtering since, among
> other things, this chain is only traversed by the first packet in a
> stream. The PREROUTING chain should be used for network address
> translation only, unless you really know what you are doing.
> 
> 
> -- 
> terry l. ridder ><>

I'll try to make this a gently as possible. Trying to do firewalling in' -t
nat' will _NOT_ work. Its not intended at all for firewalling. ONLY for
NATing. Thats why is it named '-t nat'.

Please understand that any documentation can be wrong or missinterpreted.
Its the actually code that will do its work despite what any docmentation
says. We as experts on iptables (netfilter) code are telling you that you
can't use iptables in the way you are trying to to build a good working
firewall.

Even if your solution has worked before or not, this is the case now and it
won't work the way you have setup your iptables. Even tho i think that you
had the very same problem with your firewall before but not noticed it.

1. Firewalling is done in 'iptables -t filter' (or just iptables)
2. Address changes (NATing) are done in 'iptables -t nat'. Only some packets
will travese this "domain".
3. Any changes to the packets are done in 'iptables -t mangle'
4. Any operations needed to be done before conntrack gets the packet is done
in 'iptables -t raw'.

Please understand, your firewall config using -n nat as a firewall is
faulty. Please do the firewalling part in '-t filter' and only the NATing
part i '-t nat'.

Conclusion: Iptables does not leak packets when used properly.

-- 
/Joakim Axelsson A.K.A Gozem@EFnet

