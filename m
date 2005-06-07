From: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Subject: Re: Route traffic per protocol - it is possible?
Date: Tue, 7 Jun 2005 20:49:34 +0200
Message-ID: <fad9d48405060711495caf6b63@mail.gmail.com>
References: <40473.200.125.13.172.1118163327.squirrel@webmail.prolinux.net.uy>
Reply-To: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <40473.200.125.13.172.1118163327.squirrel@webmail.prolinux.net.uy>
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
To: Gustavo Castro Puig <gcastro@gcp.com.uy>
Cc: netfilter@lists.netfilter.org

On 6/7/05, Gustavo Castro Puig <gcastro@gcp.com.uy> wrote:
> Hi, list!
>=20
>   I've got an issue to resolve and I want to know if it's possible to do
> it with netfilter/iproute2. I've been googling for some time, but I
> couldn't find the way to do this (may be I'm not searching the correct
> way), so any help from you will be *VERY* appreciated.
>   I have a firewall with two links, on direct to Internet and another (to
> internet too) through another firewall. All traffic is now going to
> Internet through the other firewall, but I want to know if it's possible
> to send some traffic (not all) through the direct link to Internet. I
> don't want to redirect all traffic coming from some IPs, intead, I want
> to redirect only SSH traffic (for example) from the box through the
> direct link and all other traffic to the other firewall. Something like
> a "per-protocol routing policy". I've been trying with iproute2 and
> iptables, marking packets and routing them with two routing tables, but
> it didn't work.

I'm not an expert, nor have I done this myself. But from replies by
members of the list and some reading up over the months I'd recommend
using the ROUTE target.

<man iptables>
   ROUTE
       This is used to explicitly override the core network stack's
routing decision.  mangle table.

       --oif ifname
              Route the packet through ifname network interface

       --iif ifname
              Change the packet's incoming interface to ifname

       --gw IP_address
              Route the packet via this gateway

       --continue
              Behave like a non-terminating target and continue
traversing the rules.  Not valid in combination with --iif
</man iptables>

So, let's say ppp0 and ppp1 are your links, and everything defaults to
ppp0. You want ssh to go over ppp1, try one of these:

iptables -t mangle -A PREROUTING --dport 22 -j ROUTE --oif ppp1
- or -
iptables -t mangle -A PREROUTING --dport 22 -j ROUTE --gw 1.1.1.1

In the above example, 1.1.1.1 is the gateway IP of ppp1.

To the other members, can the above be combined in one shot? Providing
both the interface and the gateway IP?

HTH, I haven't tried this myself...

>   The firewall have two nic, one (eth0) with an address 192.168.0.15 and
> the other (eth1) with the public address.
>   This is what I've done:
>=20
> ------------------------------------------------------------------------
> ip route flush table NEW
> ip route add 192.168.0.0/24 dev eth0 table NEW
> ip route add default via XXX.XXX.XXX.XXX table NEW dev eth1
>=20
> iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
>=20
> ip rule add fwmark 1 table NEW
>=20
> ip rule add from XXX.XXX.XXX.XXX table NEW
>=20
> iptables -t mangle -A OUTPUT -p tcp --dport 22 -j MARK --set-mark 1
> ------------------------------------------------------------------------
>   None of this lines generate errors.
>   May be this is not possible, but if it is, how could be done?
>   Thanks in advance!
>=20
> Cheers,
>      G.Castro P.
>=20
>=20
>=20
>=20


--=20

Kenneth Kalmer
kenneth.kalmer@gmail.com
http://opensourcery.blogspot.com

