From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: iptables mac destination filtering
Date: Sat, 30 Apr 2005 10:18:08 +0300
Message-ID: <3063e5050430001857a1447b@mail.gmail.com>
References: <1114681174.5821.19.camel@dhcp0-103.erasme.lan>
	<20050428095710.GA7741@l01.thnet>
	<876ef97a0504280410210fc94e@mail.gmail.com>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <876ef97a0504280410210fc94e@mail.gmail.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Tobias DiPasquale <codeslinger@gmail.com>
Cc: netfilter <netfilter@lists.netfilter.org>

Use arptables for that, like

arptables -A INPUT --src-mac <mac> --opcode 1 -j DROP
arptables -A OUTPUT --dst-mac <mac> --opcode 1 -j DROP

This way that mac won't know your mac address and won't be able to
comunicate with you. But, a "very" good enough firewall, it is not
necesary to filter destination mac, source mac is enough, arptables is
good to stop somebody DDOS you (if he is in same L2 with you).

On 4/28/05, Tobias DiPasquale <codeslinger@gmail.com> wrote:
> On 4/28/05, Michael Tautschnig <michael.tautschnig@zt-consulting.com> wro=
te:
> > Could you please explain, why one would do that? IMHO the only possible=
 use is
> > an interface in promiscous mode.
>=20
> Not really. I know of a project that wanted this functionality in
> order to be able to determine if the next hop was terminal, and if so,
> do some IDS scanning on it. This was in the context of AODV-assembled
> wireless LANs.
>=20
> --
> [ Tobias DiPasquale ]
> 0x636f6465736c696e67657240676d61696c2e636f6d
>=20
>=20


--=20
Bla bla

