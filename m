From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: adding rules - slow
Date: Fri, 27 Jul 2007 17:38:04 -0400
Message-ID: <1185572284.10031.2.camel@localhost>
References: <46aa63fb.120b420a.16f8.0c23@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46aa63fb.120b420a.16f8.0c23@mx.google.com>
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
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?J=C3=BAlius_Bem=C5=A1?= <julius.bems@gmail.com>
Cc: netfilter@lists.netfilter.org

On Fri, 2007-07-27 at 23:30 +0200, J=C3=BAlius Bem=C5=A1 wrote:
> Hi,
>=20
> When I need to add som rules (in my case 100) to some chain it takes vari=
ous
> time, depending on the number of existing rules in the chain. So when I a=
dd
> 100 rules to empty chain, it takes 1.8sec. If tehere is 1000 rules int th=
e
> chain, it takes 4.5sec and if there is 10000 rules it takes 21sec.=20
>=20
> My problem is, that i need to add this rules to chain which contains 2000=
0
> rules in short time. I think, that the way of adding rules into chain is
> very innefective.=20
>=20
> Could someone tell me how the adding works internally? What data structur=
es
> are used? Because I need solve this and find the way how to add new rules
> quickly.
>=20
> Thanks for replies
>=20
>=20
We face the same problem on the ISCS project
(http://iscs.sourceforge.net).  There, do to micro-perimeter network
security, we frequently generate thousands or tens of thousands of rules
with the click of a mouse.

We handle it by adding rules via iptables-restore rather than iptables.
The load time difference is remarkable.  You write your rules into files
with very similar syntax to iptables and then direct them into
iptables-restore, e.g.,=20

iptables-restore < /etc/PEP/rules.txt

or, if you do not want to overwrite existing rules,

iptables-restore -n < /etc/PEP/runtimerules.txt

Hope this helps - John
--=20
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


