From: "Brad Morgan" <B-Morgan@concentric.net>
Subject: RE: Local rule for Port Forward
Date: Sat, 26 Apr 2003 09:44:36 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002201c30c0a$c106cb00$0400a8c0@bradmorgan>
References: <1051344354.14942.2.camel@il.npn>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1051344354.14942.2.camel@il.npn>
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
To: pnelson@neatech.com, 'Netfilter List' <netfilter@lists.samba.org>



>  I'm doing port forwarding to a server that runs jabber and everything
>  works fine, I did notice that if I bring up a jabber client on the
>  firewall itself I do not get connected.  While this isn't really
>  needed... I don't totally understand why it doesn't work.  Being
>  inquisitive... well I just gots to know why!  Can anyone shed some
>  light?
>=20
>  My rules for the jabber port forward are:
>=20
>  iptables -A FORWARD
>           -i $ExIF -d $JabIP -p tcp --dport $JabPort
>           -j ACCEPT
>  iptables -A PREROUTING
>           -t nat -d $ExIP -p tcp --dport $JabPort
>           -j DNAT --to-destination $JabIP
>  iptables -A POSTROUTING
>           -t nat -d $JabIP -p tcp --dport $JabPort
>           -j SNAT --to-source $InIP

The reason why jabber doesn't work on the firewall is because the =
PREROUTING
rule sends the packet to jabber server as requested.  It never reaches =
the
INPUT chain or the client running on the firewall.

An excellent reference for how packets traverse the iptables chains can =
be
found at http://iptables-tutorial.frozentux.net by Oskar Andreasson.  He
just posted a new version.

Regards,

Brad Morgan
 =20



