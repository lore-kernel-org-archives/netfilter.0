From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: ICMP types to allow
Date: Wed, 21 Dec 2005 13:36:04 -0500
Message-ID: <FAC4E024BF776842876169173CE2F01313B722@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


After reading the ICMP state machine section of the Netfilter tutorial
[http://iptables-tutorial.frozentux.net/iptables-tutorial.html#ICMPCONNE
CTIONS] it appears that ICMP traffic related to existing TCP and UDP
connections falls under the RELATED,ESTABLISHED rules.

So someone correct me if I'm wrong, but this means that any valid ICMP
error message would get picked up by a '-A FORWARD -m state --state
RELATED,ESTABLISHED -j ACCEPT' at the start of the chain, and so (as
lst_hoe01 stated) allowing type 8 is all you really need to do, correct?
(and a little reading goes a long way... =3D)

Thanks,

Derick Anderson
=20

