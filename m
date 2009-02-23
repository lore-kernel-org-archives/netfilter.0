From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Problem with conntrackd: TCP RST sent on NAT connections
Date: Mon, 23 Feb 2009 21:34:10 +0100
Message-ID: <49A30842.9030403@netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070209090105070101010806"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------070209090105070101010806
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

For the record (users googling for problems).

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers

--------------070209090105070101010806
Content-Type: message/rfc822;
 name="Re: Problem with conntrackd: TCP RST sent on NAT connections.eml"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="Re: Problem with conntrackd: TCP RST sent on NAT connections";
 filename*1=".eml"

Return-Path: <misch@multinet.de>
Received: from ganesha.gnumonks.org ([unix socket])
	by ganesha (Cyrus v2.1.18-IPv6-Debian-2.1.18-5.1) with LMTP; Mon, 23 Feb 2009 14:45:59 +0100
X-Sieve: CMU Sieve 2.2
Return-path: <misch@multinet.de>
Envelope-to: pablo@imap.netfilter.org
Received: from vishnu.netfilter.org ([213.95.27.115])
	by ganesha.gnumonks.org with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63)
	(envelope-from <misch@multinet.de>)
	id 1Lbb8B-0003am-7a
	for pablo@imap.netfilter.org; Mon, 23 Feb 2009 14:45:59 +0100
Received: from mail.multinet.de ([82.135.103.103])
	by vishnu.netfilter.org with esmtp (Exim 4.63)
	(envelope-from <misch@multinet.de>)
	id 1Lbb89-0004eI-M3
	for pablo@netfilter.org; Mon, 23 Feb 2009 14:45:58 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multinet.de (Postfix) with ESMTP id 30D831B528
	for <pablo@netfilter.org>; Mon, 23 Feb 2009 14:15:00 +0100 (CET)
Received: from mail.multinet.de ([127.0.0.1])
 by localhost (mail.multinet.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 15548-04 for <pablo@netfilter.org>;
 Mon, 23 Feb 2009 14:14:55 +0100 (CET)
Received: from mucnb003.multinet.de (unknown [192.168.188.49])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.multinet.de (Postfix) with ESMTP id 7A14C1B5CC
	for <pablo@netfilter.org>; Mon, 23 Feb 2009 14:14:55 +0100 (CET)
From: Michael Schwartzkopff <misch@multinet.de>
Organization: MultiNET Services GmbH
To: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Mon, 23 Feb 2009 14:14:54 +0100
User-Agent: KMail/1.10.4 (Linux/2.6.27-11-server; KDE/4.1.4; i686; ; )
References: <200902201334.34830.misch@multinet.de> <499EDF13.5000302@netfilter.org>
In-Reply-To: <499EDF13.5000302@netfilter.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200902231414.54666.misch@multinet.de>
X-Virus-Scanned: amavisd-new at multinet.de
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on (none)
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.3
Subject: Re: Problem with conntrackd: TCP RST sent on NAT connections
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:51:42 +0000)
X-Spam-Score: 0.0 (/)

Am Friday 20 February 2009 17:49:23 schrieben Sie:
> Michael Schwartzkopff wrote:
> > Hi,
> >
> > I have a strange problem here. I set up a testbed like in the on on the
> > website, except that I have NAT im my scenario.
> >
> > When I test a SSH connection everything goes fine.
> >
> > When I download a file via HTTP the first failover works, but the
> > failback breaks the connection and the download stops. Tracing the
> > connection show that during the failback the HTTP Server sends a package
> > to the virtual NAT address of my firewall and the firewall send a TCP R=
ST
> > back and thus stops the connection.
> >
> > Of course I tried first to sync the connection table and after that set
> > up my virtual addresses, but it seems that it does not help.
> >
> > A similar problem was described from Abhijit Menon-Sen on Oct, 30th 2007
> > on the nf-failover mailing list. But I did not find any solution there.
> >
> > My system:
> > debian lenny.
> > Kernel 2.6.26-1-686
>
> I remember that this kernel version has some problems if your setup has
> any helper, if so, I suggest you to upgrade to latest linux kernel.
>
> > conntrackd version 0.9.6-4
>
> This is rather old conntrack-tools version. Could you try latest
> conntrack-tools version from www.netfilter.org?
>
> Using the latest primary-backup.sh script from git.netfilter.org instead
> of the old ones that you are using would be also a good idea:
>
> http://git.netfilter.org/cgi-bin/gitweb.cgi?p=3Dconntrack-tools.git;a=3Dt=
ree;f=3D
>doc/sync;h=3Dd0e3afe1bca3a581d246fa0b07b67bb8175295f6;hb=3DHEAD
>
> > Mode: FTFW, heartbeat as HA solution.
> >
> > My firewall does allow everything. The only rule is the NAT rule that
> > translats all packets comming from internal to the virtual external
> > address.
>
> Your firewall has to drop invalid packets at least, see the example
> rule-set in the website. The firewall sends a TCP RST to the client if
> it didn't find the NAT information, this happens when the conntrack
> entry does not exist.
>
> > Any idea what could be wrong? How could I trace the problem further?
>
> After the first failover, check the primary's internal cache and
> backup's external cache with the commands:
>
> show internal cache (do this in the primary):
> # conntrackd -i
>
> show external cache (do this in the backup):
> # conntrackd -e
>
> They should show the same entries.

Hi,

I did an update to:
kernel 2.6.28-1
libnfnetlink 0.0.40
libnetfilter_conntrack-0.0.99
and
conntrack-tools-0.9.11

No it seems to work everything. Thanks for your help.

Waiting to see these packages in the "usual" distributions ...

=2D-=20
Dr. Michael Schwartzkopff
MultiNET Services GmbH
Addresse: Bretonischer Ring 7; 85630 Grasbrunn; Germany
Tel: +49 - 89 - 45 69 11 0
=46ax: +49 - 89 - 45 69 11 21
mob: +49 - 174 - 343 28 75

mail: misch@multinet.de
web: www.multinet.de

Sitz der Gesellschaft: 85630 Grasbrunn
Registergericht: Amtsgericht M=FCnchen HRB 114375
Gesch=E4ftsf=FChrer: G=FCnter Jurgeneit, Hubert Martens

=2D--

PGP Fingerprint: F919 3919 FF12 ED5A 2801 DEA6 AA77 57A4 EDD8 979B
Skype: misch42

--------------070209090105070101010806--
