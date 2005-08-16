From: Rakupathy_Somasundaram@McAfee.com
Subject: help needed in ip_conntrack for udp.
Date: Tue, 16 Aug 2005 10:47:42 +0530
Message-ID: <CA22D36810B0A7459233616F36BFD59A0646590A@banexmb1.corp.nai.org>
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


> Hi,
>=20
> I have some requirement like to flush the udp related state
> information maintained by ip_conntrack when ever I delete a particular
> rule from the INPUT chain of iptables. Can you please help to identify
> how to achieve this with iptables 1.2.9 ?
>=20
> One solution that I found the mailing list was to remove the conntrack
> and and associated modules and reload them.  But I guess with the 2.4
> kernel onwards, the iptables and ip_conntrack are integrated into the
> kernel itself,  I am not able to remove these modules when I need to
> flush the the state information maintained by conntrack( lsmod command
> doesn't show anything like iptables or conntrack ) . And this approach
> may also disrupt the other connections as well, which I don't want to.
>=20
> Basically my question is there any IOCTL's / other mechanisms to
> delete udp related state information maintained by ip_conntrack ?=20
>=20
> Thanks,
> Rakupathy.
>=20
>=20

