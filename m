From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: DNAT with orignal source address
Date: Thu, 03 Aug 2006 17:14:18 +0200
Message-ID: <44D212CA.3060609@plouf.fr.eu.org>
References: <A78C6C481BFAE949BC5990E1EEB2FE125826@q.LeBlancNet.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <A78C6C481BFAE949BC5990E1EEB2FE125826@q.LeBlancNet.us>
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

Robert LeBlanc a =E9crit :
>   Thanks for the feedback. I am currently using the following as my
> general NAT that catches everything that is not my servers.
[...]
> #General nat
>=20
> iptables -t nat -A POSTROUTING -j SNAT --to-source 1.1.1.1

And "everything" means *really* ANY source address from ANY interface,=20
including not only your private subnet but also the whole internet=20
0.0.0.0/0 !

> What exactly is the difference between --to and
> --to-source/--to-destination, is it just an alias?

Yes, --to is just shorter and can be used in both SNAT and DNAT.

> One question that I have regarding the recipe that you provided=20
> is that since I have machines with public addresses scattered through=20
> the 192.168.2.0/24 subnet would it still be matching more then it=20
> should?

What do you mean ?

> Or does providing it a subnet and an out interface try to=20
> prevent NATing on inbound traffic as well?

Yes. The subnet condition prevent the rule to apply to any internet=20
source address (including the NAT box own public address), and the=20
output interface condition prevent the rule to apply to any connection=20
coming from the outside. Actually either condition should be sufficient=20
to prevent the undesired behaviour you described, but both won't harm.=20
Of course it must be placed after the more specific SNAT rules.

