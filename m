From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Masquarede stalls?
Date: Tue, 10 Aug 2004 18:35:34 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408101835.34465.Alistair@nerdnet.ca>
References: <D5C9032B2B09C64EA2409D6214E91AC9051264@asimail2.alphanumeric.com> <20040810222404.0abf4608.monk@geotronic.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040810222404.0abf4608.monk@geotronic.hu>
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
To: netfilter@lists.netfilter.org

On August 10, 2004 04:24 pm, Meszaros Gergely wrote:
> Thank you  ! It wooorks !
>
> That clamp-mss magic worked for me, so I consider myself lucky. ^^
>
> >   iptables -I FORWARD -i $INTERNAL_IF -p tcp --syn -j TCPMSS
> > --clamp-mss-to-pmtu
>
> Great!
>
> If it would be in the mangle table, i would dare to say i understand what
> it does, but this case ... how can it send a larger packet in a smaller
> one? magic :)
>
> I tried Anthony's mangle version also but something must be missing here to
> make it work: iptables -t mangle -A POSTROUTING -o EXTIF -j TCPMSS
> --clamp-mss-to-mtu iptables v1.2.9: Unknown arg `--clamp-mss-to-mtu'
> Mabbe modules? Or I misspelled it?

	Nope, we're missing a p there
iptables -t mangle -A POSTROUTING -O ${EXTINF} -j TCPMSS --clamp-mss-to-pmtu
	                                                 
	whoopsy.

	Alistair
>
> However it works, so i'm happy.
> Thank you very much both of you, gurus ! :)
> If you come to Budapest, you are my guest for a beer !
>
> 1 MonK

