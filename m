From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: urgent question!
Date: 10 Jan 2003 13:39:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042202377.10157.17.camel@elendil.intranet.cartel-securite.net>
References: <000801c2b7e2$52bcec00$f7ef6c50@dom.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000801c2b7e2$52bcec00$f7ef6c50@dom.local>
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

Le jeu 09/01/2003 =E0 14:23, Max ZAUNER a =E9crit :
> i am rookie in linux. anyway, during my firewall setup everything
> installed properly. after starting my firewall a message pops up
> saying:=20
> cannot load module: libipt_-j.so

I think you've let a lonely -m switch, meaning without module reference.

cbr@elendil:~$ sudo iptables -A INPUT -m -j
iptables v1.2.7a: Couldn't load match
`-j':/usr/local/lib/iptables/libipt_-j.so: cannot open shared object
file: No such file or directory

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

