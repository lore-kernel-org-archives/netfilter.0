From: Leonardo <p0q0b0d@gmail.com>
Subject: Re: ICMP frag needed not forwarded to MSQ clients
Date: Thu, 26 May 2005 14:47:31 +0200
Message-ID: <3b1e6f48050526054740113f78@mail.gmail.com>
References: <3b1e6f48050525011730fa7e44@mail.gmail.com>
	<Pine.LNX.4.60.0505251222550.9513@darkstar.sysinfo.com>
	<3b1e6f480505260025707940fd@mail.gmail.com>
	<Pine.LNX.4.58.0505261355220.24500@blackhole.kfki.hu>
Reply-To: Leonardo <p0q0b0d@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0505261355220.24500@blackhole.kfki.hu>
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

On 5/26/05, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> wrote:
> On Thu, 26 May 2005, Leonardo wrote:
>=20
> > That's exactly the problem! The clients should receive an ICMP frag
> > needed packet in order to reduce the packet size, however my
> > proxy/router does not forward the ICMP msg to them! WHY?!?!?!
> > The are no iptables rules that block ICMP!
>=20
> As you have no DROP rule, netfilter does not drop the packets so it's not
> a netfilter/iptables related problem.

May be it's like you say... but really i do not have idea where else
to look for...

> Probably you have got rp_filtering enabled and the routing engine discard=
s
> the ICMP packets.
>

Yes, I have it enabled. Disabling it does not solve the problem... :-(

echo 0 > /proc/sys/net/ipv4/conf/eth2/rp_filter
echo 0 > /proc/sys/net/ipv4/conf/eth0/rp_filter

ICMP packets type 3 are NOT routed anyway...

> Best regards,

> Jozsef
> -

Thank you.
--=20
Leonardo Arena

