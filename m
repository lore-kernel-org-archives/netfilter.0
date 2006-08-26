From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: creating one rule for both tcp and udp?
Date: Sat, 26 Aug 2006 20:47:41 +0200
Message-ID: <44F0974D.3060705@plouf.fr.eu.org>
References: <44EF3A8C.6000004@ncemch.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44EF3A8C.6000004@ncemch.org>
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

Matt Singerman a =E9crit :
>=20
> -A FORWARD -s 0/0 -d 141.161.111.203  -p all --dport 548 -j ACCEPT
>=20
> iptables v1.3.5: Unknown arg `--dport'
>=20
> I am guessing that is because "-p all" include ICMP, which doesn't take=
=20
> the --dport argument.  Am I wrong about that?

It's a little more complicated than that. It's not that ICMP or other=20
protocols don't take the --dport argument. Actually --dport is valid=20
only with the "-m tcp" and "-m udp" matches, which in turn are only=20
valid with - and implicitly created by - "-p tcp" and "-p udp" respective=
ly.

