From: "Cedric Blancher" <blancher@cartel-securite.fr>
Subject: Re: filtering incoming FTP requests through a firewall
Date: Fri, 25 Apr 2003 08:31:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006201c30af4$48fa0a30$0e0aa8c0@Nussele>
References: <Pine.LNX.4.44.0304242206230.21883-100000@dell>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: "Robert P. J. Day" <rpjday@mindspring.com>, iptables mailing list <netfilter@lists.netfilter.org>

----- Original Message -----
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: "iptables mailing list" <netfilter@lists.netfilter.org>
Sent: Friday, April 25, 2003 4:10 AM
Subject: filtering incoming FTP requests through a firewall

>   i only partially recall a very recent query involving filtering
> incoming FTP requests through a firewall to an internal LAN.
>   i wasn't surprised to see that DNAT was part of the solution,
> but i also recall that it didn't seem that the firewall was
> actually doing any filtering, just DNATting.

Netfilter has both NAT and filtering framework, that are clearly separated
as different tables so the box can achieve both of them.

>   just from memory (and i could be wrong), i got the impression
> that it was being left to the internal hosts to do that actual
> filtering.

Nope.

>   i'm assuming that it would be possible to do both the DNATting
> and filtering at the firewall with DNAT and the FORWARD chain
> of the filter table, no?

Just implement DNAT rules in nat table PREROUTING chain, and packet
filtering in filter table FORWARD chain. You just have to take care the fact
that once packet reaches FORWARD chain, its destination has already be
altered by NAT, which can be a problem if you want to discriminate NATed
packets from packets that were directly destined to final internal host.
This discrimination can be achieved using mangle table MARK target along
with mark match, or use patch'o'matic conntrack match.

--
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curit=
=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE



