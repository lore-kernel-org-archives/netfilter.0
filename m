From: Giacomo Succi <giacomo_succi@email.it>
Subject: Question concerning tunnels
Date: Thu, 22 Jun 2006 11:44:58 +0200
Message-ID: <449A669A.10908@email.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi to all.

I've a small question concerning the tunnels in Linux.

For an university project I need to create a tunnel from a machine to another
(even if the dest machine is in a VM on the sender machine). So I looking for
the "ip tunnel" command and the related stuff.

But I didn't find the answare to this question:
In theory a tunnel entry point grab the packet, doesn't modify it in any form,
encapsulate it in another packet and it send it to de dest host. That's the way
it also work on Linux in your implementation? That's true also for the GRE tunnels?

I need the unmodified original packet. Neither in the TTL field.

Otherwise i need to do an hook in the kernel (as I already done in the past for
a similar problem).

Thanks every one for the attention and... Sorry for my english -.-.
- --
Giacomo Succi

- -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
Contacts:
eMail: giacomo_succi@email.it; AIM: Anandir82
Y!: anandir82; ICQ: 135781176
J: Anandir@jabber.org; MSN: anandir@email.it

GPG:		0x52CDCA27
GPG Server:	http://sks.keyserver.penguin.de
- -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.1 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFEmmaaUda2pFLNyicRAjUAAJ9mGxFf9tuV6zh7Bl2mme6OpjhEnQCfYlqg
HfYLDmUK8IrM0pSoEQsPJDc=
=jBTC
-----END PGP SIGNATURE-----
 

 

 --

 Email.it, the professional e-mail, gratis per te: http://www.email.it/f

 

 Sponsor:

 Crea il tuo sito web dinamico con ASP e ACCESS - VideoCorso professionale direttamente nel tuo computer. Trucchi e segreti

 Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=5143&d=22-6

