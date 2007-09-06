From: <stevesz@enternet.hu>
Subject: Re: ipt_MASQUERADE issue
Date: Thu, 6 Sep 2007 17:58:55 +0200
Message-ID: <e10edde8f4df7199c6d1910e8747b603@62.112.192.6>
References: <46E0132F.5020802@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46E0132F.5020802@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Thu, 06 Sep 2007 16:48:15 +0200, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>=20
> stevesz@enternet.hu a =C3=A9crit :
>>=20
>> I'm using kernel v. 2.6.22.1, iptables v. 1.3.8.
>> I have an ADSL connection with dynamic IP.
>> I use ipp2p to indentify and CONNMARK to mark p2p
>> traffic. Then I classify the marked packets to a
>> low-prio class. This all work fine until the first
>> ip change comes. Because ipt_MASQUERADE flushes all
>> the conntrack entries which belong to my external
>> interface, so the marks are reset along with this.
>> Then the p2p traffic goes to the default class, which
>> is not good for me.
>=20
> I am not sure I understand what the problem is. When the IP address=20
> changes, any existing connections that were using the old IP address are =

> broken. So new connections have to be established using the new IP=20
> address. New P2P connections should be identified and marked again by=20
> ipp2p and CONNMARK, as the old ones were. Or am I missing something ?

In my firewall config it is allowed for any packet to go out from my local
network to the internet even it is not in the conntrack. So after my IP
has changed and the conntrack table's got flushed, TCP connections continue
traversing through the firewall and they get a new entry in the conntrack
table, but
without a mark. Because they don't get lost, they are not set up again,
therefore ipp2p does not recognize them. :-(
>=20
>> Is it possible to tell ipt_MASQUERADE not to flush
>> these entries, just update them with the new IP?
>> Or is there an alternative solution for this?
>=20
> You may use SNAT instead of MASQUERADE. Of course you will have to=20
> update the SNAT rule after each IP address change. Or you may hack the=20
> kernel source by commenting out the two ip_ct_iterate_cleanup() calls in =

> net/ipv4/netfilter/ipt_MASQUERADE.C and rebuild a new kernel.
>=20
> But be aware that either way will let the conntrack table filled with=20
> obsolete connections for several days after an IP address change.

I was thinking of hacking, just wanted to ask people, if there is some
other solution. My plan is to modify the code, so it would replace the old
addresses with the new one in the conntrack table keeping the port
assignments.

Thanx again. I'll try it.


