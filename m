From: "=?iso-8859-15?q?Nicol=E1s_Vel=E1squez?= O." <nvelasquez@easysol.net>
Subject: custom redirector
Date: Wed, 11 Aug 2004 23:04:23 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408112304.23315.nvelasquez@easysol.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org



Hello there,

I want to do some custom redirection rules, I've searched the web with=20
no success.

What I want to do is to set the forward policy a redirect.

Here is what I was trying without success:
$IPTABLES -t nat -N MY_REDIRECTOR_POLICY
$IPTABLES -t nat -A PREROUTING -i $LAN_IFACE -p TCP --dport 80 -j=20
MY_REDIRECTOR_POLICY --to-port 81
$IPTABLES -A MY_REDIRECTOR_POLICY -j REDIRECT --to-port 81
$IPTABLES -A FORWARD -j MY_REDIRECTOR_POLICY

That snip would go at the end of the rules. so it will work like a=20
policy.

=46irst of all, is it possible to do what I want to do??

Squid is not an option as no body has to be doing any configuration=20
changes on the machines. Transparent Proxy won't do the job, as the=20
objective of the project is to do direct connection. Besides the=20
connections can happen on non web ports.

=2D-=20

Gracias por su tiempo,

Cordialmente Nicol=E1s Vel=E1squez.
Easy Solutions LTDA.
m=F3vil : +57(1)(300) 5576534
tel=E9fono : +57(1)3490294
Email: nvelasquez@easysol.net

