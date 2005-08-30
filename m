From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Allowing access only some sites - onely some mac address
Date: Tue, 30 Aug 2005 10:44:14 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7741FD024@farmer.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Jiann-Ming Su
> Sent: Tuesday, August 30, 2005 9:50 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: Allowing access only some sites - onely some mac address
>=20
> On 8/29/05, Sebasti=E3o Ant=F4nio Campos (GWA)=20
> <sa.campos@datasulsp.com.br>
> wrote:
> >=20
> > Dears,
> >=20
> > I'd like to allow access only to some sites by some mac address.
> >=20
> > For example:
> >=20
> > I have a list of the mac address 00:0c:6E:11:E8:B0,=20
> 00:D8:02:D8:C8:DF,=20
> > 00:E7:05:C9:07:EA............ and and I'd like that only these mac=20
> > address could access only the following IP: 200.221.2.128=20
> > <http://200.221.2.128>,
> > 200.221.2.129 <http://200.221.2.129>,
> > 200.221.2.130 <http://200.221.2.130>, 200.221.2.131=20
> > <http://200.221.2.131>,
> > 200.205.144.75 <http://200.205.144.75>,=20
> 200.205.144.76<http://200.205.144.76>.=20
> > But the other
> > mac address could access everything.
>=20
>=20
>=20
> IIRC, MAC addresses (layer 2) do not go beyond the router=20
> (layer 3). I think you can only do what you are proposing if=20
> all your boxes are behind the same broadcast domain.
>=20
> --
> Jiann-Ming Su
> "I have to decide between two equally frightening options.=20
> If I wanted to do that, I'd vote." --Duckman
>=20

That is correct. When a packet passes through a router, it comes out the =
other side with the router's MAC, not the original computer's MAC. I =
imagine there's an RFC that goes along with this but I discovered it =
using MAC filtering on an iptables firewall about a year ago.

Derick Anderson

