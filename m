From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: clearing dont-fragment bit
Date: 09 Oct 2003 19:12:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065719570.5873.31.camel@kermit>
References: <20031009134311.GA25685@oasis.frogfoot.net>
	 <1065716586.5873.23.camel@kermit>
	 <20031009165049.GA4043@oasis.frogfoot.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031009165049.GA4043@oasis.frogfoot.net>
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
To: Abraham van der Merwe <abz@frogfoot.net>
Cc: Netfilter Discussions <netfilter@lists.netfilter.org>

Am Don, 2003-10-09 um 18.50 schrieb Abraham van der Merwe:
> Hi Ralf                                          >@2003.10.09_18:23:06_+0=
200
>=20
> > > Are there any iptables extensions out there that allow you to clear t=
he DF
> > > (Dont Fragment) bit in ip headers?
> > If you clear the DF-Bit and use Linux on either side of the tunnel wher=
e
> > the packets are fragmented you are in deep trouble, because Linux 2.4
> > (when using PMTU) not only sets the DF-Bit but also clears the IP-ID
> > which is needed to defragment the packets again. So, when clearing the
> > DF-Bit you have to ensure unique numbers in the IP-ID field, too.
>=20
> Surely if I clear the DF-bit in the mangle table then the ipstack should
> only defragment the packet later on when it made a routing decision and
> decided over which interface to send the packet(s) and set the IP-ID fiel=
ds
> and MF-bit accordingly?
Usually the IP-ID field is set by the sender and not by the router
fragmenting the packet. You have to set the IP-ID field and clear the
DF-Bit at the same time.=20

>=20
> Are there any other side-effects when clearing the DF-bit?
Only maybe the overhead when a fragment is lost.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

