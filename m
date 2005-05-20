From: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Subject: Re: Prevent traceroutes
Date: Fri, 20 May 2005 10:01:38 +0200
Message-ID: <fad9d484050520010128e506ed@mail.gmail.com>
References: <fad9d484050519150730dbc53d@mail.gmail.com>
	<20050519232314.GA9369@bender.817west.com>
	<20050519233347.GA9462@bender.817west.com>
	<428D8638.4040301@riverviewtech.net>
Reply-To: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <428D8638.4040301@riverviewtech.net>
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
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

On 5/20/05, Taylor, Grant <gtaylor@riverviewtech.net> wrote:
> > looking at that response--there's a situation screaming for a custom
> > chain:
> >
> >   iptables -N DROP_TRACE
> >   iptables -A DROP_TRACE -p udp --dport 33434:33523 -j DROP
> >   iptables -A DROP_TRACE -p icmp --icmp-type 8 -m ttl --ttl-lt 5 -j DRO=
P
> >
> >   iptables -A INPUT -j DROP_TRACE
> >   iptables -A FORWARD -j DROP_TRACE
>=20
> I don't think that I could agree more about the need for a new chain.  I =
think I'd be tempted to do my match a bit differently though.
>=20
> iptables -t filter -A DROP_TRACE -o eth0 -p udp -m recent --name Drop_Tra=
ceroute --update --seconds 200 --rdest -j DROP
> iptables -t filter -A DROP_TRACE -o eth0 -p udp -m recent --name Drop_Tra=
ceroute --set --rdest -m ttl --ttl-eq 1 -j DROP
> iptables -t filter -A DROP_TRACE -o eth0 -p icmp -m recent --name Drop_Tr=
aceroute --update --seconds 200 --rdest -j DROP
> iptables -t filter -A DROP_TRACE -o eth0 -p icmp -m recent --name Drop_Tr=
aceroute --set --rdest -m ttl --ttl-eq 1 -j DROP
>=20
> This should match any traffic (UDP or ICMP) that is leaving your network =
with a TTL of 1 which *should* be first packet in a traceroute that your fi=
rewall / router would see.  Seeing as how this should match any traceroute =
traffic you should be able to change the DROP target to be any thing else t=
hat you would want to redirect the traffic out some other interface be it v=
ia the ROUTE target or the MARK target in conjunction with ip routes.
>=20
> The only thing that I have not figured out as of yet how to do is DROP th=
e first packet that the firewall sees as every attempt that I made, even a =
DROP policy on the FORWARD and OUTPUT chain, did not block the first "TTL T=
ime Exceeded" response.

Thanks Taylor, I followed Jayson's example and it worked for Windows.
It blocked the first three or for hops in most my tests. I'll try your
rules as well but I first want to read up on the recent match. I don't
like using something I don't understand properly.

Regards

>=20
>=20
>=20
> Grant. . . .
>=20
>=20


--=20

Kenneth Kalmer
kenneth.kalmer@gmail.com
http://opensourcery.blogspot.com

