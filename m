From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Iptables do nat with Protocol 47 or GRE
Date: Fri, 14 May 2004 09:52:18 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF567933D@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

Antony Stone wrote:
> On Friday 14 May 2004 2:00 pm, Sez wrote:
>=20
>> I have a microsoft server to l2tp/ipsec. And my firewall is a Linux.
>> I understand that if i create a server in micro$oft box, i can
>> routing the traffic with Linux with any problem (no recompile,
>> multiple users, nat with l2tp/ipsec).
>=20
> Can someone who knows about L2TP / IPsec step in here please?

I am pretty sure that all distinguishable features of IPSec are vurried
inside the encrypted tunnel, which means it can't be conntracked
uniquely through NAT. So, the only way to successfully have IPSec
tunnels is hand coding each Source-Destination w/Protocol into the NAT
tables. That's how CISCO says to forward them anyways:

http://www.cisco.com/univercd/cc/td/doc/product/software/ios122/122newft
/122t/122t13/ftnatesp.htm

Since there doesn't seem to be a conntrack helper I can only assume its
because there's no session id equivilent as there is in PPTP.

