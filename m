From: "=?iso-8859-15?q?Nicol=E1s_Vel=E1squez?= O." <spidyno@yahoo.es>
Subject: Re: Authentication in a Firewall Question
Date: Wed, 25 Aug 2004 12:41:35 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200408251241.35463.spidyno@yahoo.es>
References: <BE7EC6C7A6F0E74AAB1E7E36BF5E9EB72F7D50@colms1.co.corp.verintsys
	tems.com>
	<1093452646.2391.9.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1093452646.2391.9.camel@anduril.intranet.cartel-securite.net>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org


Hello there,

I'm trying to do something similar.

When an enduser tries to go to Internet, the browser is redirected to an=20
authentication page, then the webserver that contains that page inserts=20
a rule in the firewall to allow that computer to go to Internet.

It must be something like this, as no programs should be installed on=20
the enduser's machine.

What I was trying to do (without success) was, set a redirector policy=20
that applies to the unauthenticated traffic. The thing is that=20
redirection and dynamic nat are defined on different rules (PREROUTING,=20
POSTROUTING). This is if I'm working with nat, I haven't thought of a=20
way to require authentication when just routing.

Some of the things I'm trying:
## redirector
$IPTABLES -t nat -A PREROUTING -i $LAN_IFACE -p TCP --destination-port=20
80 -j REDIRECT --to-port 81 # The web server listens on port 81

## insert rule for each client
$IPTABLES -t nat -I POSTROUTING -o $INTERNET_IFACE -m mac --mac-source=20
$CLIENT_MAC -j MASQUERADE


Any thoughts are welcome.


El Mi=E9 25 Ago 2004 11:50, Cedric Blancher escribi=F3:
> Le mer 25/08/2004 =E0 18:46, Hihn, Jason a =E9crit :
> > I have devised the following acceptable scheme:
> > A firewall that rejects all traffic to everyone, except for one
> > port. This one port is used to authenticate an IP address through a
> > challenge/response algorithm.
> > If successful, the IP is then allowed through the firewall.
>
> Si NuFW at http://www.nufw.org/. Theses guys have achieved quite
> impressive work. You definitly must try this.

=2D-=20

Atentamente,
Nicol=E1s Vel=E1squez
Bogot=E1, Colombia

(^) =A0 ASCII Ribbon Campaign
 X =A0 =A0NO HTML/RTF in e-mail
/ \ =A0 NO Word docs in e-mail

