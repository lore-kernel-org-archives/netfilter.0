From: "Wayne de Nobrega" <wdenobre@techconcepts.co.za>
Subject: RE: IPTABLES vs Checkpoint
Date: Wed, 27 Nov 2002 08:45:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F5BAB933C75004690195047C4040A6D0535DC@tc-pdc.jhbA.techconcepts.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Ben Russo <ben@umialumni.com>
Cc: netfilter@lists.netfilter.org

Many thanks for your input.

I agree with your point that if this is to be managed by corporate, then
the Nokia solution would be better from a standards and control point. =20

In my specific case, this company is already running the Nokia solution.
For the office in my country, the local office does not want to incur
the cost of $7,000 (excluding ongoing licence costs) to install the
solution when they can install the IPTABLES version for the equivalent
of $1,000 (h/w, s/w and installation).

The local firewall will be managed locally and has very simply rules in
place as they are not running any services behind the firewall. They
will also not be running any VPN.  It is simply for connecting the local
office to the Internet, not to corporate.

Do you have any more info which explains the architecture of the Nokia
IP330 and Checkpoint solution so that I can do a more technical
comparison between the two products.  The information on the Nokia site
is typical marketing.  I believe the Nokia product runs a customised
version of FreeBSD.

Regards

Wayne

-----Original Message-----
From: Ben Russo [mailto:ben@umialumni.com]=20
Sent: 27 November 2002 12:33 AM
To: Wayne de Nobrega
Cc: netfilter@lists.netfilter.org
Subject: Re: IPTABLES vs Checkpoint


For a company with many offices a Nokia CheckPoint solution is a good
choice *IF* the money spent on the management of the firewall is
reasonably proportional to the cost of the firewall software and
updates.

I used to run many Linux based iptables firewalls for data centers in=20
many different cities and offices in many cities.  It was a management=20
nightmare that led our company to decide to use Checkpoint.  Not because
it was technically superior to iptables when simply looking at
firewalls.  (although there are many viewpoints to that argument) but
because in terms of time and energy spent managing the firewalls
checkpoint's TCO was much lower.

I love Linux ( I am an RHCE and manage scores of Linux servers) iptables
makes a great SOHO firewall for the technically saavy or a host based
firewall with a distributions GUI tools for even=20
newbies.  And if you are in a small organization with only a handfull of
firewalls you can even do *VERY* complex things with it.

However for an enterprise solution you need management tools and you may
need integration with VPN's, DNS, Authentication, IP-GRE Accounting,
performance management=20
and other third party applications. =20
CheckPoint has modules and tools that can do all of that.

You could probably glue together many great Open Source packages to meet
your needs, but it is a constant uphill battle to keep them all updated
with patches and integrated and scalability and management becomes a big
issue.  Also, when you start doing that then there is the risk to the
company of losing the employees who "know-how-it-works"

When sticking to a Commercial Off The Shelf system like CheckPoint and
using Commercial integration modules the costs may seem dramatic.
However you can hire Certified Consultants when your Sr. SysAdmin quits
who know CISCO, NOKIA, CheckPoint, MSCP, RHCE, etc. etc.. There is a
value in that too.

What it comes down to (IMHO) is the variables in your TCO=20
equation.  You need someone who both knows your business and what its
goals and growth are likely to be, and also has  experience with
enterprise WAN management to evaluate that TCO equation.


On Tue, 2002-11-26 at 14:28, Wayne de Nobrega wrote:
> Hello,
>=20
> I have a customer who is part of an international group which has a=20
> policy of using the Nokia Checkpoint firewall.  Due to the signifcant=20
> cost differences, and our preference, the local branch and ourselves=20
> would like to install an IPTABLES based firewall.  I need some help in

> motivating this to head office and am looking for information=20
> comparing the two solutions.  I need to focus on the technical issues=20
> of the two products and ultimately the inherent security realised from

> the two products.
>=20
> Can anyone offer some input or point me to a source of information.
>=20
> Many thanks
>=20
> Wayne


