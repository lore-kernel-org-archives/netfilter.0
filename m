From: "John Jones" <jjones@merlintechnologies.com>
Subject: RE: Help needed understanding what I am doing wrong.
Date: Mon, 3 Jun 2002 17:30:51 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <004d01c20b5f$147b78b0$6301a8c0@JJONES1>
References: <200206040010.g540ANA32170@Networker.rockstone.co.uk>
Reply-To: <jjones@merlintechnologies.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206040010.g540ANA32170@Networker.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: 'Iptables' <netfilter@lists.samba.org>

You have confirmed my suspicions, believe it or not!  (Actually, -I-
can't believe I was thinking correctly after these last three days of
mind-numbing hell!)

We see the packets hitting .120, because of the counters on the IPTABLES
output.  However, we are not seeing any sort of response back.  I
suspected this, but assumed that since the IPTABLES machine (.120) is
supposedly NAT'ing those incoming packets, they would be 'sourced' (from
the DNS server's POV) from 10.0.0.3 (the internal interface of .120).
Is this not how it works?  Does the DNS server not respond to the NAT'ed
IP back to 10.0.0.3?  If not, that is where my assumption failed, and I
kept looking for IPTABLES issues.



> -----Original Message-----
> From: netfilter-admin@lists.samba.org 
> [mailto:netfilter-admin@lists.samba.org] On Behalf Of Antony Stone
> Sent: Monday, June 03, 2002 5:10 PM
> To: 'Iptables'
> Subject: Re: Help needed understanding what I am doing wrong.
> 
> 
> On Tuesday 04 June 2002 12:55 am, John Jones wrote:
> 
> > > If it fails, go the the DNS machine itself (10.0.0.10) and try
> > >
> > > dig samba.org
> > >
> > > and see if it can get a reply from some external nameserver.
> >
> > Yes, it works fine.  Remember, this DNS server has been serving our 
> > network for a year or two.  Through the current IPCHAINS rules (and 
> > the current, but outdated, .113 firewall) everything is 
> fine.  It is 
> > the upgrade to IPTABLES that seems to be failing.
> 
> Okay - I think (!) I know the precise problem now.
> 
> I did not realise that you're already using the DNS server on 
> 10.0.0.10 
> through the old IPchains firewall.   I thought it was a new 
> DNS server behind 
> a new firewall....
> 
> So, here's the question:
> 
> What is the default route on machine 10.0.0.10 ?
> 
> I bet it points to the IPchains firewall.....

Yup!

> Therefore this is what happens:
> 
> client (anywhere) contacts DNS server on 66.38.133.120, gets 
> translated to 
> 10.0.0.10, DNS server wants to reply to the client.   DNS 
> server's default 
> gateway points to old IPchains firewall, so reply packet goes 
> through there, 
> either gets dropped because that firewall didn't see the 
> corresponding 
> incoming packet, so it doesn't do the reverse translation, or 
> else it does 
> translate it (because it translates everything), but it 
> source translates it 
> to 66.38.133.113, and reply comes back to the client from an 
> address it 
> doesn't recognise :-)
> 
> Either way, no valid packet comes back to the client from 
> 66.38.133.120
> 
> How'm I doing ?

For a psychic, not bad. ;)  No, again, I assumed that the DNS server
would respond to the NAT'ed IP, not use it's default gateway IP.

So, with that said... How to fix?  Is it possible?  I can't swap the
machines every hour, find that the IPTABLES rules are in error (or
something else is screwed up!) and deal with that downtime.  I'd get
hanged.  So, I need to know that every thing in my  script works before
doing this.  So far, the script isn't working when I -have- tried that
cutover.


