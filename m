From: "Matthew G. Marsh" <mgm@paktronix.com>
Subject: Re: linux router announces bad ip/mac
Date: Wed, 6 Nov 2002 10:21:44 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.43.0211061014300.1572-100000@netmonster.pakint.net>
References: <3.0.1.16.20021106084719.230ff560@s-net-04.besancon.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3.0.1.16.20021106084719.230ff560@s-net-04.besancon.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Thierry ITTY <thierry.itty@besancon.org>
Cc: netfilter@lists.netfilter.org

On Wed, 6 Nov 2002, Thierry ITTY wrote:

> Hello

[snip]

> OK, now here's the problem I get :
> when the box is in router mode, it answers to ARP requests asking for
> 192.168.1.1 coming on NIC B (sent all from the B side PCs in their norm=
al
> network operation process) with NIC B's mac address. this is fine
> BUT, it also answers to ARP requests asking for 192.168.1.1 coming on N=
IC A
> (sent all from the A side PCs) with NIC A's mac address. and this is of
> course wrong, because A side PCs then send their routed traffic to the

No this is correct behaviour of the Linux kernel IP stack. Go do a search
on "weak host" vs. "strong host" ARP. Linux conforms to the weak host
model and thus will always respond on all interfaces for all IP addresses
assigned to the box. It is actually one of the most powerful features of
using Linux in secure environments.

When you do the search please make sure to read RFC1122  referenced as
Linux follows the weak host model explained therein quite well.

> linux box (which obviously doesn't handle it) instead of sending it to =
the
> true router.
>
> what causes this behaviour (responding on the A side to arp requests wh=
ich
> it should not answer to) and how can I cure it ?

It should answer that way as it implements the weak host model.

> tia
> 			- * - * - * - * - * - * -
> Bien s=FBr que je suis perfectionniste !
> Mais ne pourrais-je pas l'=EAtre mieux ?
> 	Thierry ITTY
> eMail : Thierry.Itty@Besancon.org		FRANCE

--------------------------------------------------
Matthew G. Marsh,  President
Paktronix Systems LLC
1506 North 59th Street
Omaha  NE  68104
Phone: (402) 932-7250 x101
Email: mgm@paktronix.com
WWW:  http://www.paktronix.com
--------------------------------------------------


