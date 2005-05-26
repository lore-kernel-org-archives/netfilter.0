From: Leonardo <p0q0b0d@gmail.com>
Subject: Re: ICMP frag needed not forwarded to MSQ clients
Date: Thu, 26 May 2005 09:25:23 +0200
Message-ID: <3b1e6f480505260025707940fd@mail.gmail.com>
References: <3b1e6f48050525011730fa7e44@mail.gmail.com>
	<Pine.LNX.4.60.0505251222550.9513@darkstar.sysinfo.com>
Reply-To: Leonardo <p0q0b0d@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.60.0505251222550.9513@darkstar.sysinfo.com>
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

>=20
>=20
> have you a;
>=20
> iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMMS \
> - --clacmp-mss-to-ptmu

Yes! I did it! And it does't work... :-(
=20
>=20
> kind of statment in your rules, often require with VPN/s that work with
> smaller packet sizes due to increasing headers...

That's exactly the problem! The clients should receive an ICMP frag
needed packet in order to reduce the packet size, however my
proxy/router does not forward the ICMP msg to them! WHY?!?!?!
The are no iptables rules that block ICMP!
>=20
>=20
> Thanks,
>=20
> Ron DuFresne
> - --

Thanks to you!

--=20
Leonardo Arena

