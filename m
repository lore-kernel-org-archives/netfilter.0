From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Iptables proxy to a different network
Date: Fri, 09 Feb 2007 16:22:04 +0100
Message-ID: <45CC919C.7030104@plouf.fr.eu.org>
References: <D392D4803D14354CBC49D772E19DD0CD45660A@zeus.w2k.nrlmry.navy.mil>	<45CC5A91.4090200@plouf.fr.eu.org>
	<Pine.LNX.4.61.0702091338030.31955@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0702091338030.31955@yvahk01.tjqt.qr>
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

Jan Engelhardt a =E9crit :
> On Feb 9 2007 12:27, Pascal Hambourg wrote:
>=20
>>>-----------
>>>*nat
>>>-A PREROUTING -p tcp --dport 80 -j DNAT --to x.y.z:80
>>>COMMIT
>>>-----------
>>
>>If you cannot or do not wish to prevent direct routing between the clie=
nt and
>>the server, you must SNAT the forwarded connections in the POSTROUTING =
chain.
>=20
> Or make it so that any packets from C pass B.

This is what I meant when I wrote "prevent direct routing between the=20
client and the server".

> For example, by setting up
> your proxy box as a router or bridge (both approaches work) in the midd=
le.

I may be wrong, but doing IP NAT on a bridge seems to me quite=20
unnatural and troublesome.

