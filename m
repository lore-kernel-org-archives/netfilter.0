From: Hitesh Ballani <hb69@cornell.edu>
Subject: Re: tunneling and iptables
Date: Wed, 10 Mar 2004 04:38:48 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.1.1.2.20040310043513.00b315a8@postoffice6.mail.cornell.edu>
References: <5.2.1.1.2.20040310030818.00b40808@postoffice6.mail.cornell.edu>
 <5.2.1.1.2.20040309214501.00b47310@postoffice6.mail.cornell.edu>
 <5.2.1.1.2.20040309214501.00b47310@postoffice6.mail.cornell.edu>
 <5.2.1.1.2.20040310030818.00b40808@postoffice6.mail.cornell.edu> <1078909348.2757.13.camel@anduril.intranet.cartel-securite.
 net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1078909348.2757.13.camel@anduril.intranet.cartel-securite.
 net>
References: <5.2.1.1.2.20040310030818.00b40808@postoffice6.mail.cornell.edu>
 <5.2.1.1.2.20040309214501.00b47310@postoffice6.mail.cornell.edu>
 <5.2.1.1.2.20040309214501.00b47310@postoffice6.mail.cornell.edu>
 <5.2.1.1.2.20040310030818.00b40808@postoffice6.mail.cornell.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

At 10:02 AM 3/10/2004 +0100, Cedric Blancher wrote:
>Le mer 10/03/2004 =E0 09:15, Hitesh Ballani a =E9crit :
> > thanks for your comments on tunnels ... actually i am working on a model
> > for anycast deployment and need to have the 16 bits so that i can=
 support
> > 256*(2^16) services using a single /24 block ..
>
>OK.
>
>If I understand your context (what may not be true), your problem is
>that you have to route packets against destination port and that MARK
>capabilities are too limited for you to have Netfilter communicate
>within policy routing.
>
>So, have you considered using ROUTE target (from patch-o-matic), that
>allows one to specify a specific route for a given packet within
>Netfilter. With it, you could implement rule just like this :
>
>         iptables -t mangle -A POSTROUTING -p tcp --dport $myservice \
>                 -j ROUTE --gw $myservicegw
>
>
>--
>http://www.netexit.com/~sid/
>PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
> >> Hi! I'm your friendly neighbourhood signature virus.
> >> Copy me to your signature file and help me spread!



Sorry to bug you  ... that ROUTE extension is perfect for me  ... but with=
=20
my design I will have around 2000~  tunnels created (i know this sounds=20
crazy).. will the kernel be able to handle this or is this too much of an=20
overhead .... leaving aside the start up overhead, during the actual=20
forwarding is there any overhead besides the extra ip header being=
 attached....

Thanks for your time,

Hitesh


