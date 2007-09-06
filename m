From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ipt_MASQUERADE issue
Date: Thu, 06 Sep 2007 16:48:15 +0200
Message-ID: <46E0132F.5020802@plouf.fr.eu.org>
References: <b70c82af8f71069ac473eeaf715dca69@62.112.192.6>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b70c82af8f71069ac473eeaf715dca69@62.112.192.6>
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

stevesz@enternet.hu a =E9crit :
>=20
> I'm using kernel v. 2.6.22.1, iptables v. 1.3.8.
> I have an ADSL connection with dynamic IP.
> I use ipp2p to indentify and CONNMARK to mark p2p
> traffic. Then I classify the marked packets to a
> low-prio class. This all work fine until the first
> ip change comes. Because ipt_MASQUERADE flushes all
> the conntrack entries which belong to my external
> interface, so the marks are reset along with this.
> Then the p2p traffic goes to the default class, which
> is not good for me.

I am not sure I understand what the problem is. When the IP address=20
changes, any existing connections that were using the old IP address are=20
broken. So new connections have to be established using the new IP=20
address. New P2P connections should be identified and marked again by=20
ipp2p and CONNMARK, as the old ones were. Or am I missing something ?

> Is it possible to tell ipt_MASQUERADE not to flush
> these entries, just update them with the new IP?
> Or is there an alternative solution for this?

You may use SNAT instead of MASQUERADE. Of course you will have to=20
update the SNAT rule after each IP address change. Or you may hack the=20
kernel source by commenting out the two ip_ct_iterate_cleanup() calls in=20
net/ipv4/netfilter/ipt_MASQUERADE.C and rebuild a new kernel.

But be aware that either way will let the conntrack table filled with=20
obsolete connections for several days after an IP address change.

