From: Andreas Kretschmer <andreas_kretschmer@despammed.com>
Subject: Re: [despammed] Netfilter as an application.
Date: Fri, 16 Jan 2004 17:55:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040116165548.GA5166@kaufbach.delug.de>
References: <20040116163906.40844.qmail@web40307.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040116163906.40844.qmail@web40307.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

am  Fri, dem 16.01.2004, um  8:39:06 -0800 mailte kernel_learner folgendes:
>  How's it going! I am looking for something that I am
> not sure currently exists. Basically I want to make a
> version of netfilter that's free from all the
> kernel-level and networking stack hooks. I am looking
> for a plain simpler version of netfilter which does
> not interact with the kernel or the networking stack
> in any way. It would be a standard user program which
> a person with normal privelges could compile and run.

Very bad. Every can modify the rules. I think, you search 'Zonealarm for
Linux'.



> What would it do? It could do the same things that
> netfilter does...i.e. filter packets/NAT etc. However

Why?


> Does such a thing exist?

I hope: no.


>=20
> How easy/difficult would it be to hack into the
> current netfilter code to remove all the
> networking/kernel hooks it has?

This is not the intention of netfilter.


Andreas
--=20
Diese Message wurde erstellt mit freundlicher Unterst=FCtzung eines freilau-
fenden Pinguins aus artgerechter Freilandhaltung.   Er ist garantiert frei
von Micro$oft'schen Viren. (#97922 http://counter.li.org)     GPG 7F4584DA
Was, Sie wissen nicht, wo Kaufbach ist? Hier: N 51.05082=B0, E 13.56889=B0 =
;-)

