From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: bind 9 and iptables
Date: Fri, 27 Aug 2004 16:40:20 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF56794B8@alderaan.smgtec.com>
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
To: Jason Opperisano <Jopperisano@alphanumeric.com>, netfilter@lists.netfilter.org

> somewhere along the line, you lost:
>=20
>   iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

And if that doesn't work, add the following to the end of your rules:

iptables -A INPUT -j LOG
iptables -A OUTPUT -j LOG

