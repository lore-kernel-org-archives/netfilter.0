From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ip_conntrack_ftp problem
Date: 28 Mar 2003 18:06:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048871187.4872.13.camel@elendil.intranet.cartel-securite.net>
References: <3E83FC78.7080801@ms.sapientia.ro>
	 <1048840079.1236.45.camel@vincentlim>  <3E841938.3050708@ms.sapientia.ro>
	 <1048846747.1476.57.camel@vincentlim>
	 <1048848182.17526.30.camel@elendil.intranet.cartel-securite.net>
	 <1048849173.1476.62.camel@vincentlim>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1048849173.1476.62.camel@vincentlim>
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
To: Vincent Lim <vincent.lim@nestac.com>
Cc: Budai Laszlo <lbudai@ms.sapientia.ro>, netfilter <netfilter@lists.netfilter.org>

Le ven 28/03/2003 =E0 11:59, Vincent Lim a =E9crit :
> So, initially..the replying packets need to match the ESTABLISHED?
> (I'm asking this because Budai's initial rules only had RELATED and his
> ftp wasn't working)
> Then after establishing the RELATED ftp-data, subsequent packets match
> the ESTABLISHED again?

You have two connections :

	ftp
	ftp-data

First ftp connection packet is NEW, others are ESTABLISHED. Then, a
ftp-data connection is built. First ftp-data connection packet is
RELATED, others are ESTABLISHED.

Problem with Budai's ruleset is that it does not accept ESTABLISHED
packet in FORWARD chain, as you told him at first with the rule that
fixes the issue.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

