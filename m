From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Masquarede stalls?
Date: Wed, 11 Aug 2004 01:05:18 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408110105.19370.Alistair@nerdnet.ca>
References: <D5C9032B2B09C64EA2409D6214E91AC9051264@asimail2.alphanumeric.com> <20040810222241.031c79f7.monk@chello.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040810222241.031c79f7.monk@chello.hu>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On August 10, 2004 04:22 pm, M=E9sz=E1ros Gergely wrote:
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

	Actually we don't stuff a larger packet in a smaller one. =20
	The system that has this rule can ensure that its neighbours
	use the correct packet  size  ~~ Although I am not aware of the=20
	specifics, I believe that there (is/are) more than one mechanism
	for managing this.

	Alistair...

=09

	Anyone:
	Does this TCPMSS in mangle table actually mangle packet contents during th=
e=20
	TCP handshake and forcibly set the MSS in the handshake packets??
	(sorry -- tired tonight and can't figure the relevant lines in the source =
=2D-=20
	other half had annual celebratory day today and we've had a nice night out)


>
> I tried Anthony's mangle version also but something must be missing here =
to
> make it work: iptables -t mangle -A POSTROUTING -o EXTIF -j TCPMSS
> --clamp-mss-to-mtu iptables v1.2.9: Unknown arg `--clamp-mss-to-mtu'
> Mabbe modules? Or I misspelled it?
>
> However it works, so i'm happy.
> Thank you very much both of you, gurus ! :)
> If you come to Budapest, you are my guest for a beer !
>
> 1 MonK

