From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: internal > external > internal NAT
Date: Mon, 10 Mar 2003 13:39:05 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303101339.05891.netfilter@newkirk.us>
References: <Pine.LNX.4.53.0303101302320.5044@gypsy>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0303101302320.5044@gypsy>
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
To: Steve Mickeler <steve@warning.ca>, netfilter@lists.netfilter.org

On Monday 10 March 2003 01:02 pm, Steve Mickeler wrote:
> I have a requirement where I need to NAT some internal connections to
> make sure everything to the destination appears to be coming from the
> same source.

> What I need to do is this:
>
> If the destination IP =3D 172.17.4.200 then redirect it to 192.168.32.1=
8
> but first NAT the source IP to 192.168.32.200
>
> Anyone know a simple way to do this ?

iptables -t nat -A PREROUTING -d 172.17.4.200 -j DNAT --to 192.168.32.18
iptables -t nat -A POSTROUTING -d 192.168.32.18 -j SNAT --to=20
192.168.32.200

You can't SNAT first, but you can DNAT then SNAT.  This will accomplish=20
what you ask.  (as always, make sure you ACCEPT the traffic in FORWARD,=20
based on "-d 192.168.32.18", if not covered by a more general rule)

j


