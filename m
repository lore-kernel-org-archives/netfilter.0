From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: port based filtering and IPsec 2.6
Date: Sun, 18 Jan 2004 10:14:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1Ai91E-0007XZ-Is@vishnu.netfilter.org>
References: <20040114162623.GR4106@openoffice.nl> <20040117134519.GA4911@kaufbach.delug.de> <E1AhuY9-0002Ze-BK@vishnu.netfilter.org> <200401171829.56492.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401171829.56492.Antony@Soft-Solutions.co.uk>
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

On Sat, 17 Jan 2004 18:29:56 +0000, Antony Stone
<Antony@Soft-Solutions.co.uk> wrote:
>On Saturday 17 January 2004 5:47 pm, =
netfilter.lists.samba.org@marc-haber.de=20
>wrote:
>> Actually, not being able to filter traffic from an ipsec tunnel is a
>> killer. Either for netfilter, or for kernel 2.6 ipsec. I suspect it
>> will kill kernel 2.6 ipsec. Which is really bad since frees/wan
>> positively sucks.
>
>What do you think is wrong with FreeS/WAN?

=46reeS/WAN is - as somebody else said very nicely - at war with the
kernel routing machinery. It makes me sick to see two identical
routing table entries, one pointing to the physical interface and one
pointing to the logical interface, with some hidden magic favoring the
ipsec0 route.

=46reeS/WAN is a kernel patch with a very strange applying mechanism
which makes it hard but impossible to use any pre-fabricated patching
framework. I have never been able to get the new module approach to
run. FreeS/WAN needs to be tailored for each new kernel version which
keeps the possibility of a new exploit being fixed, breaking
=46reeS/WAN, forcing me to choose between staying exploitable or living
without my VPN connections until the FreeS/WAN project has adapted.

The latest FreeS/WAN version I have successfully used is 1.99. Later
versions insist on establishing a "default route" (manifested as one
route for 0.0.0.0/1 and one for 128.0.0.0/1 which is one more proof of
being at war with the normal routing mechanisms) which breaks the test
boxes unencrypted network connection.

The FreeS/WAN-Users mailing list is flooded with spam because the
mailing list owners refuse to establish even the most trivial of spam
prevention measure because they're afraid of handicapping free speech
without realizing that a spam flooded mailing list is a bad handicap
of free speech because nobody would use it.

I hope that I made my point clear.

Greetings
Marc

--=20
-------------------------------------- !! No courtesy copies, please !! =
-----
Marc Haber          |   " Questions are the         | Mailadresse im =
Header
Karlsruhe, Germany  |     Beginning of Wisdom "     | Fon: *49 721 966 32=
 15
Nordisch by Nature  | Lt. Worf, TNG "Rightful Heir" | Fax: *49 721 966 31=
 29

