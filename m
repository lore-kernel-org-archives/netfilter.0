From: Abraham van der Merwe <abz@frogfoot.net>
Subject: Re: clearing dont-fragment bit
Date: Thu, 9 Oct 2003 18:13:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031009161344.GA3303@oasis.frogfoot.net>
References: <20031009134311.GA25685@oasis.frogfoot.net> <Pine.LNX.4.51.0310091554380.26697@dns.toxicfilms.tv> <20031009140819.GA25984@oasis.frogfoot.net> <20031009144334.GB14078@cannon.eng.us.uu.net> <20031009145248.GA26549@oasis.frogfoot.net> <20031009154906.GC14078@cannon.eng.us.uu.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031009154906.GC14078@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: Netfilter Discussions <netfilter@lists.netfilter.org>

Hi Ramin                                         >@2003.10.09_17:49:06_+0200

> > Ideally one would want to leave DF untouched unless a packet with DF=1 is
> > resent in which case you clear it - that way you solve PMTU probes, but I
> > suspect this would be overly complicated / resource intensive.
> > 
> > Even better would be if there was a tunnelling protocol that would just take
> > packets on side A (incl ip headers, galore), chop it up, and reassemble it
> > on the other side. Unfortunately there is no such thing :P
> 
> Use conntrack on both sides at the entrance. It'll ensure the reassembly of
> the fragments...

I'm not sure I understand? You're saying that given the following scenario:

 +---+
 | A |
 +---+
   | eth0 (mtu=1500)
   |
   |
   | eth0 (mtu=1500)   
 +---+
 | B |
 +---+
   | eth1 (mtu=1500), gre-tunnel-side-a (mtu=1476)
   |
   |
   | eth1 (mtu=1500), gre-tunnel-side-b (mtu=1476)
 +---+
 | C |
 +---+
   | eth0 (mtu=1500)
   |
   |
   | eth0 (mtu=1500)
 +---+
 | D |
 +---+

Given that B and C have conntrack enabled, if A sends a 1500 byte packet to
D with DF=1 then B will fragment the packet, send it to C which will then
assemble it (in such a way that the packet that arrived at B will be
identical to the one at C with just the ttl updated) and send it to D?

If not, then please explain. The above behaviour is what I meant.

> > > Can you come up with a list of the non-TCP-based application protocols that
> > > would use the PMTU (DF bit)?
> > 
> > Basically any UDP application that sends packets bigger than the maximum
> > allowed mtu. I would assume TFTP, SNMP, etc. would all get into trouble. I
> > know that some protocols such as DNS try to stay below 512 bytes payload,
> > but there is probably a gazillion protocols out there that don't.
> 
> Neither TFTP nor SNMP set the DF bit and as you said DNS enforces the
> packet size itself. NFS might do that though (not sure) but one would
> think that NFS should not span over the Internet. So, what other UDP-based
> applications use the DF bit?

Unless I'm missing something setting/clearing the DF bit is up to the
kernel, not the application. So if I do

 fd = socket(PF_INET, SOCK_DGRAM, 0);
 sendto(fd, buf, 1500, 0, ...);

from my shiny snmp server and buf contains a 1500 byte PDU, then it is up to
the kernel to decide whether to set DF or not...

-- 

Regards
 Abraham

The 'A' is for content, the 'minus' is for not typing it.  Don't ever do
this to my eyes again.
		-- Professor Ronald Brady, Philosophy, Ramapo State College

___________________________________________________
 Abraham vd Merwe - Frogfoot Networks CC
 9 Kinnaird Court, 33 Main Street, Newlands, 7700
 Phone: +27 21 686 1665 Cell: +27 82 565 4451
 Http: http://www.frogfoot.net/ Email: abz@frogfoot.net


