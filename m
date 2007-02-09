From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Iptables proxy to a different network
Date: Fri, 09 Feb 2007 12:27:13 +0100
Message-ID: <45CC5A91.4090200@plouf.fr.eu.org>
References: <D392D4803D14354CBC49D772E19DD0CD45660A@zeus.w2k.nrlmry.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D392D4803D14354CBC49D772E19DD0CD45660A@zeus.w2k.nrlmry.navy.mil>
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

Andrus, Mr. Brian (Contractor) a =E9crit :
> I have a system with a single nic and ip address a.b.c.1 (system A)
> I want to proxy incoming requests to port 80 to a different system on a
> different subnet of x.y.z.1 (system B)
>=20
> On system a.b.c.1, I am trying the following in my
> /etc/sysconfig/iptables:
> -----------
> *nat
> -A PREROUTING -p tcp --dport 80 -j DNAT --to x.y.z:80
> COMMIT
> -----------
>=20
> This seems to ALMOST work. The request from a client system (System C)
> go to System A, get rewritten and are received by system B. System B
> seems to be responding, trying to send to System C directly, but (I
> think) System C is expecting its response to be from system A, not
> System B, so it ignores the responses.

As usual. Known issue.
If you cannot or do not wish to prevent direct routing between the=20
client and the server, you must SNAT the forwarded connections in the=20
POSTROUTING chain.

