From: "=?iso-8859-15?q?Nicol=E1s_Vel=E1squez?= O." <spidyno@yahoo.es>
Subject: custom redirector
Date: Thu, 12 Aug 2004 11:58:17 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408121158.17197.spidyno@yahoo.es>
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

I want to do some custom redirection rules, I've searched the web with
no success.

What I want to do is to set the forward policy a redirect.

Here is what I was trying without success:
$IPTABLES -t nat -N MY_REDIRECTOR_POLICY
$IPTABLES -t nat -A PREROUTING -i $LAN_IFACE -p TCP --dport 80 -j
MY_REDIRECTOR_POLICY --to-port 81
$IPTABLES -A MY_REDIRECTOR_POLICY -j REDIRECT --to-port 81
$IPTABLES -A FORWARD -j MY_REDIRECTOR_POLICY

That snip would go at the end of the rules. so it will work like a
policy.

=46irst of all, is it possible to do what I want to do??

Squid is not an option as no body has to be doing any configuration
changes on the machines. Transparent Proxy won't do the job, as the
objective of the project is to do direct connection. Besides the
connections can happen on non web ports.

=2D-=20

Atentamente,
Nicol=E1s Vel=E1squez
Bogot=E1, Colombia

(^) =A0 ASCII Ribbon Campaign
 X =A0 =A0NO HTML/RTF in e-mail
/ \ =A0 NO Word docs in e-mail

