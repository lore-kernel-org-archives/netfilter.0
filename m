From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ip_conntrack_ftp problem
Date: Fri, 28 Mar 2003 13:17:50 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0303281315590.6557-100000@blackhole.kfki.hu>
References: <1048848182.17526.30.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1048848182.17526.30.camel@elendil.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: Vincent Lim <vincent.lim@nestac.com>, Budai Laszlo <lbudai@ms.sapientia.ro>, netfilter <netfilter@lists.netfilter.org>

On 28 Mar 2003, Cedric Blancher wrote:

> Le ven 28/03/2003 =E0 11:19, Vincent Lim a =E9crit :
> > RELATED is for the ftp-data connection that is established after initia=
l
> > connection attempt.
>
> To be precise, RELATED is only for the packet that initiates ftp-data
> connection. Following ones will be ESTABLISHED.
>
> A RELATED packet is similar to a NEW one, except that conntrack was
> waiting for him.

No, that's not true. Every packet handled by the helpers are RELATED.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


