From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ip_conntrack_ftp problem
Date: 28 Mar 2003 11:43:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048848182.17526.30.camel@elendil.intranet.cartel-securite.net>
References: <3E83FC78.7080801@ms.sapientia.ro>
	 <1048840079.1236.45.camel@vincentlim>  <3E841938.3050708@ms.sapientia.ro>
	 <1048846747.1476.57.camel@vincentlim>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1048846747.1476.57.camel@vincentlim>
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

Le ven 28/03/2003 =E0 11:19, Vincent Lim a =E9crit :
> RELATED is for the ftp-data connection that is established after initia=
l
> connection attempt.

To be precise, RELATED is only for the packet that initiates ftp-data
connection. Following ones will be ESTABLISHED.

A RELATED packet is similar to a NEW one, except that conntrack was
waiting for him.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE


