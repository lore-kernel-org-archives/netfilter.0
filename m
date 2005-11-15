From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: RE: SNAT vs MASQUERADE
Date: Tue, 15 Nov 2005 17:01:27 -0500
Message-ID: <NEBBLLCNFOFHMALJMDDEGENDBFAB.pablo@blueoakdb.com>
References: <NEBBLLCNFOFHMALJMDDEGEDPBFAB.pablo@blueoakdb.com>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <NEBBLLCNFOFHMALJMDDEGEDPBFAB.pablo@blueoakdb.com>
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

> I discovered a case where SNAT'ing is necessary over the=20
> MASQUERADE target. =20
>=20
> What I have found is when I use the MASQUERADE target, [B] sees=20
> the traffic as if it came via IP 172.16.1.129.

Hi everyone,

Following up on my own post above ... I believe to get around the above =
issue, you can use the 'SRC' arg to 'ip route add':

	ip route add 172.16.4.0/24 src 172.16.4.2 dev eth0 protocol static

Cheers!
-pablo


