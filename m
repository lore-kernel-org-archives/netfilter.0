From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: services for predetermined IP addresses
Date: Fri, 15 Oct 2004 13:25:28 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF567956A@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: kate <kate7234@yahoo.com>, Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

> so the drop-all would be..?
>=20
> iptables -A INPUT -p TCP -i eth0 -s 0/0 -j DROP
>=20
> or did I just invent my own thing here?
> tia
> Kate

I was just about to comment:

To drop by-by-policy, any rule that doesn't get matched earier gets
picked up by the policy rule.

You would use:

iptables -P INPUT DROP

