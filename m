From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: map internal ip [2]
Date: Fri, 19 Mar 2004 19:52:39 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403191952.39408.Antony@Soft-Solutions.co.uk>
References: <1079722569.1980.52.camel@kaos.mpsnet.net.mx> <200403191921.18885.Antony@Soft-Solutions.co.uk> <1079725327.1980.60.camel@kaos.mpsnet.net.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1079725327.1980.60.camel@kaos.mpsnet.net.mx>
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

On Friday 19 March 2004 7:42 pm, Omar Armas wrote:

> On Fri, 2004-03-19 at 13:21, Antony Stone wrote:
> > On Friday 19 March 2004 6:56 pm, Omar Armas wrote:
> > > I have the following config:
> > >
> > > (public ip)
> > > eth0
> > > Firewall
> > > eth1 (150.50.53.4)
> > >
> > > 148.145.133.1 (vpn router)
> > >
> > > 150.50.57.0/24
> > > (LAN, including a server with 150.50.57.2)
> > >
> > > *Class 150.50.57.0/24 is routed to 148.245.164.1
> >
> > I forgot to ask - where does 148.245.164.1 fit into the above diagram?
>
> eth0=148.245.164.2, from that interface it sees the vpn
> router(148.245.164.1).

Now I'm confused.   Please supply a more complete diagram, showing all the 
relevant IP addresses, so I can see where they are in relation to one 
another.

Regards,

Antony.

-- 
This email is intended for the use of the individual addressee(s) named above 
and may contain information that is confidential, privileged or unsuitable 
for overly sensitive persons with low self-esteem, no sense of humour, or 
irrational religious beliefs.

If you have received this email in error, you are required to shred it 
immediately, add some nutmeg, three egg whites and a dessertspoonful of 
caster sugar.   Whisk until soft peaks form, then place in a warm oven for 40 
minutes.   Remove promptly and let stand for 2 hours before adding some 
decorative kiwi fruit and cream.   Then notify me immediately by return email 
and eat the original message.


