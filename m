From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: using iptables and masquerade to change IP in data portion
Date: Thu, 27 Mar 2003 09:29:11 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DA3@alderaan.smgtec.com>
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

Some protocols like Net8 or T3 like to include hostnames / IP addresses
in their data segments, like you said, but in order to do a replace, you
need to interpret the application protocol. You can perform this two
ways, one easy and bad, and one difficult and elegant.

1. Write iptables NAT and conntrack modules for the protocol that you
are using. This will allow mangling of anything you like. Although, the
work involved can be inhibitive of whatever you are doing this for.

2. You could always hack this and just write a userspace proxy that
mangles the packet as it is going through, but this isn't that elegant
at all. I tried doing this and it does break some protocols.

If you say your protocol, maybe there are other workarounds which we can
suggest.


