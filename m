From: Cody Harris <hchs@ns.sympatico.ca>
Subject: Re: Adding a flag to a packet
Date: Tue, 30 Mar 2004 17:28:40 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040330172840.491b9b4a@darna.vectec.net>
References: <20040328155231.32b07799@darna.vectec.net>
	<200403302150.40632.Antony@Soft-Solutions.co.uk>
	<20040330170659.3000c03d@darna.vectec.net>
	<200403302223.33019.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403302223.33019.Antony@Soft-Solutions.co.uk>
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

On Tue, 30 Mar 2004 22:23:33 +0100,
Someone named Antony Stone <Antony@Soft-Solutions.co.uk> wrote:

> On Tuesday 30 March 2004 10:06 pm, Cody Harris wrote:
> 
> > On Tue, 30 Mar 2004 21:50:40 +0100, Antony Stone wrote:
> > >
> > > Okay.   You want a VPN (I use http://www.freeswan.org), a simple IP
> > > tunnel
> > > (http://www.tldp.org/HOWTO/Adv-Routing-HOWTO/lartc.tunnel.ip-ip.html), or
> > > else some clever DNAT rules one end, and SNAT rules the other.
> >
> > So i *can't* simple mark a packet with a flag that the other one can see?
> 
> No.   The MARK is not a part of the actual packet or header - it's just 
> something that netfilter associates with the packet whilst it's processing 
> it.   Once the packet leaves the box, it's just a plain packet again, and the 
> MARK is gone.
> 
> > What if i change the ttl to something like 1000 and match it with a rule on
> > the other end (too weed out any other instances of this).
> 
> Well, the TTL field is only 8 bits, so the maximum value is 255 :)   But 
> anyway, you're trying to make custard by boiling a chicken.   It's just the 
> wrong way to approach the problem.
> 
> Netfilter is a Firewall, and it can also do a bit of NATting.   It's bad 
> enough when people try to make it do (local) routing, let alone attempt to 
> convert it into a VPN.
> 
> There are other ways to do what you want, and the IP tunnel solution is not at 
> all complicated (however it is not at all secure, either - packets are 
> transferred across the Internet between the two networks with no encryption 
> or other attempt to hide the contents).

Would the VPN also transmit the lan-based packets (such as the ones needed to run games).

Anyways, it feels like i know you presonnally now...hows the wife and the kids? Hehehe. I could actually carry out this coversation on an imclient. But i feel we're just about done. If you *do*, and you have msn add charris@vectec.net.



> 
> Regards,
> 
> Antony.
> 
> -- 
> Success is a lousy teacher.  It seduces smart people into thinking they can't 
> lose.
> 
>  - William H Gates III
> 
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 
> 


-- 
+------------------+-----------------------------+
| Cody Harris      | --------------------------- |
| ---------------- | --------------------------- |
+------------------+-------+---------------------+---+
| *Sigh*. No key.                                    |
+----------------------------------------------------+

