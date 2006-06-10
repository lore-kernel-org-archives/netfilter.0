From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: can i have boolean OR between multiple addresses in	iptables
 expression?
Date: Sat, 10 Jun 2006 09:34:28 +0200
Message-ID: <448A7604.6040701@plouf.fr.eu.org>
References: <01b501c68bc7$22461990$0419a8c0@fly>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <01b501c68bc7$22461990$0419a8c0@fly>
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

Pablo Sanchez a =E9crit :
>>
>>for example i would like to have a rule with -s !127.0.0.1 OR=20
>>!172.16.0.0/24  =20
>=20
> I believe you can't.  What I've done is simply create several rules wit=
h the
> predicate slightly different in each to accomplish an OR.  If you'd lik=
e to
> make it obvious, you can create a new chain and place your different ru=
les
> there.

I think that using a user defined chain is not only a matter of=20
obviousness, in some case the result may be different from using two=20
separate rules. For example :

iptables -A INPUT -s 127.0.0.1 -m limit -j ACCEPT
iptables -A INPUT -s 172.16.0.0/24 -m limit -j ACCEPT

and :

iptables -A INPUT -s 127.0.0.1 -j user_chain
iptables -A INPUT -s 172.16.0.0/24 -j user_chain
iptables -A user_chain -m limit -j ACCEPT

behave differently because, if I understand correctly, each 'limit'=20
match has its own counters and timers. Am I right ?

