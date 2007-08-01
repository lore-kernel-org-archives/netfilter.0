From: =?UTF-8?B?SsO6bGl1cyBCZW3FoQ==?= <julo@atknet.sk>
Subject: RE: adding rules - slow
Date: Wed, 1 Aug 2007 09:24:21 +0200
Message-ID: <002f01c7d40c$fb1b87d0$f1529770$@sk>
References: <46aa63fb.120b420a.16f8.0c23@mx.google.com>
	<1185572284.10031.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1185572284.10031.2.camel@localhost>
Content-Language: sk
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
To: "'John A. Sullivan III'" <jsullivan@opensourcedevel.com>
Cc: netfilter@lists.netfilter.org

Thank you very much ... good idea.
But do you know why is iptables so slow? Because I think about writing =
my own utility for adding new rules.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org =
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of John A. =
Sullivan III
Sent: Friday, July 27, 2007 11:38 PM
To: J=C3=BAlius Bem=C5=A1
Cc: netfilter@lists.netfilter.org
Subject: Re: adding rules - slow

On Fri, 2007-07-27 at 23:30 +0200, J=C3=BAlius Bem=C5=A1 wrote:
> Hi,
>=20
> When I need to add som rules (in my case 100) to some chain it takes =
various
> time, depending on the number of existing rules in the chain. So when =
I add
> 100 rules to empty chain, it takes 1.8sec. If tehere is 1000 rules int =
the
> chain, it takes 4.5sec and if there is 10000 rules it takes 21sec.=20
>=20
> My problem is, that i need to add this rules to chain which contains =
20000
> rules in short time. I think, that the way of adding rules into chain =
is
> very innefective.=20
>=20
> Could someone tell me how the adding works internally? What data =
structures
> are used? Because I need solve this and find the way how to add new =
rules
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




