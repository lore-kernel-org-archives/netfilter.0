From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset returns "Zero valued IP address" when trying to add
 '0.0.0.0/7'
Date: Wed, 12 Nov 2008 08:43:30 +0100 (CET)
Message-ID: <alpine.DEB.2.00.0811120840430.8235@blackhole.kfki.hu>
References: <7259d7020811112155j5315d0e0ke9bc7576e927ad76@mail.gmail.com> <491A7648.6000703@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <491A7648.6000703@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Wed, 12 Nov 2008, Grant Taylor wrote:

> On 11/11/2008 11:55 PM, JC Janos wrote:
> > I'm using IPSET to create a nethash typed set to contain a short list of
> > "bogons" as defined @ http://www.team-cymru.org/Services/Bogons/#http for
> > eventual use in a firewall rule.
> > 
> > But for one of those defined nets, ipset fails to add,
> > 
> >  ipset -N BOGONS nethash
> >  ipset -A BOGONS 0.0.0.0/7
> >     ipset v2.4.3: Zero valued IP address `0.0.0.0' specified
> >     Try `ipset -H' or 'ipset --help' for more information.
> > 
> > I can certainly use the "0.0.0.0/7" in a rule.  How can I correctly add it
> > to an ipset?
> 
> It sounds like ipset does not like the fact that you are using an IP address
> that is all zeros.

Yes, exactly: a zero valued entry in the hash means "empty entry". 
Therefore a zero valued IP address cannot be added to a hash.

But "0.0.0.0/7" as a network address is not zero valued: the checking 
happens prematurely and prevents adding the network address to the hash.
I'm going to fix it.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
