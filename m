From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Failed to establish TCP connection when Masqueradeing
Date: Fri, 20 Apr 2007 20:50:35 +0200
Message-ID: <46290B7B.2030509@plouf.fr.eu.org>
References: <600b8cdc0704200745x5509ccdw807a866f997224b5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <600b8cdc0704200745x5509ccdw807a866f997224b5@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Simon Olofsson a =E9crit :
>=20
> I would like all traffic to use the ethernet interface except traffic
> from a specific user. I would like the traffic from this specific user
> to use the ppp interface.
>=20
> When I try to establish a TCP connection from the specified user I see
> that the syn packet is sent out on the correct interface with the
> correct source address and the syn,ack is received, but it seems like
> the syn,ack is lost somewhere on my host because a new syn is sent
> after a while.
>=20
> What is missing?

Check that source validation by reversed path is disabled at least for=20
the PPP interface (/proc/sys/net/ipv4/conf/ppp0/rp_filter=3D0 or=20
/proc/sys/net/ipv4/conf/all/rp_filter=3D0).

