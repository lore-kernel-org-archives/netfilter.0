From: netfilter.lists.samba.org@marc-haber.de
Subject: Re: [despammed] port based filtering and IPsec 2.6
Date: Sat, 17 Jan 2004 18:47:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1AhuY9-0002Ze-BK@vishnu.netfilter.org>
References: <20040114162623.GR4106@openoffice.nl> <20040117134519.GA4911@kaufbach.delug.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040117134519.GA4911@kaufbach.delug.de>
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

On Sat, 17 Jan 2004 14:45:19 +0100, Andreas Kretschmer
<andreas_kretschmer@despammed.com> wrote:
>Okay, but you can't filtering packets. It's not possible to filter, for
>instance, all traffic from/to telnet-port and enable all traffic to/from
>ssh-port. For this reasen there are the ipsecX-interface in FreeSwan. On
>the ethX you see only the crypted traffic, and on ipsecX the plain
>traffic. So you can filtering, you can enable only ah/esp on ethX and
>enable only ssh on ipsecX.
>I miss this option in Kernel 2.6.

Actually, not being able to filter traffic from an ipsec tunnel is a
killer. Either for netfilter, or for kernel 2.6 ipsec. I suspect it
will kill kernel 2.6 ipsec. Which is really bad since frees/wan
positively sucks.

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

