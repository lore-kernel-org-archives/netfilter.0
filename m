From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: how to use ipt_limit.o?
Date: 09 Dec 2002 11:05:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039428329.8888.14.camel@elendil.intranet.cartel-securite.net>
References: <000d01c29f26$0c4f9170$9801010a@winxp>
	 <1039427039.8900.11.camel@elendil.intranet.cartel-securite.net>
	 <007e01c29f69$5b3c82f0$9801010a@winxp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007e01c29f69$5b3c82f0$9801010a@winxp>
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
To: Peter <chenlf@cibn.com>
Cc: netfilter@lists.netfilter.org

Le lun 09/12/2002 =E0 10:57, Peter a =E9crit :
> iptables -A INPUT -p tcp --syn --dport http -j USER_CHAIN
> iptables v1.2.7a: Couldn't load target `USER_CHAIN':/usr/local/lib/ipta=
bles/libipt_USER_CHAIN.so: cannot open shared object file: No such file o=
r directory
> why?

USER_CHAIN is a user chain... You have to create it before you can send
packets to it...

# iptables -N USER_CHAIN

This is basic iptables stuff, so you really should read basic iptables
documentation, as it seems quite obvious to me you did not.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

