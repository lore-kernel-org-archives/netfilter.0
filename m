From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Masquarede stalls?
Date: Tue, 10 Aug 2004 23:48:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408102348.20307.Antony@Soft-Solutions.co.uk>
References: <D5C9032B2B09C64EA2409D6214E91AC9051264@asimail2.alphanumeric.com> <20040810222404.0abf4608.monk@geotronic.hu> <200408101835.34465.Alistair@nerdnet.ca>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408101835.34465.Alistair@nerdnet.ca>
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

On Tuesday 10 August 2004 11:35 pm, Alistair Tonner wrote:

> On August 10, 2004 04:24 pm, Meszaros Gergely wrote:
> > Thank you  ! It wooorks !
> >
> > That clamp-mss magic worked for me, so I consider myself lucky. ^^
> >
> > >   iptables -I FORWARD -i $INTERNAL_IF -p tcp --syn -j TCPMSS
> > > --clamp-mss-to-pmtu
> >
> > Great!
> >
> > If it would be in the mangle table, i would dare to say i understand what
> > it does, but this case ... how can it send a larger packet in a smaller
> > one? magic :)
> >
> > I tried Anthony's mangle version also but something must be missing here
> > to make it work: iptables -t mangle -A POSTROUTING -o EXTIF -j TCPMSS
> > --clamp-mss-to-mtu iptables v1.2.9: Unknown arg `--clamp-mss-to-mtu'
> > Mabbe modules? Or I misspelled it?
>
> 	Nope, we're missing a p there
> iptables -t mangle -A POSTROUTING -O ${EXTINF} -j TCPMSS
> --clamp-mss-to-pmtu
>
> 	whoopsy.

Yes, sorry about that :)   I should be more careful when typing the really 
weird netfilter options.

Antony.

-- 
"I don't mind that he got rich, but I do mind that he peddles himself as the 
ultimate hacker and God's own gift to technology when his track record 
suggests that he wouldn't know a decent design idea or a well-written hunk of 
code if it bit him in the face. He's made his billions selling elaborately 
sugar-coated crap that runs like a pig on [sedatives], crashes at the drop of 
an electron, and has set the computing world back by at least a decade."

 - Eric S Raymond, about Bill Gates

                                                     Please reply to the list;
                                                           please don't CC me.


