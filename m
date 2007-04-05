From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Does iptables support VLANs
Date: Thu, 05 Apr 2007 22:33:23 +0200
Message-ID: <46155D13.8000608@plouf.fr.eu.org>
References: <89576.2004.qm@web56201.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <89576.2004.qm@web56201.mail.re3.yahoo.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Elvir Kuric a =E9crit :
>=20
> I hav short question does iptables support VLAN target ?

This question does not make much sense. It is like asking whether=20
iptables supports ethernet or PPP.

> Is possible implement VLANs in iptables firewall?

Of course. Just use the VLAN interface names and addresses.

