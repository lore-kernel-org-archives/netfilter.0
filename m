From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ip6tables and -m state
Date: Thu, 11 Dec 2003 09:25:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071131113.777.6.camel@elendil.intranet.cartel-securite.net>
References: <1071115593.28281.4.camel@tribeca.formanonline.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-16T+LIrzOO12hkrKsYOr"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1071115593.28281.4.camel@tribeca.formanonline.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Jeffrey Forman <jforman@formanonline.com>
Cc: netfilter@lists.netfilter.org


--=-16T+LIrzOO12hkrKsYOr
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

Le jeu 11/12/2003 =E0 05:06, Jeffrey Forman a =E9crit :
> i was wondering if there is a way to do connection tracking with
> ip6tables as ipv4 iptables does?

Not yet.
But developpers are working on it. A patch was submitted on
netfilter-devel mailing list for 2.6 kernel by Yasuyuki Kozakai (24
sept. 2003) from USAGI project.

I attached a later post from him.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

--=-16T+LIrzOO12hkrKsYOr
Content-Disposition: inline
Content-Type: message/rfc822

Return-Path: <netfilter-devel-admin@lists.netfilter.org>
Received: from spoutnik.cartel-securite.net ([unix socket]) by spoutnik
	(Cyrus v2.2.0-ALPHA) with LMTP; Thu, 13 Nov 2003 14:07:37 +0100
X-Sieve: CMU Sieve 2.2
Received: from mtaav1.cartel-info.fr (mtaav1.cartel-info.fr
	[194.3.136.194]) by spoutnik.cartel-securite.net (8.12.9/8.12.9) with ESMTP
	id hADD7YHF019913 (version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168
	verify=FAIL) for <blancher@cartel-securite.fr>; Thu, 13 Nov 2003 14:07:34
	+0100
Received: from ns1.cartel-info.fr (localhost.localdomain [127.0.0.1]) by
	mtaav1.cartel-info.fr (8.12.9/8.12.9/Cartel Informatique MTA1 -
	postmaster@cartel-info.fr) with ESMTP id hADD7VPh026310 for
	<blancher@cartel-securite.fr>; Thu, 13 Nov 2003 14:07:31 +0100
X-Authentication-Warning: mtaav1.cartel-info.fr: Host localhost.localdomain
	[127.0.0.1] claimed to be ns1.cartel-info.fr
Received: from lakshmi.netfilter.org (lakshmi.netfilter.org [62.128.28.23])
	by ns1.cartel-info.fr (8.12.10/8.12.9/Cartel Informatique MTA1 -
	postmaster@cartel-info.fr) with ESMTP id hADD4VmO024967
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=FAIL) for
	<blancher@cartel-securite.fr>; Thu, 13 Nov 2003 14:04:33 +0100
Received: from netfilter-sponsored-by.noris.net ([62.128.28.62]) by
	lakshmi.netfilter.org with esmtp (Exim 4.22 #1 (Debian)) id
	1AKH8Q-0001Ya-23; Thu, 13 Nov 2003 14:03:42 +0100
Received: from inet-tsb.toshiba.co.jp ([202.33.96.40]) by
	vishnu.netfilter.org with esmtp (Exim 4.22 #1 (Debian)) id 1AKH8R-0005aF-E6
	for <netfilter-devel@lists.netfilter.org>; Thu, 13 Nov 2003 14:03:43 +0100
Received: from tsb-wall.toshiba.co.jp ([133.199.160.134]) by
	inet-tsb.toshiba.co.jp  with ESMTP id hADD3Oe9016796; Thu, 13 Nov 2003
	22:03:24 +0900 (JST)
Received: (from root@localhost) by tsb-wall.toshiba.co.jp  id
	hADD3P5Y002235; Thu, 13 Nov 2003 22:03:25 +0900 (JST)
Received: from tis2 [133.199.160.66] by tsb-wall.toshiba.co.jp with SMTP id
	YAA02233 ; Thu, 13 Nov 2003 22:03:24 +0900
Received: from mx.toshiba.co.jp by tis2.tis.toshiba.co.jp  id WAA00387;
	Thu, 13 Nov 2003 22:03:24 +0900 (JST)
Received: by toshiba.co.jp id WAA28664; Thu, 13 Nov 2003 22:03:22 +0900
	(JST)
Message-Id: <200311131303.WAA28664@toshiba.co.jp>
To: matti.aarnio@zmailer.org
Cc: netfilter-devel@lists.netfilter.org
Subject: Re: Status of IPv6 conn-tracking in 2.4.x series ?
From: Yasuyuki Kozakai <yasuyuki.kozakai@toshiba.co.jp>
In-Reply-To: <20031113010159.GD835@mea-ext.zmailer.org>
References: <20031113010159.GD835@mea-ext.zmailer.org>
X-Mailer: Mew version 3.3 on Emacs 20.7 / Mule 4.0 (HANANOEN)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Score: -5.1 (-----)
Sender: netfilter-devel-admin@lists.netfilter.org
Errors-To: netfilter-devel-admin@lists.netfilter.org
X-BeenThere: netfilter-devel@lists.netfilter.org
X-Mailman-Version: 2.0.11
Precedence: bulk
List-Help: <mailto:netfilter-devel-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter-devel@lists.netfilter.org>
List-Subscribe: 
	<https://lists.netfilter.org/mailman/listinfo/netfilter-devel>,
	<mailto:netfilter-devel-request@lists.netfilter.org?subject=subscribe>
List-Id: discussion about netfilter development
	<netfilter-devel.lists.netfilter.org>
List-Unsubscribe: 
	<https://lists.netfilter.org/mailman/listinfo/netfilter-devel>,
	<mailto:netfilter-devel-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter-devel/>
Date: Thu, 13 Nov 2003 22:03:21 +0900 (JST)
X-Spam-Status: No, hits=0 required=5
X-Scanned-By: MIMEDefang 2.38
X-Evolution-Source: imap://cbr;auth=DIGEST-MD5@spoutnik.cartel-securite.net/


Hi,

From: Matti Aarnio <matti.aarnio@zmailer.org>
Date: Thu, 13 Nov 2003 03:01:59 +0200

> Dear Netfilter-devel,
> 
> Could somebody tell to me, what is present status in IPv6
> connection-tracking filters of netfilter codes ?  Having
> browsed your CVS, there are some versions of such, and
> tantalizing glimpses of somebody doing development in
> some bitkeeper somewhere...

If you want to use ip6_conntrack ASAP, you can find the patch in archives
of this list(24 Sep. 2003).

Or in USAGI kernel, too. http://www.linux-ipv6.org/

BTW, this patch works only with Linux 2.6. If you want to use it with
Linux 2.4, some changes are needed. ex) replace synchronize_net() to
br_write_{un}lock_bh(), fix the codes related to nf_reinject() in
ip6_conntrack_reasm.c.

----------------------------------------
Yasuyuki KOZAKAI

Communication Platform Laboratory,
Corporate Research & Development Center,
Toshiba Corporation

yasuyuki.kozakai@toshiba.co.jp
----------------------------------------

--=-16T+LIrzOO12hkrKsYOr--

