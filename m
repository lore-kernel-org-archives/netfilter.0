From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Changes in kernel >= 2.4.20 ? -> YES
Date: Wed, 19 Nov 2003 09:19:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311190919.06502.Alistair@nerdnet.ca>
References: <20031117110642.73ee78fc.m.petruzzi@bluewin.ch> <200311182043.18773.Alistair@nerdnet.ca> <20031119115041.38aee642.m.petruzzi@bluewin.ch>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031119115041.38aee642.m.petruzzi@bluewin.ch>
Content-Disposition: inline
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
To: Martin Petruzzi <m.petruzzi@bluewin.ch>
Cc: netfilter@lists.netfilter.org

On November 19, 2003 05:50 am, Martin Petruzzi wrote:
> On Tue, 18 Nov 2003 20:43:18 -0500
>
> Alistair Tonner <Alistair@nerdnet.ca> wrote:
> > > For other Alcatel users reading this, put:
> > > mtu 1430
> > > mru 1430
> > > ...into /etc/ppp/options
> >
> > 	Doing this works, but you are forcing yourself to a certain size which
> > 	1) might be smaller than optimal,
> > 	2) could change one night unexpectedly.
> >
> > 	Personally I trust the clamp mss to mtu ... it works.
> > 	(for what its worth .. my MTU is somewhat larger than that...
> > 	on a GVC DSL modem to ALCATEL DsLAM)
>
> Is there a way to find out what DSLAM device my provider has or even better
> what mtu it uses?

	There is signature data in an ethereal TCP dump from the ethernet devices 
that connect to the modem, but I'm not sure about what your modem does.  On 
my GVC modem I can log into it, and it appears to be able to decode the DsLam 
type from what it gets on the line.

>
> I guess/claim that the support people of my provider don't know that and it
> would cost me a fortune to confirm this suspect. But if I'm right, you say
> with the clamp rule the problem is solved (seems to by dynamic then) and I

	it is indeed dynamic. --- I only noticed the differences due to a borked win 
3.11 tcp stack. -- it REALLY doesn't behave well... (WFW ... Workgroups .. 
yeah...    it seemd to blatantly disregard the concept of PMTU discovery... 
might not have been in there at all from the way it behaved)

> don't need to know at all? Any idea why this was no problem with kernels <
> 2.4.20 (only wondering, not a need to know)?

	I would suspect that you changed something in your kernel compile at 2.4.20 
that caused this ... I don't think ipMTU functionality has changed much in 
any of the kernels from 2.4.9 up. -- possibly path ipmtu disocovery ... but 
not sure. -- it could be that you opened up the MTU on your LAN device and 
didn't notice it ... 

>
> By the way, I found the number 1430 a couple of times in different other
> maillists to be the size always working with the Alcatel Speedtouch USB, I
> have no idea about a technical background of exactly that size.

	As I pointed out the # will vary depending on the configuration of the device 
on the other end .. .look at the defined MTU of your ppp device when it comes 
up .. .thats your maximum ... and should always be (at least 8 bytes) less 
than the MTU of the ethernet device which is connected to the modem.
	(on a side note ... dunno if this true for USB modems... hmm
	 my DSL is pppoe - my modem is connected by ethernet to a NIC on 
	my box .. )
   MSS is MTU - (sum of all packet headers) -- i.e. PPP packet header + TCP 
packet header + whatever proprietary subspecies you might have packet header 
	if I recall correctly .. (and if I don't someone will jump all over me) --
	with DSL the ppp tunnel adds a ppp wrapper packet around the  TCP/UDP/
whatever packet.(again --- if I recall correctly)  this ppp packet has an 8 
byte header .. .it makes life easier on the system as a whole if the TCP/UDP 
packets are bundled correctly at the source, and small enough to withstand 
having the 8 bytes wrapped around them and still fit through the PPP tunnel 
in a single go.
  
	Specially considering that there are some OS out there that don't understand 
the idea of PMTU discovery.

	
>
> Martin

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

