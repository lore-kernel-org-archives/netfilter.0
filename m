From: "Cedric Blancher" <blancher@cartel-securite.fr>
Subject: Re: to patch, or not to patch?
Date: Thu, 27 Mar 2003 17:53:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001301c2f481$67a1a300$0e0aa8c0@Nussele>
References: <1048778825.17439.7.camel@midgard.guardium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Joe Judge <joe_judge@guardium.com>, netfilter@lists.netfilter.org

----- Original Message -----
From: "Joe Judge" <joe_judge@guardium.com>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, March 27, 2003 4:27 PM
Subject: to patch, or not to patch?

> Should I do the Patch-o-matic to get the ROUTE patch?
> or is there a way to do this?

If you don't want to use patch-o-matic and still get something close to
ROUTE target, than use MARK target and advanced routing stuff as described
in Linux Advanced Routing and Traffic Control HOWTO on http://lartc.org/.

It is quite simple. You mark all packets you want to route differently.
Then, you create an alternate routing table based on this very mark using
iproute2 stuff. ROUTE target does it all in one shot, it is imho more
simple, but you'll have to use POM, so build a new kernel and iptables from
sources. MARK+iproute2 does not need POM usage, but likely needs a kernel
build as your current one may not support advanced routing stuff, especially
use Netfilter mark as routing key.

--
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curit=
=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE



