From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Questions - Urgent
Date: 23 Apr 2003 09:18:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051082301.12312.7.camel@elendil.intranet.cartel-securite.net>
References: <sea17821.054@mail.bsos.umd.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <sea17821.054@mail.bsos.umd.edu>
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
To: Jitin Sahni <jsahni@umcqp.umd.edu>
Cc: netfilter@lists.netfilter.org

Le sam 19/04/2003 =E0 22:23, Jitin Sahni a =E9crit :
> I have following questions regarding Netfilter/Iptables.
[...]
> 1. What Attacks does it protect against?

Netfilter is a packet filter. So, it protects your networks as it
provides network level access control. It also provides full NAT
capabilities that are not really security feature, but are usually part
of it.

> 2. What are the Compatibility Issuses?

Compatibility problems occurs on conntrack and NAT for protocols that
includes address and ports negociation within the application flow. FTP
and H323 are well known examples. Netfilter supports some of theses
protocoles, but not all of them. Some of them are partially supported.

> 3. Dow do we implement this technology?

Install Linux 2.4 kernel based distribution, read HOWTOs and go on.

> 4. How commonly is this used?

Just have a look at what a packet filter is. Netfilter is mainly used to
implement firewalls.

> 5. when do you think one should use it?

Mainly when you want to :
	. restrict network level access to your IS
	. provide NAT capabilities

Many others features are available.

See http://www.netfilter.org/

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

