From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: state matching vrs prerouting.... ???
Date: 24 Mar 2003 09:43:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048495404.5175.5.camel@elendil.intranet.cartel-securite.net>
References: <20030321203706.30847.qmail@web40208.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030321203706.30847.qmail@web40208.mail.yahoo.com>
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
To: SBlaze <dagent.geo@yahoo.com>
Cc: netfilter@lists.netfilter.org

Le ven 21/03/2003 =E0 21:37, SBlaze a =E9crit :
>  That is somewhat correct. What I read in Oskar's tutorial led me to be=
lieve
> that i could preroute the CS requests so that they would in a sence byp=
ass or
> not pass through the UDP input filters. I am somewhat confused as to wh=
y they
> do?

Every packets passes through filter table. It's up to you to configure
your filtering ruleset in order to let the appropriate packets pass.

Handling packets in nat table _does not_ mean they've been accepted once
for all.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE


