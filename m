From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Problem VPN through iptables
Date: Mon, 23 Aug 2004 08:25:57 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512B2@asimail2.alphanumeric.com>
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

> Hello!
>
> I habe a problem with VPN (PPTP) through a FW (iptables)
>
> Exercise:
> I want through a iptables-fw to a ms vpn server.
> (INTERNET) -> FW(iptables) -> VPN (PPTP MS SERVER)
>
> I am able to make a vpn connect when I am in the same net. So VPN =
Server works fine.
> When I try to connect the VPN server from outside I get an Err 721.
> when i trace the session with tcpdump, I see traffic in both =
directions (GRE and TCP 1721)
> With a sniffer at MS VPN Server I see incoming and outgoing traffic.
>
> I do not know what I make wrong!
>
> Hier ar my rules for the FW

you need to have the PPTP conntrack patch from patch-o-matic to make =
this work.  the PPTP conntrack patch is only supported with 2.4 kernels.

POM is available from:  http://www.netfilter.org/downloads.html

and includes easy-to-follow instructions.  it will require you to =
rebuild your kernel.  the patch you're interested in is =
"extra/pptp-conntrack-nat."

once you've got your kernel & userland rebuilt, you'll have the =
following modules available:

ip_conntrack_pptp.o
ip_nat_pptp.o
ip_conntrack_proto_gre.o
ip_nat_proto_gre.o

-j

