From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Connections with SYN aren't NEW
Date: Sun, 14 Dec 2003 16:54:41 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312141654.41489.Antony@Soft-Solutions.co.uk>
References: <20031214162315.GA897@via.ecp.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031214162315.GA897@via.ecp.fr>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Sunday 14 December 2003 4:23 pm, Lo=EFc Minier wrote:

> I want to accept new TCP connections only if they match both --syn and =
-m
> state --state NEW.

Just out of interest, why?

What do you gain from having them match NEW, which isn't already true if =
they=20
match --syn?

Antony.

--=20
Ramdisk is not an installation procedure.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


