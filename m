From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: Split external requisitions between two internet connections
Date: Tue, 16 Aug 2005 16:29:01 -0400
Message-ID: <65aa6af905081613295e39edf3@mail.gmail.com>
References: <eb5ae9cc05081611187210c11b@mail.gmail.com>
	<eb5ae9cc0508161122447fc95c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <eb5ae9cc0508161122447fc95c@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

I guess you have to use separate routing tables. You could mark
packets and then use a routing rule to set which route the traffic
could go through. (I had problems using masquerade with this... maybe
SNAT can do a better job).

On 8/16/05, Leonardo Marques <surf3r0@gmail.com> wrote:
> Hi people,
>=20
> I have a linux box which will have three ethernet interfaces:
>=20
> eth0 connected with the LAN
> eth1 connected with the internet across ISP1
> eth2 connected with the internet acorss ISP2
>=20
> So, i need do it:
>=20
> All internet requisition for a external 80 port (http) go out to the
> internet across the eth1, and all others requisions, for all others
> external ports, go out to the internet across the other internet
> connection (eth2).
>=20
> How can I do it?
>=20
> Thanks for all attention!
> []s
>=20
> --
> ------------------------------
> Leonardo Marques
> http://www.analyx.org
> ------------------------------
>=20
>

