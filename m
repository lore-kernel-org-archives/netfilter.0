From: Jan Humme <jan.humme@xs4all.nl>
Subject: Re: Re: unexpected problem with DNAT
Date: Wed, 10 Jul 2002 17:49:42 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <02071017494208.04513@Lms>
References: <02071014505504.04513@Lms> <02071016261606.04513@Lms> <200207101443.g6AEhf812770@vulcan.rissington.net>
Reply-To: jan.humme@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200207101443.g6AEhf812770@vulcan.rissington.net>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

On Wednesday 10 July 2002 16:43, Antony Stone wrote:
> On Wednesday 10 July 2002 3:26 pm, Jan Humme wrote:
> > On Wednesday 10 July 2002 16:03, thingstocome@gmx.net wrote:
> > > > I believe it can only be fixed in the filter module somehow, as all
> > > > packets
> > > > travel through the filter module. You may insert a rule to the
> > > > FORWARD chain,
> > > > to block the FTP-traffic from this IP-address; this should take
> > > > immediate effect.
> > > >
> > > > Jan Humme.
> > >
> > > thx for your reply.
> > >
> > > hmm if i would attempt to block the packets of the ftp session inside
> > > the FORWARD chain,
> > > the destination address would already have changed to an address of
> > > LAN_1 ( because of prerouting).
> > >
> > > I think i can't block these packets in the FORWARD chain by checking
> > > their destination address because as you might remember, SNAT (
> > > masquerading) is also used by LAN_1_ADDR,
> > > so some packets of the masquerading sessions do also have destination
> > > address LAN_1_ADDR when they pass the forward chain ( because NAT is
> > > bidirectional), so they would be blocked as well.
>
> The mangle table might be your answer.
>
> Two suggestions:
>
> 1. Create a rule in the PREROUTING mangle table (which is processed before
> the nat table, so you can see the original source addesses) and MARK the
> packets which you want to block, and then out a rule in the FORWARD chain
> to DROP the MARKed packets.
>
> That's the 'proper' way to do it - mangle the packets in the mangle table
> and drop them in the filter table, however the quicker, dirtier but more
> efficient way to do it is:
>
> 2. Create a rule in the PREROUTING mangle table (which is processed before
> the nat table, so you can see the original source addresses) and DROP the
> packets you want to stop.

I don't get it: the source original addresses are only SNATted *after* the 
FORWARD chain has already been filtered, there is no need to (ab)use the 
mangle chain for this purpose? Or am I misunderstanding something?

So he can directly create one rule in FORWARD chain to drop the packets; but 
his problem seems to be that he doesn't know which IP-addresses he wants to 
block.

Jan Humme.
 

