From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: test iptables for PPTP patch
Date: Thu, 19 Aug 2004 07:39:17 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512A9@asimail2.alphanumeric.com>
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

> I have just upgraded to iptables 1.2.11 and run p-o-m ng 20040621, how =
can I
> make sure that I have PPTP nat'ing available?
>
> Paulo

if you compiled them as modules:

# modprobe ip_conntrack_pptp
# modprobe ip_nat_pptp
# modprobe ip_conntrack_proto_gre
# modprobe ip_nat_proto_gre

-j

