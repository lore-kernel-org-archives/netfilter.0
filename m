From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: clearing dont-fragment bit
Date: Thu, 9 Oct 2003 15:44:49 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031009194449.GD14078@cannon.eng.us.uu.net>
References: <20031009134311.GA25685@oasis.frogfoot.net> <Pine.LNX.4.51.0310091554380.26697@dns.toxicfilms.tv> <20031009140819.GA25984@oasis.frogfoot.net> <20031009144334.GB14078@cannon.eng.us.uu.net> <20031009145248.GA26549@oasis.frogfoot.net> <20031009154906.GC14078@cannon.eng.us.uu.net> <20031009161344.GA3303@oasis.frogfoot.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031009161344.GA3303@oasis.frogfoot.net>
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
To: Netfilter Discussions <netfilter@lists.netfilter.org>

> > Use conntrack on both sides at the entrance. It'll ensure the reassembly of
> > the fragments...
> 
> I'm not sure I understand? You're saying that given the following scenario:
> 
>  +---+
>  | A |
>  +---+
>    | eth0 (mtu=1500)
>    |
>    |
>    | eth0 (mtu=1500)   
>  +---+
>  | B |
>  +---+
>    | eth1 (mtu=1500), gre-tunnel-side-a (mtu=1476)
>    |
>    |
>    | eth1 (mtu=1500), gre-tunnel-side-b (mtu=1476)
>  +---+
>  | C |
>  +---+
>    | eth0 (mtu=1500)
>    |
>    |
>    | eth0 (mtu=1500)
>  +---+
>  | D |
>  +---+
> 
> Given that B and C have conntrack enabled, if A sends a 1500 byte packet to
> D with DF=1 then B will fragment the packet, send it to C which will then
> assemble it (in such a way that the packet that arrived at B will be
> identical to the one at C with just the ttl updated) and send it to D?
> 
> If not, then please explain. The above behaviour is what I meant.

No, what I was meaning to say was that if the conntrack in enabled on, say C,
then the reassembly takes place on C.

But for the above situation, I'd suggest you (according to the Cisco page
you sent in another email) to increase the MTU on the GRE interface and have
it just fragment the encapsulating packets on B and defragment it on C without
any involvement of the tunneled packets. Give it a go and see if it works.

> > Neither TFTP nor SNMP set the DF bit and as you said DNS enforces the
> > packet size itself. NFS might do that though (not sure) but one would
> > think that NFS should not span over the Internet. So, what other UDP-based
> > applications use the DF bit?
> 
> Unless I'm missing something setting/clearing the DF bit is up to the
> kernel, not the application. So if I do
> 
>  fd = socket(PF_INET, SOCK_DGRAM, 0);
>  sendto(fd, buf, 1500, 0, ...);
> 
> from my shiny snmp server and buf contains a 1500 byte PDU, then it is up to
> the kernel to decide whether to set DF or not...

I think we're confusing two things here:

1) It is up to the IP stack to fragment based on the MTU of the interface,
   size of the packet and the DF bit.

2) It is up to the application to ask for the setting of the DF bit.
   I believe you need to work on a SOCK_RAW socket to (un)set this.
   But I leave this discussion to the programming guru's. A good source
   is Van Jacobson's traceroute.


Ramin

