From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Firewall IP change
Date: Sat, 24 Jul 2004 12:58:50 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90511F0@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org


> IP on your firewall, then you need to SNAT outbound packets (which =
will=20
> automatically DNAT reply packets for you too):

> iptables -A POSTROUTING -t nat -o eth2 -j DNAT --to 62.160.X.Y
                                            ^
Antony-

I know you say SNAT in the explanation, but a rogue D made it into the =
example rule...  stupid S & D right next to each other...
 =20
  iptables -A POSTROUTING -t nat -o eth2 -j SNAT --to 62.160.X.Y

-j

