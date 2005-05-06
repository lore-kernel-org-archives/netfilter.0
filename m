From: Greg Cope <gregcope@gmail.com>
Subject: Re: How to Get a DMZ hosts's trafic routed via a particular IP
	address on a firewall?
Date: Fri, 6 May 2005 15:36:04 +0100
Message-ID: <c0e9781f05050607362e5d644e@mail.gmail.com>
References: <c0e9781f05050509315ff51a77@mail.gmail.com>
	<20050505213458.GA24884@bender.817west.com>
Reply-To: Greg Cope <gregcope@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050505213458.GA24884@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

On 5/5/05, Jason Opperisano <opie@817west.com> wrote:
> <--snip crazy routing stuff-->
>=20
> sounds like you want 1-to-1 NAT for the mail server, which takes 2 NAT
> rules (one for connections initiated *to* the mailserver, and one for
> connections initiated *from* the mailserver):
>=20
>   iptables -t nat -A PREROUTING -i eth0 -d 217.154.55.250 \
>     -j DNAT --to-destination $MAILSRV_PRIV_IP

That I have working fine.

>=20
>   iptables -t nat -A POSTROUTING -o eth0 -s $MAILSRV_PRIV_IP \
>     -j SNAT --to-source 217.154.55.250

Ah - tried this:

iptables -t nat -A POSTROUTING -o eth0 -s 192.168.254.2 -p tcp --dport
25 -j SNAT --to-source 217.154.55.250

Or variants there off.

No Joy...

I could scream......

Anyone any ideas

Greg

mail.e-dba.net =3D 192.168.254.3 the DMZ / private address
$  iptables -t nat -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination        =20
DNAT       tcp  --  anywhere             mail.e-dba.net      tcp
dpt:smtp to:192.168.254.2

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination        =20
MASQUERADE  all  --  192.168.0.0/16       anywhere           =20
SNAT       tcp  --  mail.e-dba.net       anywhere            to:217.154.55.=
250=20

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination        =20

>=20
> sounds like you already have the 1st rule in place.  make sure the 2nd
> rule comes *before* any outbound SNAT/MASQ rule that is less specific.
>=20
> -j

