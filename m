From: =?ISO-8859-1?Q?Llu=EDs_Batlle?= <viriketo@gmail.com>
Subject: More on conntrack + NAT + mangle/nat tables
Date: Wed, 6 Jul 2005 11:17:49 +0200
Message-ID: <45219fb00507060217450a89ee@mail.gmail.com>
Reply-To: =?ISO-8859-1?Q?Llu=EDs_Batlle?= <viriketo@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: lartc@mailman.ds9a.nl, netfilter@lists.netfilter.org

I already understood that a packet enters chains in the 'nat' table
only if it is the _first_ packet of a connection. In that case, we may
do SNAT in the POSTROUTING chain of the 'nat' table.
So, the packets arrive to the POSTROUTING chain of the 'mangle' table
with the source IP address changed (if it's said by the rules of the
'nat' table).

BUT, for the rest of the packets (not the first ones) of a connection,
packets enter the POSTROUTING chain of the 'mangle' table _without_ a
changed source IP address. Is this the expected behaviour of
netfilter/conntrack?

To me, it's quite strange.

- I'm learning about the whole netfilter/policy router these days :)
So I write a lot about that, which sounds strange to me. I hope I'm
not annoying to the list.

Thanks a lot.

- Llu=EDs

